// qt
#include <QDebug>
#include <QMetaType>
#include <QDir>
// mythtv
#include <mythcorecontext.h>
// mythspotify
#include "spotifystreamer.h"
#include "spotifytrack.h"
#include "playlist.h"
#include "spotifycallbacks.h"
#include "imageformat.h"
#include "spotifytrack.h"
#include "spotifyplaylist.h"
#include "appkey.h"
#include "spotifymainthread.h"
#include "audiodata.h"

#define BUFFER 1

AudioPlayback* SpotifyStreamer::m_audioplayback = NULL;
AudioQueue* SpotifyStreamer::m_audioqueue = NULL;
QMutex* SpotifyStreamer::m_spotifymutex = NULL;
QMutex* SpotifyStreamer::m_audiomutex = NULL;
double SpotifyStreamer::m_time = 0;

Q_DECLARE_METATYPE(Playlist*)
Q_DECLARE_METATYPE(sp_error)

SpotifyStreamer::SpotifyStreamer() {
    m_system = QString("Spotify"); 
    m_spotifycallbacks = SpotifyCallbacks::get_instance();
    m_session = NULL;
    m_spotifymutex = new QMutex();
    m_audiomutex = new QMutex();
    m_wait = new QMutex();
    m_cond = new QWaitCondition();
    m_spmt = new SpotifyMainThread(m_spotifymutex);

    m_audioplayback = new AudioPlayback(m_audiomutex);
    m_audioqueue = new AudioQueue();
    m_loggedin = false;
    m_initialized = false;
    m_playlistsloaded = false;
    m_playlistcontainer = NULL;
    m_albumart = NULL;
    m_playlistart = NULL;
    m_artistart = NULL;
    m_paused = false;

    qRegisterMetaType<sp_error>("sp_error");
    qRegisterMetaType<ImageType>("ImageType");
    qRegisterMetaType< QList<Playlist*> >("QList<Playlist*>");

    connect(m_spotifycallbacks, SIGNAL(sig_notify_main_thread(sp_session*)),
            this, SLOT(slt_internal_notify_main_thread(sp_session*)), Qt::DirectConnection);

			
    connect(this, SIGNAL(sig_internal_search_complete(sp_search*, void*)),
            this, SLOT(slt_internal_search_completed(sp_search*, void*)), Qt::DirectConnection);
    connect(this, SIGNAL(sig_internal_image_loaded(sp_image*, void*, ImageType)),
            this, SLOT(slt_internal_image_loaded(sp_image*, void*, ImageType)), Qt::DirectConnection);
    connect(this, SIGNAL(sig_internal_artistbrowse_complete(sp_artistbrowse*, void*)),
            this, SLOT(slt_internal_artistbrowse_complete(sp_artistbrowse*, void*)), Qt::DirectConnection);
    connect(this, SIGNAL(sig_internal_container_loaded(sp_playlistcontainer*, void*)),
            this, SLOT(slt_internal_container_loaded(sp_playlistcontainer*, void*)), Qt::DirectConnection);
    connect(m_audioplayback, SIGNAL(sig_playback_status(int)),
            this, SLOT(slt_internal_playback_status(int)));
    connect(this, SIGNAL(sig_internal_toplistbrowse_complete(sp_toplistbrowse*, void*)),
            this, SLOT(slt_internal_toplistbrowse_complete(sp_toplistbrowse*, void*)), Qt::DirectConnection);
    
    
    connect(m_spotifycallbacks, SIGNAL(sig_logged_in(sp_session*, sp_error)),
            this, SLOT(slt_internal_logged_in(sp_session*, sp_error)), Qt::DirectConnection);
    connect(m_spotifycallbacks, SIGNAL(sig_logged_out(sp_session*)),
            this, SLOT(slt_internal_logged_out(sp_session*)), Qt::DirectConnection);
    connect(m_spotifycallbacks, SIGNAL(sig_connection_error(sp_session*, sp_error)),
            this, SLOT(slt_internal_connection_error(sp_session*, sp_error)), Qt::DirectConnection);
    connect(m_spotifycallbacks, SIGNAL(sig_message_to_user(sp_session*, const char*)),
            this, SLOT(slt_internal_message_to_user(sp_session*, const char*)), Qt::DirectConnection);
    connect(m_spotifycallbacks, SIGNAL(sig_play_token_lost(sp_session*)),
            this, SLOT(slt_internal_play_token_lost(sp_session*)), Qt::DirectConnection);
    connect(m_spotifycallbacks, SIGNAL(sig_streaming_error(sp_session*, sp_error)),
            this, SLOT(slt_internal_streaming_error(sp_session*, sp_error)), Qt::DirectConnection);
    connect(m_spotifycallbacks, SIGNAL(sig_offline_status_update(sp_session*)),
            this, SLOT(slt_internal_offline_status_update(sp_session*)), Qt::DirectConnection);
    connect(m_spotifycallbacks, SIGNAL(sig_end_of_track(sp_session*)),
            this, SLOT(slt_internal_end_of_track(sp_session*)), Qt::DirectConnection);
    

    m_pccallbacks.container_loaded = &SpotifyStreamer::cb_container_loaded;
    m_pccallbacks.playlist_added = NULL;
    m_pccallbacks.playlist_moved = NULL;
    m_pccallbacks.playlist_removed = NULL;
    
    m_plcallbacks.playlist_state_changed = &SpotifyStreamer::cb_playlist_state_changed;
    m_plcallbacks.description_changed = NULL;
    m_plcallbacks.image_changed = NULL;
    m_plcallbacks.playlist_metadata_updated = NULL;
    m_plcallbacks.playlist_renamed = NULL;
    m_plcallbacks.playlist_update_in_progress = NULL;
    m_plcallbacks.subscribers_changed = NULL;
    m_plcallbacks.track_created_changed = NULL;
    m_plcallbacks.track_message_changed = NULL;
    m_plcallbacks.track_seen_changed = NULL;
    m_plcallbacks.tracks_added = NULL;
    m_plcallbacks.tracks_moved = NULL;
    m_plcallbacks.tracks_removed = NULL;
 
	
}

