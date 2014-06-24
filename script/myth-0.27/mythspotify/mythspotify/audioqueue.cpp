// mythspotify
#include "audioqueue.h"

QMutex* AudioQueue::m_mutex = NULL;
queue<AudioData*> AudioQueue::m_audioqueue;
int AudioQueue::m_numsamples = 0;
int AudioQueue::m_refcount = 0;

AudioQueue::AudioQueue() {
    if(m_mutex == NULL)
        m_mutex = new QMutex();
    m_refcount++;
}

AudioQueue::~AudioQueue() {
    if(--m_refcount <= 0) {
        Flush();
        delete m_mutex;
        m_mutex = NULL;
    }
}

void AudioQueue::Push(AudioData* audio_data) {
    m_mutex->lock();
    m_numsamples += audio_data->GetNumSamples();
    m_audioqueue.push(audio_data);
    m_mutex->unlock();
}

AudioData* AudioQueue::Next() {
    m_mutex->lock();
    AudioData* ad = NULL;
    if(m_audioqueue.size() > 0) {
        ad = m_audioqueue.front();
        m_numsamples -= ad->GetNumSamples();
        m_audioqueue.pop();
    }
    m_mutex->unlock();
    return ad;
}

void AudioQueue::Flush() {
    m_mutex->lock();
    while(m_audioqueue.size() > 0) {
        AudioData* ad = m_audioqueue.front();
        m_audioqueue.pop();
        delete ad;
    }
    m_numsamples = 0;
    m_mutex->unlock();
}

int AudioQueue::Length() {
    m_mutex->lock();
    int length = m_audioqueue.size();
    m_mutex->unlock();
    return length;
}

int AudioQueue::NumSamples() {
    return m_numsamples;
}
