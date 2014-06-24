#ifndef PLAYLIST_H
#define	PLAYLIST_H

#include <QString>
#include <QList>

class Track;

class Playlist {
    friend class SpotifyStreamer;
    public:
        Playlist(const QString& name, int id, const QString& system);
        virtual ~Playlist();
        QString GetName();
        QString GetSystem();
        int GetID();
        int GetNumTracks();
        QList<Track*> GetTracklist();
    protected:
        void AddTrack(Track*& track);
        void DelTrack(Track*& track);
    private:
        QString m_name;
        QString m_system;
        int m_id;
        QList<Track*> m_tracks;      
};

#endif