SpotifyStreamer::~SpotifyStreamer() {
    
    m_spmt->Quit();
    m_spmt->wait(2000);
    m_audioplayback->Quit();
    m_audioplayback->wait(5000);
    if(m_initialized) {
        m_spotifymutex->lock();
        //This does not work
        //sp_session_release(m_session);
        m_spotifymutex->unlock();
    }

    disconnect();
    delete m_audioplayback;
    m_audioplayback = NULL;
    delete m_audioqueue;
    m_audioqueue = NULL;
    delete m_spmt;
    delete m_wait;
    delete m_cond;
    delete m_spotifymutex;
    delete m_audiomutex;
}

void SpotifyStreamer::Search(const QString& query, int track_offset, int track_count, int album_offset, int album_count, int artist_offset, int artist_count) {
    m_spotifymutex->lock();
    sp_search_create(m_session, query, track_offset, track_count, album_offset, album_count, artist_offset, artist_count, &SpotifyStreamer::cb_search_complete, this);
    m_spotifymutex->unlock();
}

bool SpotifyStreamer::Login(const QString& username, const QString& password) {
    m_spotifymutex->lock();
    sp_session_login(m_session, username, password, false);
    m_spotifymutex->unlock();
    return true;
}

void SpotifyStreamer::Logout() {
    Stop();
    Art::Clear();
	
    if(m_playlistcontainer != NULL)
        sp_playlistcontainer_release(m_playlistcontainer);

    if(m_loggedin) {
        m_spotifymutex->lock();
        sp_session_logout(m_session);
        m_spotifymutex->unlock();

        //TODO Better syncronisation
        m_wait->lock();
        m_cond->wait(m_wait, 7000);
        m_wait->unlock();
    }
}

bool SpotifyStreamer::Init() {
	sp_error error;

    m_config.api_version = SPOTIFY_API_VERSION;
    
    //TODO Move setting values
//    m_config.cache_location = "/temp";
//    m_config.cache_location = "/tmp/junk";
//    m_config.settings_location = "/temp";
//    m_config.settings_location = "/tmp/junk";

    QString cache = gCoreContext->GetSetting("MythSpotifyCache");
    QDir cachedir = QDir(cache);

    if(!cachedir.exists())
        cachedir.mkpath(cache);

    m_config.cache_location = cachedir.absolutePath();
    m_config.settings_location = cachedir.absolutePath();

    m_config.application_key = g_appkey;
    m_config.application_key_size = g_appkey_size;

    m_config.initially_unload_playlists = false;
    m_config.dont_save_metadata_for_playlists = false;

    m_config.user_agent = "MythSpotify";
    sp_session_callbacks callbacks = SpotifyCallbacks::get_instance()->get_sp_session_callbacks();
    //Override 
    callbacks.music_delivery = &SpotifyStreamer::cb_music_delivery;
    m_config.callbacks = &callbacks;
    
    m_spotifymutex->lock();
    error = sp_session_create(&m_config, &m_session);
    m_spotifymutex->unlock();

    if(error != SP_ERROR_OK || m_session == NULL) {
        emit sig_error(QString("Unable to initialize Spotify"));        
        return false;
    }
	
    m_initialized = true;
	
    return true;
}

