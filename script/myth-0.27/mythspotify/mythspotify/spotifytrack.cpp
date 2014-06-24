// mythspotify
#include "spotifytrack.h"

SpotifyTrack::SpotifyTrack(sp_track* track, const QString& nametrack, const QString& namealbum, const QString& nameartist, int popularity, int duration, int year, bool available, bool starred, int position)
                : Track(nametrack, namealbum, nameartist, popularity, duration, year, available, starred) {
    m_track = track;
    m_position = position;
    sp_track_add_ref(m_track);
}

SpotifyTrack::~SpotifyTrack() {
    sp_track_release(m_track);
}

sp_track* SpotifyTrack::GetTrackObject() {
    return m_track;
}

int SpotifyTrack::GetPosition() {
    return m_position;
}

void SpotifyTrack::SetPosition(int position) {
    m_position = position;
}
