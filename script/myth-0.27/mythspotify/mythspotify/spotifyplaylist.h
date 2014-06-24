#ifndef SPPLAYLIST_H
#define	SPPLAYLIST_H
#include "playlist.h"
#include "spotifyapi.h"
#include "spotifystreamer.h"

class SpotifyPlaylist : public Playlist {
    friend class SpotifyStreamer;
    public:
        SpotifyPlaylist(sp_playlist* playlist, const QString& name, int id, const QString& system);
        ~SpotifyPlaylist();
    protected:
        sp_playlist* GetPlaylistObject();    
    private:
        sp_playlist* m_playlist;
         
};


#endif

