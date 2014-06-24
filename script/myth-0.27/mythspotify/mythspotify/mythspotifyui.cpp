// qt
#include <QTime>
#include <QStringList>
#include <QMetaType>
#include <QDebug>
#include <QChar>
#include <QWaitCondition>
#include <QMutex>
// mythtv
#include <mythlogging.h>
#include <mythmainwindow.h>
#include <mythuibuttonlist.h>
#include <mythuitextedit.h>
#include <mythuibutton.h>
#include <mythconfigdialogs.h>
#include <mythdirs.h>
#include <mythcorecontext.h>
#include <mythdialogbox.h>
// mythspotify
#include "mythspotifyui.h"
#include "spotifystreamer.h"
#include "spotifytrack.h"
#include "playlist.h"

Q_DECLARE_METATYPE(Track*)
Q_DECLARE_METATYPE(Playlist*)
Q_DECLARE_METATYPE(Art*)
Q_DECLARE_METATYPE(ImageType)
Q_DECLARE_METATYPE(QList<Playlist*>)

enum PlaylistType {
    PLAYLIST_TYPE_SEARCH = 0,
    PLAYLIST_TYPE_TOPLIST = 1,
    PLAYLIST_TYPE_INBOX = 2,
    PLAYLIST_TYPE_STARRED = 3,
    PLAYLIST_TYPE_USER = 4
};

MythSpotifyUI::MythSpotifyUI(MythScreenStack* parentstack, QString name) 
                                : MythScreenType(parentstack, name) {
    
    popupstack = GetMythMainWindow()->GetStack("popup stack");
    
}

MythSpotifyUI::~MythSpotifyUI() {
    DestroySpotify(); 
}

bool MythSpotifyUI::Create() {
    
    if (!LoadWindowFromXML("mythspotify-ui.xml", "mythspotifyui", this))
        return false;
    
    bool error = false;
    UIUtilE::Assign(this, btnlstplaylists, "btnlstplaylists", &error);
    UIUtilE::Assign(this, btnlsttracks, "btnlsttracks", &error);
    UIUtilE::Assign(this, imgcoremark, "imgcoremark", &error);
    UIUtilE::Assign(this, imgalbumart, "imgalbumart", &error);
    UIUtilE::Assign(this, btnsearch, "btnsearch", &error);
    UIUtilE::Assign(this, txtedtsearch, "txtedtsearch", &error);
    UIUtilE::Assign(this, txttrack, "texttrack", &error);
    UIUtilE::Assign(this, txtalbum, "textalbum", &error);
    UIUtilE::Assign(this, txtartist, "textartist", &error);
    UIUtilE::Assign(this, txttime, "texttime", &error);
    UIUtilE::Assign(this, progressbar, "progressbar", &error);
    UIUtilE::Assign(this, stateplaybackstate, "playbackstate", &error);
    UIUtilE::Assign(this, stateplaybackmode, "playbackmode", &error);
    
    if (error) {
        LOG(VB_GENERAL, LOG_ERR, "Cannot load screen 'mythspotifyui'");
        return false;
    }

    connect(btnlstplaylists, SIGNAL(itemClicked(MythUIButtonListItem*)),
                    this, SLOT(slt_item_clicked_playlists(MythUIButtonListItem*)));
    connect(btnlstplaylists, SIGNAL(itemSelected(MythUIButtonListItem*)),
                    this, SLOT(slt_item_selected_playlists(MythUIButtonListItem*)));
    connect(btnlsttracks, SIGNAL(itemClicked(MythUIButtonListItem*)),
                    this, SLOT(slt_item_clicked_tracks(MythUIButtonListItem*)));
    connect(btnlsttracks, SIGNAL(itemSelected(MythUIButtonListItem*)),
                    this, SLOT(slt_item_selected_tracks(MythUIButtonListItem*)));
    
    connect(btnsearch, SIGNAL(Clicked()), this, SLOT(slt_search_clicked()));
    
    BuildFocusList();
    
    QString coremark = QString("%1/mythspotify/images/spotify-core-logo-128x128.png").arg(GetShareDir());
    imgcoremark->SetFilename(coremark);
    imgcoremark->Load();

    LoadInForeground();
    return true;
}

