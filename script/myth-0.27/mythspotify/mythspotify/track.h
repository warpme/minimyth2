#ifndef TRACK_H
#define	TRACK_H

// qt
#include <QString>

class Track {
    public:
        Track(const QString& nametrack, const QString& namealbum, const QString& nameartist, int popularity, int duration, int year, bool available, bool starred);
        virtual ~Track();
        QString GetNameTrack();
        QString GetNameAlbum();
        QString GetNameArtist();
        int GetPopularity();
        int GetDuration();
        int GetYear();
        bool IsAvailable();
        bool IsStarred();
    private:
        QString m_nametrack;
        QString m_namealbum;
        QString m_nameartist;
        int m_popularity;
        int m_duration;
        int m_year;
        bool m_available;
        bool m_starred;
    
};

#endif

