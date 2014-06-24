#ifndef AUDIOPLAYBACK_H
#define	AUDIOPLAYBACK_H

// qt
#include <QThread>
#include <QMutex>
#include <QWaitCondition>

class AudioOutput;
class AudioQueue;

class AudioPlayback : public QThread {
    Q_OBJECT
    public:
        AudioPlayback(QMutex* mutex);
        ~AudioPlayback();
        bool Init(int channels, int sample_rate);
        void Stop();
        void Start();
        void TogglePause(bool pause);
        void run();
        AudioQueue* GetAudioQueue();
        void Quit();
        bool IsInitialized();
        bool IsStopped();
        bool IsPaused();
    signals:
        void sig_playback_status(int time);
    private:
        QMutex* m_mutex;
        QMutex* m_wait;
        QWaitCondition* m_cond;
        AudioOutput* m_audiooutput;
        AudioQueue* m_audioqueue;
        bool m_paused;
        bool m_stopped;
        volatile bool m_running;
        bool m_initialized;

};

#endif	/* AUDIOPLAYBACK_H */

