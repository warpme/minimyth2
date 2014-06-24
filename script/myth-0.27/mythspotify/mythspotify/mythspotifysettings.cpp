
// qt
#include <QDir>

// mythtv
#include <mythcontext.h>

// mythspotify
#include "mythspotifysettings.h"


static HostLineEdit* MythSpotifyCacheDir() {
    HostLineEdit *gc = new HostLineEdit("MythSpotifyCache");
    gc->setLabel(QObject::tr("Directory that holds Spotify cache and settings"));
    gc->setValue(QDir::homePath() + "/.mythtv/spotify/cache");
    gc->setHelpText(QObject::tr("This directory must exist and "
                       	"MythTV needs to have read and write permissions. "
			            "Make sure sufficent storage is available as this directory "
			            "can grow in size, especially when offline mode is used."));
    return gc;
};

static HostComboBox* MythSpotifyBitrate() {
    HostComboBox *gc = new HostComboBox("MythSpotifyBitrate");
    gc->setLabel(QObject::tr("Bitrate"));
    gc->addSelection("Standard", "standard");
    gc->addSelection("High", "high");
    gc->addSelection("Low", "low");
    gc->setHelpText(QObject::tr("Applies to streaming and offline playlists."
                        "Standard = 160kbps, High = 320kbps, Low = 96kbps"));

    return gc;
};

static HostLineEdit* MythSpotifyUsername() {
    HostLineEdit *gc = new HostLineEdit("MythSpotifyUsername");
    gc->setLabel(QObject::tr("Spotify username"));
    gc->setValue("");
    gc->setHelpText(QObject::tr("Your Spotify username. Must be a premium account."));

    return gc;
};

static HostLineEdit* MythSpotifyPassword() {
    HostLineEdit *gc = new HostLineEdit("MythSpotifyPassword");
    gc->setLabel(QObject::tr("Spotify password"));
    gc->setValue("");
    gc->setHelpText(QObject::tr("Password is stored unencrypted in MythTVs database. "
                    		"If left empty you will be prompted everytime the plugin is started."));
    return gc;
};

MythSpotifySettings::MythSpotifySettings() {
    VerticalConfigurationGroup* settings = new VerticalConfigurationGroup(false);
    settings->setLabel(QObject::tr("MythSpotify Settings"));
    settings->addChild(MythSpotifyCacheDir());
    settings->addChild(MythSpotifyBitrate());
    settings->addChild(MythSpotifyUsername());
    settings->addChild(MythSpotifyPassword());
    addChild(settings);

}


