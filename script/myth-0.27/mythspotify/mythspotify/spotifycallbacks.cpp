#include "spotifycallbacks.h"
#include <QDebug>

SpotifyCallbacks* SpotifyCallbacks::spcb = NULL;

SpotifyCallbacks::SpotifyCallbacks() {
    
}

SpotifyCallbacks::~SpotifyCallbacks() {
    
}

SpotifyCallbacks* SpotifyCallbacks::get_instance() {
    if(spcb == NULL)
        spcb = new SpotifyCallbacks();
    return spcb;
}
void SpotifyCallbacks::cb_logged_in(sp_session* session, sp_error error) {
    emit spcb->sig_logged_in(session, error);
}
void SpotifyCallbacks::cb_logged_out(sp_session* session) {
    emit spcb->sig_logged_out(session);
}
void SpotifyCallbacks::cb_metadata_updated(sp_session* session) {
    emit spcb->sig_metadata_updated(session);
}
void SpotifyCallbacks::cb_connection_error(sp_session* session, sp_error error) {
    emit spcb->sig_connection_error(session, error);
}
void SpotifyCallbacks::cb_message_to_user(sp_session* session, const char* message) {
    emit spcb->sig_message_to_user(session, message);
}
void SpotifyCallbacks::cb_notify_main_thread(sp_session* session) {
    emit spcb->sig_notify_main_thread(session);
}
int SpotifyCallbacks::cb_music_delivery(sp_session* session, const sp_audioformat* format, const void* frames, int num_frames) {
    emit spcb->sig_music_delivery(session, format, frames, num_frames);
    return 0;
}
void SpotifyCallbacks::cb_play_token_lost(sp_session* session) {
    emit spcb->sig_play_token_lost(session);
}
void SpotifyCallbacks::cb_log_message(sp_session* session, const char* data) {
    emit spcb->sig_log_message(session, data);
}
void SpotifyCallbacks::cb_end_of_track(sp_session* session) {
    emit spcb->sig_end_of_track(session);
}
void SpotifyCallbacks::cb_streaming_error(sp_session* session, sp_error error) {
    emit spcb->sig_streaming_error(session, error);
}
void SpotifyCallbacks::cb_userinfo_updated(sp_session* session) {
    emit spcb->sig_userinfo_upated(session);
}
void SpotifyCallbacks::cb_start_playback(sp_session* session) {
    emit spcb->sig_start_playback(session);
}
void SpotifyCallbacks::cb_stop_playback(sp_session* session) {
    emit spcb->sig_stop_playback(session);
}
void SpotifyCallbacks::cb_get_audio_buffer_stats(sp_session* session, sp_audio_buffer_stats* stats) {
    emit spcb->sig_get_audio_buffer_stats(session, stats);
}
void SpotifyCallbacks::cb_offline_status_update(sp_session* session) {
    emit spcb->sig_offline_status_update(session);
}

sp_session_callbacks SpotifyCallbacks::get_sp_session_callbacks() {
    sp_session_callbacks callbacks = {
	&SpotifyCallbacks::cb_logged_in, // login
	&SpotifyCallbacks::cb_logged_out, //logout
	&SpotifyCallbacks::cb_metadata_updated, //metadata updated
	&SpotifyCallbacks::cb_connection_error, //connection error
	&SpotifyCallbacks::cb_message_to_user, //message to user
	&SpotifyCallbacks::cb_notify_main_thread, //notify main thread
	&SpotifyCallbacks::cb_music_delivery, //music delivery
	&SpotifyCallbacks::cb_play_token_lost, //play token lost
	&SpotifyCallbacks::cb_log_message, //log message
	&SpotifyCallbacks::cb_end_of_track, //end of track  
	&SpotifyCallbacks::cb_streaming_error, //streaming error
	&SpotifyCallbacks::cb_userinfo_updated, //userinfo updated
	&SpotifyCallbacks::cb_start_playback, //start playback
	&SpotifyCallbacks::cb_stop_playback, //stop playback
	&SpotifyCallbacks::cb_get_audio_buffer_stats, //get audio buffer stats
	&SpotifyCallbacks::cb_offline_status_update, //offline status updated
    };

    return callbacks;
}
