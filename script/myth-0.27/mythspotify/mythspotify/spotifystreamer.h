#ifndef SPOTIFYSTREAMER_H
#define	SPOTIFYSTREAMER_H

// mythspotify
#include "musicstreamer.h"
#include "spotifyapi.h"
#include "spotifytrack.h"
#include "spotifycallbacks.h"
#include "audioqueue.h"
#include "spotifymainthread.h"
#include "audioplayback.h"
// qt
#include <QMutex>
#include <QList>
#include <QWaitCondition>

typedef unsigned char byte;

class SpotifyStreamer : public MusicStreamer {
    Q_OBJECT
    public:
        SpotifyStreamer();
        virtual ~SpotifyStreamer();
        void Search(const QString& query, int track_offset, int track_count, int album_offset, int album_count, int artist_offset, int artist_count);
        bool Login(const QString& username, const QString& password);
        void Logout();
        void LoadPlaylists();
        void LoadToplist();
        void LoadInbox();
        void LoadStarred();
        void LoadTrack(Track *track);
        void TogglePause();
        void FastForward(int amount);
        void Rewind(int amount);
        bool Init();
        void LoadAlbumArt(Track* track);
		void LoadPlaylistArt(Playlist* track);
		void LoadArtistArt(Track* track);
        void Play();
        void Stop();
        void PlaylistAddTrack(Playlist*& playlist, Track*& track);
        void PlaylistDelTrack(Playlist*& playlist, Track*& track);

    /**
     * C-style callbacks for libspotify
     */    
    private:   
        static CALLBACK void cb_search_complete(sp_search* spsearch, void* userdata);
        static CALLBACK void cb_image_loaded(sp_image* spimage, void* userdata);
        static CALLBACK void cb_image_loaded_album(sp_image* spimage, void* userdata);
        static CALLBACK void cb_image_loaded_playlist(sp_image* spimage, void* userdata);
        static CALLBACK void cb_image_loaded_artist(sp_image* spimage, void* userdata);
        static CALLBACK void cb_artistbrowse_complete(sp_artistbrowse* result, void* userdata);
        static CALLBACK void cb_container_loaded(sp_playlistcontainer* pc, void* userdata);
        static CALLBACK void cb_playlist_state_changed(sp_playlist* pl, void* userdata);
        static CALLBACK int cb_music_delivery(sp_session* session, const sp_audioformat* format, const void* frames, int num_frames);
        static CALLBACK void cb_toplistbrowse_complete(sp_toplistbrowse* result, void* userdata);

    /**
     * Signals and slots for internal use
     */
    signals:
        void sig_internal_search_complete(sp_search* spsearch, void* userdata);
        void sig_internal_image_loaded(sp_image* spimage, void* userdata, ImageType type);
        void sig_internal_artistbrowse_complete(sp_artistbrowse* result, void* userdata);
        void sig_internal_container_loaded(sp_playlistcontainer* pc, void* userdata);
        void sig_internal_toplistbrowse_complete(sp_toplistbrowse* result, void* userdata);

    private slots:
        void slt_internal_search_completed(sp_search* spsearch, void* userdata);
        void slt_internal_image_loaded(sp_image* spimage, void* userdata, ImageType type);
        void slt_internal_artistbrowse_complete(sp_artistbrowse* result, void* userdata);
        void slt_internal_container_loaded(sp_playlistcontainer* pc, void* userdata);
        void slt_internal_toplistbrowse_complete(sp_toplistbrowse* result, void* userdata);

        void slt_internal_logged_in(sp_session* session, sp_error error);
        void slt_internal_logged_out(sp_session* session);
        void slt_internal_message_to_user(sp_session* session, const char* message);
        void slt_internal_play_token_lost(sp_session* session);
        void slt_internal_end_of_track(sp_session* session);
        void slt_internal_streaming_error(sp_session* session, sp_error error);
        void slt_internal_offline_status_update(sp_session* session);
        void slt_internal_connection_error(sp_session* session, sp_error error);

        void slt_internal_notify_main_thread(sp_session* session);
        void slt_internal_playback_status(int time);

    /**
     * 
     */
    private:
        Track* AddTrack(sp_track* sptrack, int position); 
        int ByteToInt(const byte* value);
        QString ByteArrayToHex(const byte bytes[], int size);
        void SetBitrate(QString quality);

    private:
        static QMutex* m_spotifymutex;
        SpotifyCallbacks* m_spotifycallbacks;
        
        sp_playlistcontainer_callbacks m_pccallbacks;
        sp_playlist_callbacks m_plcallbacks;
		sp_playlistcontainer* m_playlistcontainer;
        sp_session* m_session;
        sp_session_config m_config;
        static QMutex* m_audiomutex;
        SpotifyMainThread* m_spmt;
        static AudioPlayback* m_audioplayback;
        static AudioQueue* m_audioqueue;
        QWaitCondition* m_cond;
        QMutex* m_wait;
        bool m_loggedin;
        bool m_initialized;
        bool m_playlistsloaded;
        bool m_paused;
        static double m_time;
        sp_image* m_albumart;
        sp_image* m_playlistart;
        sp_image* m_artistart;
};

#endif
