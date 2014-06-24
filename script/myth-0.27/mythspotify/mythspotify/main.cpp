// mythtv
#include <mythcontext.h>
#include <mythplugin.h>
#include <mythpluginapi.h>
#include <mythversion.h>
#include <myththemedmenu.h>
#include <mythmainwindow.h>
#include <mythuihelper.h>
// mythspotify
#include "mythspotifyui.h"
#include "mythspotifysettings.h"

static void setupKeys();
static void runMythSpotify();
static int RunMythSpotify();


int mythplugin_init(const char* libversion) {
    if (!gCoreContext->TestPluginVersion("mythspotify", libversion, MYTH_BINARY_VERSION))
        return -1;

    MythSpotifySettings settings;
    settings.Load();
    settings.Save();
    
    setupKeys();
    return 0;
}

int mythplugin_config() {
    MythSpotifySettings settings;
    settings.exec();
    
    return 0;
}

int mythplugin_run() {
    return RunMythSpotify();
}

void mythplugin_destroy() {
    //TODO Delete something
}

static void setupKeys() {
    
    REG_JUMP("MythSpotify", QT_TRANSLATE_NOOP("MythControls",
        "Spotify for Mythtv"), "", runMythSpotify);
    
    REG_KEY("Spotify", "PAUSE",     "Pause",          "P");
    REG_KEY("Spotify", "NEXTTRACK", "Next track",     "N");
    REG_KEY("Spotify", "PREVTRACK", "Previous track", "B");
    REG_KEY("Spotify", "STOP",      "Stop",           "O");
    REG_KEY("Spotify", "FFWD",      "Fast forward",   "X");
    REG_KEY("Spotify", "RWND",      "Rewind",         "Z");
    REG_KEY("Spotify", "TOGGLEMODE", "Toggle playbackmode", "1");
    
}

static void runMythSpotify() {
    RunMythSpotify();
}

static int RunMythSpotify() {
    MythScreenStack* mainstack = GetMythMainWindow()->GetMainStack();
    MythSpotifyUI* mythspotifyui = new MythSpotifyUI(mainstack, "MythSpotify");
    
    if(mythspotifyui->Create()) {
        mainstack->AddScreen(mythspotifyui);
        mythspotifyui->InitSpotify();
        return 0;
    } else {
        delete mythspotifyui;
        return -1;
    }
}