void SpotifyStreamer::LoadPlaylists() {
    m_spotifymutex->lock();
    sp_playlistcontainer* m_playlistcontainer = sp_session_playlistcontainer(m_session);
    sp_playlistcontainer_add_ref(m_playlistcontainer);

    sp_playlistcontainer_add_callbacks(m_playlistcontainer, &m_pccallbacks, this);

    if(sp_playlistcontainer_is_loaded(m_playlistcontainer))
        emit sig_internal_container_loaded(m_playlistcontainer, this); 
    m_spotifymutex->unlock();
    
}

void SpotifyStreamer::LoadToplist() {
    m_spotifymutex->lock();
    
    //sp_session_user_country(m_session);
    //sp_toplistregion region = SP_TOPLIST_REGION('S', 'E');
    sp_toplistbrowse_create(m_session, SP_TOPLIST_TYPE_TRACKS, SP_TOPLIST_REGION_EVERYWHERE, NULL, &SpotifyStreamer::cb_toplistbrowse_complete, this);
    m_spotifymutex->unlock();
}

void SpotifyStreamer::LoadInbox() {
    sp_playlist* spplaylist;
    m_spotifymutex->lock();
    spplaylist = sp_session_inbox_create(m_session);

    SpotifyPlaylist* playlist = new SpotifyPlaylist(spplaylist, "Inbox", -1, m_system);
    if(sp_playlist_is_loaded(spplaylist)) {
        int numtracks = sp_playlist_num_tracks(spplaylist);
        for(int i = 0; i < numtracks; i++) {
            sp_track* sptrack = sp_playlist_track(spplaylist, i);
            if(sp_track_is_loaded(sptrack)) {
               Track* track = AddTrack(sptrack, i);
                playlist->AddTrack(track);
            }
        }
    }

    sp_playlist_release(spplaylist);
    m_spotifymutex->unlock();

    emit sig_inbox_loaded(playlist);
}

void SpotifyStreamer::LoadStarred() {
    sp_playlist* spplaylist;
    m_spotifymutex->lock();
    spplaylist = sp_session_starred_create(m_session);

    SpotifyPlaylist* playlist = new SpotifyPlaylist(spplaylist, "Starred", -1, m_system);
    if(sp_playlist_is_loaded(spplaylist)) {
        int numtracks = sp_playlist_num_tracks(spplaylist);
        for(int i = 0; i < numtracks; i++) {
            sp_track* sptrack = sp_playlist_track(spplaylist, i);
            if(sp_track_is_loaded(sptrack)) {
               Track* track = AddTrack(sptrack, i);
                playlist->AddTrack(track);
            }
        }
    }

    sp_playlist_release(spplaylist);
    m_spotifymutex->unlock();

    emit sig_starred_loaded(playlist);


}

void SpotifyStreamer::LoadTrack(Track *track) {
    sp_track* sptrack = dynamic_cast<SpotifyTrack*>(track)->GetTrackObject();
    m_spotifymutex->lock();
    sp_session_player_load(m_session, sptrack);
    m_spotifymutex->unlock();
}

void SpotifyStreamer::Play() {
    m_audioplayback->Start();
    m_spotifymutex->lock();
    sp_session_player_play(m_session, true);
    m_spotifymutex->unlock();
}

void SpotifyStreamer::Stop() {
    m_audioplayback->Stop();
    m_time = 0;
    m_audioqueue->Flush();
    m_spotifymutex->lock();
    sp_session_player_unload(m_session);
    m_spotifymutex->unlock();
}

void SpotifyStreamer::TogglePause() {
    m_spotifymutex->lock();
    m_audioqueue->Flush();
    sp_session_player_play(m_session, m_paused);
    m_paused = !m_paused;
    m_spotifymutex->unlock();
}