void MythSpotifyUI::InitSpotify() {
    CreateBusyDlg("login", "Logging in...", 60000, false);
    musicstreamer = new SpotifyStreamer();

    qRegisterMetaType< QList<Playlist*> >("QList<Playlist*>");

    connect(musicstreamer, SIGNAL(sig_logged_in()), 
                    this, SLOT(slt_logged_in()));
    connect(musicstreamer, SIGNAL(sig_playlists_loaded(QList<Playlist*>)), 
                    this, SLOT(slt_playlists_loaded(QList<Playlist*>)));
    connect(musicstreamer, SIGNAL(sig_search_completed(Playlist*)), 
                    this, SLOT(slt_search_completed(Playlist*)));
    connect(musicstreamer, SIGNAL(sig_art_loaded(Art*, ImageType)),
                    this, SLOT(slt_art_loaded(Art*, ImageType)));
    connect(musicstreamer, SIGNAL(sig_playback_status(int)),
                    this, SLOT(slt_playback_status(int)));
    connect(musicstreamer, SIGNAL(sig_end_of_track()),
                    this, SLOT(slt_end_of_track()));
    connect(musicstreamer, SIGNAL(sig_logged_out()),
                    this, SLOT(slt_logged_out()));
    connect(musicstreamer, SIGNAL(sig_toplist_loaded(Playlist*)), 
                    this, SLOT(slt_toplist_loaded(Playlist*)));
    connect(musicstreamer, SIGNAL(sig_inbox_loaded(Playlist*)), 
                    this, SLOT(slt_inbox_loaded(Playlist*)));
    connect(musicstreamer, SIGNAL(sig_starred_loaded(Playlist*)), 
                    this, SLOT(slt_starred_loaded(Playlist*)));

    musicstreamer->Init();
    
    itemsearch = new MythUIButtonListItem(btnlstplaylists, "");
    itemsearch->DisplayState("search", "playlisttype");
    
    if(itemsearch != NULL) {
        itemsearch->SetText(tr("Search result"), "playlisttitle");
        itemsearch->SetData(qVariantFromValue(NULL));
    }

    itemtoplist = new MythUIButtonListItem(btnlstplaylists, "");
    itemtoplist->DisplayState("toplist", "playlisttype");
    
    if(itemtoplist != NULL) {
        itemtoplist->SetText(tr("Top 100"), "playlisttitle");
        itemtoplist->SetData(qVariantFromValue(NULL));
    }

    iteminbox = new MythUIButtonListItem(btnlstplaylists, "");
    iteminbox->DisplayState("inbox", "playlisttype");
    
    if(iteminbox != NULL) {
        iteminbox->SetText(tr("Inbox"), "playlisttitle");
        iteminbox->SetData(qVariantFromValue(NULL));
    }

    itemstarred = new MythUIButtonListItem(btnlstplaylists, "");
    itemstarred->DisplayState("starred", "playlisttype");
    
    if(itemstarred != NULL) {
        itemstarred->SetText(tr("Starred"), "playlisttitle");
        itemstarred->SetData(qVariantFromValue(NULL));
    }

  
    current_track = NULL;
    active_playlist = NULL;
    qsrand(QTime::currentTime().msec());
    playbackmode = PLAYBACKMODE_LINEAR;
    playbackstate = PLAYBACKSTATE_STOP;
    stateplaybackstate->DisplayState("stop");
    stateplaybackmode->DisplayState("linear");

    QString username = gCoreContext->GetSetting("MythSpotifyUsername", "");
    QString password = gCoreContext->GetSetting("MythSpotifyPassword", "");
   
    if(username.isEmpty()) {
        CloseBusyDlg("login");
        QString message = QString("Username must be set first.");
        MythConfirmationDialog* confirmdlg = new MythConfirmationDialog(popupstack, message, false);
        connect(confirmdlg, SIGNAL(haveResult(bool)), this, SLOT(Close()));
        if(confirmdlg->Create())
            popupstack->AddScreen(confirmdlg);
        return;
    }
    
    if(password.isEmpty()) {
        CloseBusyDlg("login");
        QString message = QString("Enter Spotify password for user %1.").arg(username);
        MythTextInputDialog* textdlg = new MythTextInputDialog(popupstack, message, FilterNone, true);
        connect(textdlg, SIGNAL(haveResult(QString)), this, SLOT(slt_prompt_password(QString)));
        if(textdlg->Create())
            popupstack->AddScreen(textdlg);
        return;
    }

    musicstreamer->Login(username, password);
}

