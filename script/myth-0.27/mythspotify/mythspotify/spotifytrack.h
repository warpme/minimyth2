#ifndef SPTRACK_H
#define	SPTRACK_H

// mythspotify
#include "track.h"
#include "spotifyapi.h"
#include "spotifystreamer.h"

class SpotifyTrack : public Track {
    friend class SpotifyStreamer;
    public:
        SpotifyTrack(sp_track* track, const QString& nametrack, const QString& namealbum, const QString& nameartist, int popularity, int duration, int year, bool available, bool starred, int position);
        ~SpotifyTrack();
    protected:
        sp_track* GetTrackObject();
        int GetPosition();
        void SetPosition(int position);
    private:
        sp_track* m_track;
        int m_position;
};


#endif