void SpotifyStreamer::FastForward(int amount) {
    if(amount <= 0)
            return;
    m_spotifymutex->lock();
    sp_session_player_seek(m_session, m_time + amount);
    m_spotifymutex->unlock();
    m_time += amount;
}

void SpotifyStreamer::Rewind(int amount) {
    if(amount <= 0)
        return;

    m_spotifymutex->lock();
    sp_session_player_seek(m_session, m_time - amount);
    m_spotifymutex->unlock();
    m_time -= amount;
    if(m_time <= 0)
        m_time = 0;
}

void SpotifyStreamer::PlaylistAddTrack(Playlist*& playlist, Track*& track) {
    SpotifyPlaylist* spotifyplaylist = dynamic_cast<SpotifyPlaylist*>(playlist);
    SpotifyTrack* spotifytrack = dynamic_cast<SpotifyTrack*>(track);
    sp_playlist* spplaylist = spotifyplaylist->GetPlaylistObject();
    sp_track* sptrack[] = { spotifytrack->GetTrackObject() };
    
    sp_error error = SP_ERROR_OK;
    
    if(spplaylist != NULL) {
        int position = sp_playlist_num_tracks(spplaylist);
        
        m_spotifymutex->lock();
        error = sp_playlist_add_tracks(spplaylist, sptrack, 1, position, m_session);
        m_spotifymutex->unlock();
        
        if(error == SP_ERROR_OK) {
            spotifytrack->SetPosition(position);
            spotifyplaylist->AddTrack(track);
        }
    }
}

void SpotifyStreamer::PlaylistDelTrack(Playlist*& playlist, Track*& track) {
    SpotifyPlaylist* spotifyplaylist = dynamic_cast<SpotifyPlaylist*>(playlist);
    SpotifyTrack* spotifytrack = dynamic_cast<SpotifyTrack*>(track);
    sp_playlist* spplaylist = spotifyplaylist->GetPlaylistObject();
    
    sp_error error = SP_ERROR_OK;
    
    if(spplaylist != NULL && spotifytrack->GetPosition() > -1) {

        const int position[] = { spotifytrack->GetPosition() };
        error = sp_playlist_remove_tracks(spplaylist, position, 1);
        
        if(error == SP_ERROR_OK) {
            spotifyplaylist->DelTrack(track);
        }
    }
}

void SpotifyStreamer::LoadAlbumArt(Track* track)  {
    m_spotifymutex->lock();
    if(m_albumart != NULL) {
        sp_image_remove_load_callback(m_albumart, &SpotifyStreamer::cb_image_loaded_album, this);
        sp_image_release(m_albumart);
    }
        
    sp_track* sptrack = static_cast<SpotifyTrack*>(track)->GetTrackObject();
    sp_album* spalbum = sp_track_album(sptrack);
    //TODO unload callback
    if(sp_album_is_loaded(spalbum)) {
        QString id = ByteArrayToHex(sp_album_cover(spalbum), 20);
        Art* art = Art::GetArt(id);
        
        if(art != NULL) {
            m_albumart = NULL;
            emit sig_art_loaded(art, IMAGE_TYPE_ALBUM);
        } else { 
            sp_image* spimage = sp_image_create(m_session, sp_album_cover(spalbum));
            m_albumart = spimage;
            sp_image_add_ref(spimage);
            sp_image_add_load_callback(spimage, &SpotifyStreamer::cb_image_loaded_album, this);
        }
    }
    m_spotifymutex->unlock();
}

void SpotifyStreamer::LoadPlaylistArt(Playlist* playlist) {
    sp_playlist* spplaylist = static_cast<SpotifyPlaylist*>(playlist)->GetPlaylistObject();

    //TODO unload callback
    if(sp_playlist_is_loaded(spplaylist)) {
		byte *bid; 
		sp_playlist_get_image(spplaylist, bid);
        QString id = ByteArrayToHex(bid, 20);
        Art* art = Art::GetArt(id);
        
        if(art != NULL) {
            emit sig_art_loaded(art, IMAGE_TYPE_PLAYLIST);
        } else { 
            m_spotifymutex->lock();
            sp_image* spimage = sp_image_create(m_session, bid);
            m_spotifymutex->unlock();
            sp_image_add_load_callback(spimage, &SpotifyStreamer::cb_image_loaded_playlist, this);
        }
    } 
}

