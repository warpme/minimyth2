#ifndef SPOTIFYCALLBACKS_H
#define	SPOTIFYCALLBACKS_H

#include <Qt/qobject.h>
#include "spotifyapi.h"

class SpotifyCallbacks : public QObject {
    Q_OBJECT
        public:
            static SpotifyCallbacks* get_instance();
            virtual ~SpotifyCallbacks();
            static void CALLBACK cb_logged_in(sp_session* session, sp_error error);
            static void CALLBACK cb_logged_out(sp_session* session);
            static void CALLBACK cb_metadata_updated(sp_session* session);
            static void CALLBACK cb_connection_error(sp_session* session, sp_error error);
            static void CALLBACK cb_message_to_user(sp_session* session, const char* message);
            static void CALLBACK cb_notify_main_thread(sp_session* session);
            static int CALLBACK cb_music_delivery(sp_session* session, const sp_audioformat* format, const void* frames, int num_frames);
            static void CALLBACK cb_play_token_lost(sp_session* session);
            static void CALLBACK cb_log_message(sp_session* session, const char* data);
            static void CALLBACK cb_end_of_track(sp_session* session);
            static void CALLBACK cb_streaming_error(sp_session* session, sp_error error);
            static void CALLBACK cb_userinfo_updated(sp_session* session);
            static void CALLBACK cb_start_playback(sp_session* session);
            static void CALLBACK cb_stop_playback(sp_session* session);
            static void CALLBACK cb_get_audio_buffer_stats(sp_session* session, sp_audio_buffer_stats* stats);
            static void CALLBACK cb_offline_status_update(sp_session* session);
            sp_session_callbacks get_sp_session_callbacks();
        protected:
            static SpotifyCallbacks* spcb;
            SpotifyCallbacks();
        signals:
            void sig_logged_in(sp_session* session, sp_error error);
            void sig_logged_out(sp_session* session);
            void sig_metadata_updated(sp_session* session);
            void sig_connection_error(sp_session* session, sp_error error);
            void sig_message_to_user(sp_session* session, const char* message);
            void sig_notify_main_thread(sp_session* session);
            void sig_music_delivery(sp_session* session, const sp_audioformat* format, const void* frames, int num_frames);
            void sig_play_token_lost(sp_session* session);
            void sig_log_message(sp_session* session, const char* data);
            void sig_end_of_track(sp_session* session);
            void sig_streaming_error(sp_session* session, sp_error error);
            void sig_userinfo_upated(sp_session* session);
            void sig_start_playback(sp_session* session);
            void sig_stop_playback(sp_session* session);
            void sig_get_audio_buffer_stats(sp_session* session, sp_audio_buffer_stats* stats);
            void sig_offline_status_update(sp_session* session);
            
            
            
            
};

#endif

