include ( ../../mythconfig.mak )
include ( ../../settings.pro )
include ( ../../programs-libs.pro )

QT += xml sql opengl qt3support network 

TEMPLATE = lib
CONFIG += plugin thread

#Debug
CONFIG -= debug_and_release app_bundle lib_bundle
CONFIG += debug 
CONFIG += console
#Debug


TARGET = mythspotify
target.path = $${LIBDIR}/mythtv/plugins
INSTALLS += target

installimages.path = $${PREFIX}/share/mythtv/mythspotify/images
installimages.files = ../images/*.png

INSTALLS += installimages

INCLUDEPATH += $${PREFIX}/include/mythtv
INCLUDEPATH += $${PREFIX}/include/mythtv/libmythbase
INCLUDEPATH += $${PREFIX}/include/mythtv/libmyth
INCLUDEPATH += $${PREFIX}/include/mythtv/libmythui
INCLUDEPATH += $${PREFIX}/include/mythtv/libmythdb
INCLUDEPATH += $${PREFIX}/include/libspotify

LIBS += -lmythavformat
LIBS += -lmythavcodec
LIBS += -lmythavutil

win32 {
    DEFINES += "CALLBACK=__stdcall"
    INCLUDEPATH += ../libs/libspotify-0.0.8-win32/include/
    LIBS += -L../libs/libspotify-0.0.8-win32/lib -lspotify
    libfiles.path = $${LIBDIR}
    libfiles.files = ../libs/libspotify-0.0.8-win32/lib/lib*
    INSTALLS += libfiles
}
unix {
    HARDWARE_PLATFORM = $$system(uname -m)
    contains( HARDWARE_PLATFORM, x86_64 ) {
        #64bit

        DEFINES += "CALLBACK="
        INCLUDEPATH += ../libs/libspotify-9.1.32-Linux-x86_64/include/
        LIBS += -L../libs/libspotify-9.1.32-Linux-x86_64/lib -lspotify
        libfiles.path = $${LIBDIR}
        libfiles.files = ../libs/libspotify-9.1.32-Linux-x86_64/lib/lib*
        INSTALLS += libfiles
    } else {
        #32bit

        DEFINES += "CALLBACK="
        INCLUDEPATH += ../libs/libspotify-0.0.8-linux6-i686/include/
        LIBS += -L../libs/libspotify-0.0.8-linux6-i686/lib -lspotify
        libfiles.path = $${LIBDIR}
        libfiles.files = ../libs/libspotify-0.0.8-linux6-i686/lib/lib*
        INSTALLS += libfiles
    }

}
macx {
    DEFINES += "CALLBACK="
    INCLUDEPATH += ../libs/libspotify-0.0.8-Darwin/include/
    LIBS += -L../libs/libspotify-0.0.8-Darwin/lib -lspotify
    libfiles.path = $${LIBDIR}
    libfiles.files = ../libs/libspotify-0.0.8-Darwin/lib/lib*
    INSTALLS += libfiles
}

# Input
HEADERS += audiodata.h imageformat.h playbackmode.h spotifyapi.h spotifymainthread.h appkey.h audioplayback.h musicstreamer.h playbackstate.h spotifystreamer.h art.h audioqueue.h mythspotifyui.h playlist.h spotifycallbacks.h spotifytrack.h offlinestate.h track.h mythspotifydlg.h mythspotifysettings.h spotifyplaylist.h imagetype.h
SOURCES += art.cpp audioplayback.cpp main.cpp spotifytrack.cpp audioqueue.cpp mythspotifyui.cpp spotifymainthread.cpp track.cpp audiodata.cpp playlist.cpp spotifyplaylist.cpp spotifycallbacks.cpp spotifystreamer.cpp mythspotifydlg.cpp mythspotifysettings.cpp
ECXXFLAGS += -enable-stdcall-fixup
include ( ../../libs-targetfix.pro )
