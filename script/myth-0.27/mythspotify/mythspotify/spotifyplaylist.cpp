#include "spotifyplaylist.h"

SpotifyPlaylist::SpotifyPlaylist(sp_playlist* playlist, const QString& name, int id, const QString& system)
                : Playlist(name, id, system) {
    m_playlist = playlist;
    if(m_playlist != NULL)
        sp_playlist_add_ref(m_playlist);
}

SpotifyPlaylist::~SpotifyPlaylist() {
    if(m_playlist != NULL)
        sp_playlist_release(m_playlist);
}

sp_playlist* SpotifyPlaylist::GetPlaylistObject() {
    return m_playlist;
}