void SpotifyStreamer::LoadArtistArt(Track* track) {
    SpotifyTrack* spotifytrack = dynamic_cast<SpotifyTrack*>(track);
    sp_track* sptrack = spotifytrack->GetTrackObject();
    sp_artist* spartist = sp_track_artist(sptrack, 0);
    
    if(spartist != NULL) {
        m_spotifymutex->lock();
        sp_artistbrowse_create(m_session, spartist, &SpotifyStreamer::cb_artistbrowse_complete, this);
        m_spotifymutex->unlock();
    }
}

/**
 * Signals and slots for internal use
 */

void SpotifyStreamer::slt_internal_search_completed(sp_search* spsearch, void* userdata) {
    SpotifyPlaylist* playlist = new SpotifyPlaylist(NULL, "Search", -1, m_system);
    
    for(int i = 0; i < sp_search_num_tracks(spsearch); i++) {
        sp_track* sptrack = sp_search_track(spsearch, i);
        Track* track = AddTrack(sptrack, -1);
        playlist->AddTrack(track);    
    }
    
    sp_search_release(spsearch);
    emit sig_search_completed(playlist);
}

void SpotifyStreamer::slt_internal_image_loaded(sp_image* spimage, void* userdata, ImageType type) {
    if(spimage != NULL) {
        QString id = ByteArrayToHex(sp_image_image_id(spimage), 20);
        ImageFormat format;

        if(sp_image_format(spimage) == SP_IMAGE_FORMAT_JPEG)
            format = IMAGE_FORMAT_JPEG;
        else
            format = IMAGE_FORMAT_UNKNOWN;
        
        size_t size;
        const byte* data = static_cast<const byte*>(sp_image_data(spimage, &size));
        
        Art* art = Art::Create(id, format, data, size);
        emit sig_art_loaded(art, type);
    }
    sp_image_release(spimage);
}

void SpotifyStreamer::slt_internal_artistbrowse_complete(sp_artistbrowse* result, void* userdata) {
    if(sp_artistbrowse_num_portraits(result) > 1) {
        QString id = ByteArrayToHex(sp_artistbrowse_portrait(result, 1), 20);
        
        Art* art = Art::GetArt(id);
        
        if(art != NULL) {
            emit sig_art_loaded(art, IMAGE_TYPE_ARTIST);
        } else { 
            m_spotifymutex->lock();
            sp_image* spimage = sp_image_create(m_session, sp_artistbrowse_portrait(result, 1));
            m_spotifymutex->unlock();
            sp_image_add_load_callback(spimage, &SpotifyStreamer::cb_image_loaded_artist, this);
        }
    }
    sp_artistbrowse_release(result);
    
}

void SpotifyStreamer::slt_internal_notify_main_thread(sp_session* session) {
    //Start when needed
    if(!m_spmt->isRunning())
        m_spmt->start();
}

void SpotifyStreamer::slt_internal_logged_in(sp_session* session, sp_error error) {
    m_loggedin = true;

    m_audioplayback->start();
    SetBitrate(gCoreContext->GetSetting("MythSpotifyBitrate", ""));

	emit sig_logged_in();
}

void SpotifyStreamer::slt_internal_logged_out(sp_session* session) {
    m_cond->wakeAll();
    m_loggedin = false;
	emit sig_logged_out();
}

void SpotifyStreamer::slt_internal_playback_status(int time) {
    m_time += time;
    emit sig_playback_status((int)m_time);
}

void SpotifyStreamer::slt_internal_message_to_user(sp_session* session, const char* message) {
   emit sig_message(QString(message));  
}

void SpotifyStreamer::slt_internal_play_token_lost(sp_session* session) {
    Stop();
    emit sig_message(QString("Account logged in elsewhere"));
}

void SpotifyStreamer::slt_internal_end_of_track(sp_session* session) {
    emit sig_end_of_track();
}

void SpotifyStreamer::slt_internal_streaming_error(sp_session* session, sp_error error) {
    emit sig_error(QString("Streaming error: %1").arg(sp_error_message(error)));
}

void SpotifyStreamer::slt_internal_offline_status_update(sp_session* session) {
    	
}

void SpotifyStreamer::slt_internal_connection_error(sp_session* session, sp_error error) {
    
}

