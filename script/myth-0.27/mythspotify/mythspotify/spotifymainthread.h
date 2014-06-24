#ifndef SPOTIFYMAINTHREAD_H
#define SPOTIFYMAINTHREAD_H
// qt
#include <QThread>
#include <QMutex>
// mythspotify
#include "spotifyapi.h"

class SpotifyMainThread : public QThread {
        public:
            SpotifyMainThread(QMutex* mutex);
            virtual ~SpotifyMainThread();
            void run();
            void Quit();
            void SetSession(sp_session* session);
        private:
            QMutex* m_mutex;
            sp_session* m_session;
            volatile bool m_running;
};

#endif