void MythSpotifyUI::DestroySpotify() {
    CreateBusyDlg("logout", "Logging out...", 45000, false);

    delete qVariantValue<Playlist*>(itemsearch->GetData());
    delete qVariantValue<Playlist*>(itemtoplist->GetData());
    delete qVariantValue<Playlist*>(iteminbox->GetData());
    delete qVariantValue<Playlist*>(itemstarred->GetData());

    for(int i = PLAYLIST_TYPE_USER; i < btnlstplaylists->GetCount(); i++) {
        delete qVariantValue<Playlist*>(btnlstplaylists->GetItemAt(i)->GetData());
    }

    musicstreamer->Logout();
    CloseBusyDlg("logout"); 
    delete musicstreamer;
}

bool MythSpotifyUI::keyPressEvent(QKeyEvent* event) {
    if (GetFocusWidget()->keyPressEvent(event))
        return true;
    
    bool handled = false;
    QStringList actions;
    
    handled = GetMythMainWindow()->TranslateKeyPress("Spotify", event, actions);

    for (int i = 0; i < actions.size() && !handled; i++) {
        QString action = actions[i];
        handled = true;
        
        if (action == "MENU") {
            menu_main();
        } else if(action == "EDIT") {
            menu_edit();
        } else if(action == "INFO") {
            menu_info();
        } else if(action == "NEXTTRACK") {
            action_next_track();
        } else if(action == "PREVTRACK") {
            action_prev_track();
        } else if(action == "PAUSE") {
            action_pause();
        } else if(action == "FFWD") {
            action_ffwd();
        } else if(action == "RWND") {
            action_rwnd();    
        } else if(action == "STOP") {
            action_stop();
        } else if(action == "TOGGLEMODE") {
            action_toggle_mode();
        } else {
            handled = false;
        }
    }
    
    if (!handled && MythScreenType::keyPressEvent(event))
        handled = true;
    
    return handled;
}

/*
 * Menus
 */

void MythSpotifyUI::menu_main() {
    QString label = tr("Main Menu");
    
    MythDialogBox* popup = new MythDialogBox(label, popupstack, "popupmenu");
    
    if(popup->Create()) {
        popupstack->AddScreen(popup);
        popup->SetReturnEvent(this, "options");
        
        popup->AddButton(tr("About"), SLOT(slt_view_about()));
        
    } else {
        delete popup;
    }
}

void MythSpotifyUI::menu_info() {
    
}

void MythSpotifyUI::menu_edit() {
    
}

/*
 * Actions
 */

void MythSpotifyUI::action_next_track() {
    if(current_track == NULL || active_playlist == NULL)
        return;
    
    QList<Track*> tracklist = active_playlist->GetTracklist();

    int pos = tracklist.indexOf(current_track);
    int max = tracklist.size();
    
    switch(playbackmode) {
        case PLAYBACKMODE_LINEAR: {
            if(pos < max - 1)
                Play(tracklist[pos + 1]);
            else
                action_stop();
            break;
        }
        case PLAYBACKMODE_SHUFFLE: {
            int rand = qrand() % max + 1;
            Play(tracklist[rand]);
            break;
        }
        case PLAYBACKMODE_REPEAT: {
            Play(current_track);
            break;
        }
    }
}

void MythSpotifyUI::action_prev_track() {
    if(current_track == NULL)
        return;
    
    if(!previous_tracks.isEmpty()) {
        Play(previous_tracks.last());
        previous_tracks.pop_back();
    }
}

void MythSpotifyUI::action_pause() {
    if(playbackstate != PLAYBACKSTATE_STOP) {
        musicstreamer->TogglePause();
        if(playbackstate == PLAYBACKSTATE_PLAY) {
            stateplaybackstate->DisplayState("pause");
            playbackstate = PLAYBACKSTATE_PAUSE;
        } else {
            stateplaybackstate->DisplayState("play");
            playbackstate = PLAYBACKSTATE_PLAY;
        }
    }
}