void SpotifyStreamer::slt_internal_container_loaded(sp_playlistcontainer* pc, void* userdata) {
    QList<Playlist*> playlists;
    sp_playlist* spplaylist;

    int numplaylists = sp_playlistcontainer_num_playlists(pc);
    for(int i = 0; i < numplaylists; i++) {

        
        switch(sp_playlistcontainer_playlist_type(pc, i)) {
            case SP_PLAYLIST_TYPE_PLAYLIST: {
                spplaylist = sp_playlistcontainer_playlist(pc, i);
                sp_playlist_add_ref(spplaylist);
                sp_playlist_set_in_ram(m_session, spplaylist, true);
                int numtracks = sp_playlist_num_tracks(spplaylist);
                if(!sp_playlist_is_loaded(spplaylist)) {
                    sp_playlist_add_callbacks(spplaylist, &m_plcallbacks, this);
                    for(int k = 0; k < playlists.size(); k++) {
                        delete playlists[k];   
                    }
                    playlists.clear();
                    sp_playlist_release(spplaylist);
                    m_playlistsloaded = false;
                    return;    
                }
                SpotifyPlaylist* playlist = new SpotifyPlaylist(spplaylist, sp_playlist_name(spplaylist), i, m_system);
                sp_playlist_remove_callbacks(spplaylist, &m_plcallbacks, this);
               
                for(int j = 0; j < numtracks; j++) {
                    sp_track* sptrack = sp_playlist_track(spplaylist, j);
                    if(sp_track_is_loaded(sptrack)) {
                        Track* track = AddTrack(sptrack, j);
                        playlist->AddTrack(track);
                    }
                }
                
                playlists.push_back(playlist);
                sp_playlist_release(spplaylist);
                m_playlistsloaded = true;
            }
            break;
            case SP_PLAYLIST_TYPE_PLACEHOLDER: {
                
            }
            break;
            case SP_PLAYLIST_TYPE_START_FOLDER: {
                
            }
            break;
            case SP_PLAYLIST_TYPE_END_FOLDER: {
                
            }
            break;
        }
    }
    
    emit sig_playlists_loaded(playlists);
}

void SpotifyStreamer::slt_internal_toplistbrowse_complete(sp_toplistbrowse* result, void* userdata) {
    SpotifyPlaylist* playlist = new SpotifyPlaylist(NULL, "Toplist", -1, m_system);
    
    if(!sp_toplistbrowse_is_loaded(result)) {
        emit sig_toplist_loaded(playlist);
        return;
    }

    int numtracks = sp_toplistbrowse_num_tracks(result);
    for(int i = 0; i < numtracks; i++) {
        sp_track* sptrack = sp_toplistbrowse_track(result, i);
        if(sp_track_is_loaded(sptrack)) {
            Track* track = AddTrack(sptrack, i);
            playlist->AddTrack(track);
        }
    }

    sp_toplistbrowse_release(result);
    emit sig_toplist_loaded(playlist);
}


/**
 * C-style callbacks for libspotify
 */    
void SpotifyStreamer::cb_search_complete(sp_search* spsearch, void* userdata) {
    SpotifyStreamer* ss = static_cast<SpotifyStreamer*>(userdata);
    emit ss->sig_internal_search_complete(spsearch, userdata);
}

void SpotifyStreamer::cb_image_loaded_album(sp_image* spimage, void* userdata) {
    SpotifyStreamer* ss = static_cast<SpotifyStreamer*>(userdata);
    emit ss->sig_internal_image_loaded(spimage, userdata, IMAGE_TYPE_ALBUM);
}

void SpotifyStreamer::cb_image_loaded_playlist(sp_image* spimage, void* userdata) {
    SpotifyStreamer* ss = static_cast<SpotifyStreamer*>(userdata);
    emit ss->sig_internal_image_loaded(spimage, userdata, IMAGE_TYPE_PLAYLIST);
}

void SpotifyStreamer::cb_image_loaded_artist(sp_image* spimage, void* userdata) {
    SpotifyStreamer* ss = static_cast<SpotifyStreamer*>(userdata);
    emit ss->sig_internal_image_loaded(spimage, userdata, IMAGE_TYPE_ARTIST);
}

void SpotifyStreamer::cb_artistbrowse_complete(sp_artistbrowse* result, void* userdata) {
    SpotifyStreamer* ss = static_cast<SpotifyStreamer*>(userdata);
    emit ss->sig_internal_artistbrowse_complete(result, userdata);
}

