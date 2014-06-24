#ifndef MUSICSTREAMER_H
#define MUSICSTREAMER_H
// qt
#include <QObject>
#include <QString>
#include <QList>
// mythspotify
#include "track.h"
#include "playbackmode.h"
#include "art.h"
#include "imagetype.h"


class Playlist;

class MusicStreamer : public QObject {
    Q_OBJECT
    public:
        MusicStreamer() {};
        virtual ~MusicStreamer() {};
        virtual void Search(const QString& query, int track_offset, int track_count, int album_offset, int album_count, int artist_offset, int artist_count) = 0;
        virtual bool Login(const QString& username, const QString& password) = 0;
        virtual void Logout() = 0;
        virtual void LoadPlaylists() = 0;
        virtual void LoadToplist() = 0;
        virtual void LoadInbox() = 0;
        virtual void LoadStarred() = 0;
        virtual void LoadTrack(Track *track) = 0;
        virtual void TogglePause() = 0;
        virtual void FastForward(int amount) = 0;
        virtual void Rewind(int amount) = 0;
        virtual bool Init() = 0;
        virtual void LoadAlbumArt(Track* track) = 0;
		virtual void LoadPlaylistArt(Playlist* playlist) = 0;
		virtual void LoadArtistArt(Track* track) = 0;
        virtual void Play() = 0;
        virtual void Stop() = 0;
        virtual void PlaylistAddTrack(Playlist*& playlist, Track*& track) = 0;
        virtual void PlaylistDelTrack(Playlist*& playlist, Track*& track) = 0;
        
    signals:
        void sig_error(QString error);
        void sig_message(QString message);
        void sig_art_loaded(Art* art, ImageType type);
		void sig_playlist_art_loaded(Art* art, ImageType type);
        void sig_logged_in();
        void sig_logged_out();
        void sig_search_completed(Playlist* playlist);
        void sig_playlists_loaded(QList<Playlist*> playlists);
        void sig_toplist_loaded(Playlist* playlist);
        void sig_inbox_loaded(Playlist* playlist);
        void sig_starred_loaded(Playlist* playlist);
        void sig_track_loaded();
	    void sig_end_of_track();
        void sig_playback_status(int time);
        
    protected:
        QString m_system;
};

#endif
