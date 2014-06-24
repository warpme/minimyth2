#ifndef MYTHSPOTIFYUI_H
#define MYTHSPOTIFYUI_H

// c++
#include <list>
// qt
#include <QObject>
#include <QString>
#include <QList>
#include <QMap>
// mythtv
#include <mythscreentype.h>
#include <mythuiprogressbar.h>
#include <mythprogressdialog.h>
#include <mythscreentype.h>
#include <mythdialogbox.h>
#include <mythuistatetype.h>
#include <mythscreentype.h>
#include <mythdialogbox.h>
// mythspotify
#include "playbackmode.h"
#include "playbackstate.h"
#include "imagetype.h"
#include "mythspotifydlg.h"

class MusicStreamer;
class MythUIButtonListItem;
class MythUITextEdit;
class MythUIButtonList;
class MythUIButton;

class Art;
class Playlist;
class Track;

class MythSpotifyUI : public MythScreenType {
    Q_OBJECT
    public:
        MythSpotifyUI(MythScreenStack* parentstack, QString name);
        ~MythSpotifyUI();
        bool Create();
        bool keyPressEvent(QKeyEvent* event);
        void InitSpotify();
        void DestroySpotify();
        
    private:
        void menu_main();
        void menu_info();
        void menu_edit();
        void action_prev_track();
        void action_next_track();
        void action_pause();
        void action_stop();
        void action_ffwd();
        void action_rwnd();
        void action_toggle_mode();
        
        void CreateBusyDlg(const QString& id, const QString&  message, int timeout, bool exit);
        void CloseBusyDlg(const QString& id);
        QString FormatTime(int msec);
        void Play(Track* track);
        void SetPopularityState(MythUIButtonListItem* item, int popularity);
        void DeletePlaylist(Playlist*& playlist);

    private:
        MusicStreamer* musicstreamer;
        
        MythUIButtonList* btnlstplaylists;
        MythUIButtonList* btnlsttracks;
        MythUIButtonListItem* itemsearch;
        MythUIButtonListItem* itemtoplist;
        MythUIButtonListItem* iteminbox;
        MythUIButtonListItem* itemstarred;
        MythUIImage* imgcoremark;
        MythUIImage* imgalbumart;
		MythUIImage* imgplaylistart;
		MythUIImage* imgartistart;
        MythUITextEdit* txtedtsearch;
        MythUIButton* btnsearch;
        MythUIProgressBar* progressbar;
        MythUIText* txttrack;
        MythUIText* txtalbum;
        MythUIText* txtartist;
        MythUIText* txttime;
		MythUIStateType* stateplaybackstate;
		MythUIStateType* stateplaybackmode;
        
        QMap<QString, MythSpotifyBusyDlg*> busydialogs;
        MythScreenStack* popupstack;
        
        QString searchquery;
        Track* current_track;
        Playlist* active_playlist;
        PlaybackMode playbackmode;
        PlaybackState playbackstate;
        QList<Track*> previous_tracks;
        QMap<int, QString> popularitymap;
    private slots:
        /*
         * UI Slots
         */
        void slt_item_clicked_playlists(MythUIButtonListItem* item);
        void slt_item_selected_playlists(MythUIButtonListItem* item);
        void slt_item_clicked_tracks(MythUIButtonListItem* item);
        void slt_item_selected_tracks(MythUIButtonListItem* item);
        void slt_search_clicked();
        void slt_view_about();
        void slt_prompt_password(QString password);
        /*
         * MusicStreamer slots 
         */
        void slt_error(QString error);
        void slt_playback_status();
        void slt_message(QString message);
        void slt_art_loaded(Art* art, ImageType type);
        void slt_logged_in();
        void slt_logged_out();
        void slt_search_completed(Playlist* playlist);
        void slt_playlists_loaded(QList<Playlist*> playlists);
        void slt_track_loaded();    
        void slt_playback_status(int time);       
        void slt_end_of_track();
        void slt_toplist_loaded(Playlist* playlist);
        void slt_inbox_loaded(Playlist* playlist);
        void slt_starred_loaded(Playlist* playlist);
    
};

#endif
