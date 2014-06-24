// qt
#include <QDebug>
// mythspotify
#include "spotifymainthread.h"
#include "musicstreamer.h"


SpotifyMainThread::SpotifyMainThread(QMutex* mutex) {
    m_mutex = mutex;
    m_running = true;
}

SpotifyMainThread::~SpotifyMainThread() {
    
}

void SpotifyMainThread::run() {
    while(m_running) {
        int timeout = 0;
        m_mutex->lock();
        sp_session_process_events(m_session, &timeout);
        m_mutex->unlock();
        usleep(timeout + 10);     
    }
}

void SpotifyMainThread::Quit() {
    m_running = false;
}

void SpotifyMainThread::SetSession(sp_session* session) {
    m_session = session;
}
