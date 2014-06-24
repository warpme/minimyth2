// mythspotify
#include "playlist.h"
#include "track.h"

Playlist::Playlist(const QString& name, int id, const QString& system) {
    m_name = QString(name);
    m_id = id;
    m_system = QString(system);
}

Playlist::~Playlist() {
    for(int i = 0; i < m_tracks.size(); i++) {
        delete m_tracks[i];
    }
    m_tracks.clear();
}

QString Playlist::GetName() {
    return m_name;
}

QString Playlist::GetSystem() {
    return m_system;
}

int Playlist::GetID() {
    return m_id;
}

int Playlist::GetNumTracks() {
    return m_tracks.size();
}

void Playlist::AddTrack(Track*& track) {
    if(track != NULL)
        m_tracks.push_back(track);
}

void Playlist::DelTrack(Track*& track) {
    int index = m_tracks.indexOf(track);
    if(index != -1) {
        delete m_tracks.takeAt(index);
        track = NULL;
    }
}

QList<Track*> Playlist::GetTracklist() {
    return m_tracks;
}
        