void SpotifyStreamer::cb_container_loaded(sp_playlistcontainer* pc, void* userdata) {
    SpotifyStreamer* ss = static_cast<SpotifyStreamer*>(userdata);
    if(!ss->m_playlistsloaded && ss->m_playlistcontainer != NULL)
        emit ss->sig_internal_container_loaded(pc, userdata);
    
}

void SpotifyStreamer::cb_playlist_state_changed(sp_playlist* pl, void* userdata) {
    SpotifyStreamer* ss = static_cast<SpotifyStreamer*>(userdata);
    if(!ss->m_playlistsloaded && ss->m_playlistcontainer != NULL)
        emit ss->sig_internal_container_loaded(ss->m_playlistcontainer, userdata);
}

void SpotifyStreamer::cb_toplistbrowse_complete(sp_toplistbrowse* result, void* userdata) {
    SpotifyStreamer* ss = static_cast<SpotifyStreamer*>(userdata);
    emit ss->sig_internal_toplistbrowse_complete(result, userdata);
}

int SpotifyStreamer::cb_music_delivery(sp_session* session, const sp_audioformat* format, const void* frames, int num_frames) {
    //No frames delivered
    if(0 == num_frames) {
        return 0;
    }
 /*  
    m_audiomutex->lock();
    if(m_audioplayback->IsStopped()) {
        m_audiomutex->unlock();
        return 0;
    }

    if(!m_audioplayback->IsInitialized());
        m_audioplayback->Init(format->channels, format->sample_rate);
    m_audiomutex->unlock();
   */ 
    if(m_audioqueue == NULL) {
        return 0;
    }
        
    //Check buffer
    if(m_audioqueue->NumSamples() > format->sample_rate * BUFFER) {
        return 0;
    }
    int16_t* buf = new int16_t[num_frames * format->channels];
    memcpy(buf, frames, num_frames * format->channels * sizeof(int16_t));
    AudioData* ad = new AudioData(format->sample_rate, format->channels, num_frames, buf);
     
    m_audioqueue->Push(ad);

    return num_frames;
}


/**
 * Utilities
 * 
 */

Track* SpotifyStreamer::AddTrack(sp_track* sptrack, int position) {
    if(!sp_track_is_loaded(sptrack)) 
        return NULL;
    
    sp_album* album = sp_track_album(sptrack);
    sp_artist* artist = sp_track_artist(sptrack, 0);
  
    if(!sp_album_is_loaded(album))
        return NULL;
    if(!sp_artist_is_loaded(artist))
        return NULL;
    
    const char* track_name = sp_track_name(sptrack);
    int duration = sp_track_duration(sptrack);
    int popularity = sp_track_popularity(sptrack);
    bool available = (sp_track_is_available(m_session, sptrack) && !sp_track_is_local(m_session, sptrack)) ? true : false   ;
    int year = sp_album_year(album);
    const char* album_name = sp_album_name(album);
    const char* artist_name = sp_artist_name(artist);
    bool starred = sp_track_is_starred(m_session, sptrack);
    Track* track = new SpotifyTrack(sptrack, track_name, album_name, artist_name, popularity, duration, year, available, starred, position);
    
    return track;
}

int SpotifyStreamer::ByteToInt(const byte* value) {
    uint32_t id = 0;    
    size_t size_bid = sizeof(value)/sizeof(byte);
    for(uint8_t i = 0; i < size_bid ; i++) {
        id |= value[i] & 0xFF;
        if(i < size_bid - 1)
            id <<= 8;
    }
    return id;
}

QString SpotifyStreamer::ByteArrayToHex(const byte bytes[], int size) {
    QString hex;
    for(int i = 0; i < size; i++) {
        hex.append(QString("%1").arg((int)bytes[i], 0, 16));
    }
                           
    return hex;
};

void SpotifyStreamer::SetBitrate(QString quality) {
    sp_bitrate bitrate;

    if(quality == "standard") {
        bitrate == SP_BITRATE_160k;
    } else if(quality == "high") {
        bitrate == SP_BITRATE_320k;
    } else if(quality == "low") {
        bitrate == SP_BITRATE_96k;
    } else {
        return;
    }

    sp_session_preferred_bitrate (m_session, bitrate);
    sp_session_preferred_offline_bitrate (m_session, bitrate, false);

}