void MythSpotifyUI::action_stop() {
    stateplaybackstate->DisplayState("stop");
    playbackstate = PLAYBACKSTATE_STOP;
    musicstreamer->Stop();
    if(current_track != NULL)
        btnlsttracks->GetItemByData(qVariantFromValue(current_track))->DisplayState("off", "playing");
}

void MythSpotifyUI::action_ffwd() {
    musicstreamer->FastForward(5000);
}

void MythSpotifyUI::action_rwnd() {
    musicstreamer->Rewind(5000);
}

void MythSpotifyUI::action_toggle_mode() {
    if(playbackmode == PLAYBACKMODE_LINEAR) {
        playbackmode = PLAYBACKMODE_SHUFFLE;
        stateplaybackmode->DisplayState("shuffle");
    } else if(playbackmode == PLAYBACKMODE_SHUFFLE) {
        playbackmode = PLAYBACKMODE_REPEAT;
        stateplaybackmode->DisplayState("repeat");
    } else {
        playbackmode = PLAYBACKMODE_LINEAR;
        stateplaybackmode->DisplayState("linear");
    }
}
    
/*
 * UI Slots
 */

void MythSpotifyUI::slt_item_clicked_playlists(MythUIButtonListItem* item) {
    
}

void MythSpotifyUI::slt_item_selected_playlists(MythUIButtonListItem* item) {
    btnlsttracks->Reset();
    
    Playlist* playlist = qVariantValue<Playlist*>(item->GetData());
   
    if(playlist == NULL || playlist->GetNumTracks() <= 0) {
        MythUIButtonListItem* item = new MythUIButtonListItem(btnlsttracks, "");
        
        if(item != NULL) {
            item->SetText(tr("No tracks found"), "titletrack");
            item->SetData(qVariantFromValue(NULL));
        } 
        return;
    }
   
   
    QList<Track*> tracks = playlist->GetTracklist();
    
    for(int i = 0; i < tracks.size(); i++) {
        Track* track = tracks[i];
        QString titletrack = QString(track->GetNameTrack());
        QString titlealbum = QString(track->GetNameAlbum());
        QString titleartist = QString(track->GetNameArtist());

        QString year = QString::number(track->GetYear());
        QString duration = FormatTime(track->GetDuration());
        int popularity = track->GetPopularity();
        bool available = track->IsAvailable();
        bool starred = track->IsStarred();

        MythUIButtonListItem* item = new MythUIButtonListItem(btnlsttracks, "");

        if(item != NULL) {
            item->SetText(titletrack, "titletrack");
            item->SetText(titleartist, "titleartist");
            SetPopularityState(item, popularity);
            item->DisplayState(starred ? "on" : "off", "starred");
            item->SetText(duration, "duration");
            item->SetData(qVariantFromValue<Track*>(track));
            if(playbackstate == PLAYBACKSTATE_PLAY && current_track == track) {
                item->DisplayState("playing", "playing");
                btnlsttracks->SetItemCurrent(item);
            }
        }
    }
}

void MythSpotifyUI::slt_item_clicked_tracks(MythUIButtonListItem* item) {
    Track* track = qVariantValue<Track*>(item->GetData());
    
    if(track != NULL) {
        active_playlist = qVariantValue<Playlist*>(btnlstplaylists->GetItemCurrent()->GetData());
        Play(track);
    }
}

void MythSpotifyUI::slt_item_selected_tracks(MythUIButtonListItem* item) {
    
}

void MythSpotifyUI::slt_search_clicked() {
    QString query = txtedtsearch->GetText();
    if(!query.isEmpty()) {
        CreateBusyDlg("search", tr("Searching for %1").arg(query), 45000, false);
        musicstreamer->Search(query, 0, 100, 0, 0, 0, 0);
    }
    
}

