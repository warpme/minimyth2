#ifndef AUDIOQUEUE_H
#define AUDIOQUEUE_H

// c++
#include <queue>
// qt
#include <QMutex>
// mythspotify
#include "audiodata.h"

using std::queue;

class AudioQueue {
    public:
        AudioQueue();
        ~AudioQueue();
        AudioData* Next();
        void Push(AudioData* audio_data);
        void Flush();
        int Length();
        int NumSamples();
    private:
        static queue<AudioData*> m_audioqueue;
        static QMutex* m_mutex;
        static int m_numsamples;
        static int m_refcount;
};

#endif
