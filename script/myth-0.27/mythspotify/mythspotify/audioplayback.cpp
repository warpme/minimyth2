//
#include "audioplayback.h"
#include "audioqueue.h"
// qt
#include <QString>
#include <QDebug>   
#include <QFile>
#include <QDataStream>
#include <QIODevice>
// mythtv
#include <audiooutput.h>
#include <mythcorecontext.h>

#define CHANNELS 2
#define SAMPLERATE 44100

AudioPlayback::AudioPlayback(QMutex* mutex) : QThread() {
    m_mutex = mutex;
    m_wait = new QMutex();
    m_audiooutput = NULL;
    m_audioqueue = new AudioQueue();
    m_cond = new QWaitCondition();
    m_paused = false;
    m_running = true;
    m_stopped = true;
    m_initialized = false;
}

AudioPlayback::~AudioPlayback() {
    delete m_audiooutput;
    m_audiooutput == NULL;
    delete m_audioqueue;
    delete m_wait;
    delete m_cond;
}

bool AudioPlayback::Init(int channels, int sample_rate) {
    if(m_stopped)
        return false;

    if(m_audiooutput == NULL) {
        QString passthru = gCoreContext->GetNumSetting("PassThruDeviceOverride", false) 
                                ? gCoreContext->GetSetting("PassThruOutputDevice") : QString::null;
        QString device = gCoreContext->GetSetting("AudioOutputDevice");
        
        
        m_audiooutput = AudioOutput::OpenAudio(device, passthru, FORMAT_S16, channels,
                                           0, sample_rate, AUDIOOUTPUT_MUSIC, true, false);      
    } else {
        return true;
    }
    
    bool error = (m_audiooutput == NULL) ? true : false;
    m_initialized = !error;
    
    return !error;
}

bool AudioPlayback::IsInitialized() {
    return m_initialized;
}

bool AudioPlayback::IsStopped() {
    return m_stopped;
}

bool AudioPlayback::IsPaused() {
    return m_paused;
}

void AudioPlayback::Stop() {
    m_stopped = true;
}

void AudioPlayback::Start() {
    m_stopped = false;
    if(!m_initialized)
        Init(CHANNELS, SAMPLERATE);
    m_cond->wakeAll();
}

void AudioPlayback::TogglePause(bool pause) {
    m_paused = pause;
}

void AudioPlayback::Quit() {
    m_running = false;
    m_cond->wakeAll();
}

void AudioPlayback::run() {
    while(m_running) {
        
        //Wait for audio to initialize
        if(m_stopped) {
            m_wait->lock();
            m_cond->wait(m_wait);
            m_wait->unlock();
        }
        
        m_mutex->lock();
        if(m_audiooutput != NULL) {
            msleep(m_audiooutput->GetAudioBufferedTime() / 2);
            m_mutex->unlock();

            AudioData* ad = m_audioqueue->Next();

            m_mutex->lock();
            if(ad != NULL) {
                double secs = (double)ad->GetNumSamples() / (double)44100;
                int time = secs * 1000;
                emit sig_playback_status(time);
                m_audiooutput->AddFrames(ad->GetSamples(), ad->GetNumSamples(), -1);
                m_audiooutput->Drain();
                
                delete ad;
            }

        }
        m_mutex->unlock();

    }
}

AudioQueue* AudioPlayback::GetAudioQueue() {
    return m_audioqueue;
}