void MythSpotifyUI::slt_view_about() {
    QString text = "This product uses SPOTIFY(R) CORE but is not endorsed, certified or "
                    "otherwise approved in any way by Spotify. Spotify is the registered "
                    "trade mark of the Spotify Group.";
    MythSpotifyDlg* dlg = new MythSpotifyDlg(popupstack, "popupdlg", text);
    
    if(dlg->Create())
        popupstack->AddScreen(dlg);
    
}

void MythSpotifyUI::slt_prompt_password(QString password) {
    QString username = gCoreContext->GetSetting("MythSpotifyUsername", "");
    musicstreamer->Login(username, password);
}

void MythSpotifyUI::slt_error(QString error) {
    QString message = tr("An error occured: %1").arg(error);
    MythConfirmationDialog* confirmdlg = new MythConfirmationDialog(popupstack, message, false);
    
    if(confirmdlg->Create())
        popupstack->AddScreen(confirmdlg);
    
}

void MythSpotifyUI::slt_playback_status() {
    
}

void MythSpotifyUI::slt_message(QString message) {
    MythConfirmationDialog* confirmdlg = new MythConfirmationDialog(popupstack, message, false);
    
    if(confirmdlg->Create()) 
        popupstack->AddScreen(confirmdlg);
    
}

void MythSpotifyUI::slt_art_loaded(Art* art, ImageType type) {
	switch(type) {
		case IMAGE_TYPE_ALBUM:
            imgalbumart->Reset();
            imgalbumart->SetFilename(art->GetFilename());
            imgalbumart->Load();
			break;
		case IMAGE_TYPE_PLAYLIST:
            imgplaylistart->Reset();
            imgplaylistart->SetFilename(art->GetFilename());
            imgplaylistart->Load();
			break;
		case IMAGE_TYPE_ARTIST:
            imgartistart->Reset();
            imgartistart->SetFilename(art->GetFilename());
            imgartistart->Load();
			break;
	}
}

void MythSpotifyUI::slt_logged_in() {
    CloseBusyDlg("login");

    CreateBusyDlg("playlists", "Loading Playlists...", 45000, false);
    musicstreamer->LoadPlaylists();
     
    CreateBusyDlg("toplist", "Loading Toplist...", 45000, false);
    musicstreamer->LoadToplist();

    CreateBusyDlg("inbox", "Loading Inbox...", 45000, false);
    musicstreamer->LoadInbox();

    CreateBusyDlg("starred", "Loading Starred...", 45000, false);
    musicstreamer->LoadStarred();

}

void MythSpotifyUI::slt_logged_out() {
    
}

void MythSpotifyUI::slt_search_completed(Playlist* playlist) {
    if(itemsearch != NULL) {
        if(active_playlist != qVariantValue<Playlist*>(itemsearch->GetData()))
            delete qVariantValue<Playlist*>(itemsearch->GetData());
        itemsearch->SetData(qVariantFromValue<Playlist*>(playlist));
    }
    
    btnlstplaylists->SetItemCurrent(itemsearch);
    btnlstplaylists->Update();
    CloseBusyDlg("search");
}

void MythSpotifyUI::slt_playlists_loaded(QList<Playlist*> playlists) {
    
    //for(int i = PLAYLIST_TYPE_USER; i < btnlstplaylists->GetCount(); i++) {
    //    btnlstplaylists->RemoveItem(btnlstplaylists->GetItemAt(i));
    //}

    for(int i = 0; i < playlists.size(); i++) {
        MythUIButtonListItem* item = new MythUIButtonListItem(btnlstplaylists, "");
        if(item != NULL) {
            item->SetData(qVariantFromValue<Playlist*>(playlists[i]));
            item->SetText(playlists[i]->GetName(), "playlisttitle");
            item->DisplayState("user", "playlisttype");
        }
    }
    
    btnlstplaylists->Update();
    
    CloseBusyDlg("playlists");
}

void MythSpotifyUI::slt_toplist_loaded(Playlist* playlist) {
    if(itemtoplist != NULL) {
            itemtoplist->SetData(qVariantFromValue<Playlist*>(playlist));
    }
    btnlstplaylists->Update();
    CloseBusyDlg("toplist");
}

void MythSpotifyUI::slt_inbox_loaded(Playlist* playlist) {
    if(iteminbox != NULL) {
            iteminbox->SetData(qVariantFromValue<Playlist*>(playlist));
    }
    btnlstplaylists->Update();
    CloseBusyDlg("inbox");


}

