// mythspotify
#include "track.h"

Track::Track(const QString& nametrack, const QString& namealbum, const QString& nameartist, int popularity, int duration, int year, bool available, bool starred) {
    m_nametrack = QString(nametrack);
    m_namealbum = QString(namealbum);
    m_nameartist = QString(nameartist);
    m_popularity = popularity;
    m_duration = duration;
    m_year = year;
    m_available = available;
    m_starred = starred;
}

Track::~Track() {

}


QString Track::GetNameTrack() {
    return m_nametrack;
}

QString Track::GetNameAlbum() {
    return m_namealbum;
}

QString Track::GetNameArtist() {
    return m_nameartist;
}

int Track::GetPopularity() {
    return m_popularity;
}

int Track::GetDuration() {
    return m_duration;
}

int Track::GetYear() {
    return m_year;
}

bool Track::IsAvailable() {
    return m_available;
}

bool Track::IsStarred() {
    return m_starred;
}