void MythSpotifyUI::slt_starred_loaded(Playlist* playlist) {
    if(itemstarred != NULL) {
            itemstarred->SetData(qVariantFromValue<Playlist*>(playlist));
    }
    btnlstplaylists->Update();
    CloseBusyDlg("starred");

}


void MythSpotifyUI::slt_track_loaded() {
    
}

void MythSpotifyUI::slt_playback_status(int time) {
    if(current_track != NULL) {
        int totaltime = current_track->GetDuration();
        if(txttime != NULL)
            txttime->SetText(QString("%1 / %2").arg(FormatTime(time)).arg(FormatTime(totaltime)));

        if (progressbar != NULL) {
            int percent = (int)(((double)time / (double)totaltime) * 100);
            progressbar->SetTotal(100);
            progressbar->SetUsed(percent);
        }
    }
}

void MythSpotifyUI::slt_end_of_track() {
    action_next_track();
}

void MythSpotifyUI::CreateBusyDlg(const QString& id, const QString& message, int timeout, bool exit) {
    
    MythSpotifyBusyDlg* busydlg = new MythSpotifyBusyDlg(message, popupstack, "busydlg", timeout, exit);

    if (busydlg->Create()) {
        popupstack->AddScreen(busydlg);
        busydialogs[QString(id)] = busydlg;
    } else {
        delete busydlg;
    }
    
}

void MythSpotifyUI::CloseBusyDlg(const QString& id) {
    if(!busydialogs.contains(id))
        return;

    MythSpotifyBusyDlg* busydlg = busydialogs[id];
    if(busydlg != NULL) {
        busydlg->Close();
        busydlg = NULL;
    }
    busydialogs.remove(id);
}

QString MythSpotifyUI::FormatTime(int msec) {
    int sec = msec / 1000;
    int min = sec / 60;
           
    if(min > 0)
        sec = sec % (min * 60);
    QString time = QString("%1:%2").arg(min, 0, 10).arg(sec, 2, 10, QChar('0'));
    return time;
}

void MythSpotifyUI::Play(Track* track) {
    if(track != NULL) {
        Track* previous = current_track;

        MythUIButtonListItem* next = btnlsttracks->GetItemByData(qVariantFromValue(track));

        if(previous != NULL) {
            previous_tracks.push_back(previous);
            MythUIButtonListItem* prev = btnlsttracks->GetItemByData(qVariantFromValue(previous));
            if(prev != NULL) {
                prev->DisplayState("off", "playing");
                if(btnlsttracks->GetItemCurrent() == prev && next != NULL)
                    btnlsttracks->SetItemCurrent(next);
                    
            }
        }

        imgalbumart->Reset();
        musicstreamer->Stop();
        musicstreamer->LoadAlbumArt(track);
        musicstreamer->LoadTrack(track);
        musicstreamer->Play();

        txttrack->SetText(track->GetNameTrack());
        txtalbum->SetText(track->GetNameAlbum());
        txtartist->SetText(track->GetNameArtist());
        
        if(next != NULL)
            next->DisplayState("playing", "playing");

        current_track = track;

        stateplaybackstate->DisplayState("play");
        playbackstate = PLAYBACKSTATE_PLAY;
    }
}

void MythSpotifyUI::SetPopularityState(MythUIButtonListItem* item, int popularity) {
    if(popularitymap.size() != 10) {
        popularitymap.clear();
        popularitymap[0] = QString("zero");
        popularitymap[1] = QString("one");
        popularitymap[2] = QString("two");
        popularitymap[3] = QString("tree");
        popularitymap[4] = QString("four");
        popularitymap[5] = QString("five");
        popularitymap[6] = QString("six");
        popularitymap[7] = QString("seven");
        popularitymap[8] = QString("eight");
        popularitymap[9] = QString("nine");
        popularitymap[10] = QString("ten");
    }

    if(item != NULL) {
        item->DisplayState(popularitymap[(int)((popularity / 10) + 0.5)], "popularity");
    }
}

void MythSpotifyUI::DeletePlaylist(Playlist*& playlist) {

}
