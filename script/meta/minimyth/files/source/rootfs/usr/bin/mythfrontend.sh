#!/bin/sh

params="--verbose libav,playback,audio,gpu --loglevel=debug --syslog none --logpath /tmp/ -O IgnoreSchemaVerMismatch=1 -O IgnorCeProtoVerMismatch=1"






. /etc/rc.d/functions

if [ x$1 = "xeglfs" ] || [ x$2 = "xeglfs" ]; then
    echo "Runing myth in EGLFS"
    export QT_QPA_PLATFORM=eglfs
    export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
    export QT_QPA_EGLFS_DEBUG=1
    export QT_QPA_DEBUG=1
    if [ "x${MM_MYTHTV_DRM_VIDEO}" = "xyes" ] ; then
        echo "Using DRM_PRIME in DRM planes mode"
        export MYTHTV_DRM_VIDEO=1
    fi
elif [ x$1 = "xwayland" ] || [ x$2 = "xwayland" ]; then
    echo "Runing myth in Wayland-EGL"
    export QT_QPA_PLATFORM=wayland-egl
    export QT_QPA_DEBUG=1
    if [ "x${MM_MYTHTV_DRM_VIDEO}" = "xyes" ] ; then
        echo "Using DRM_PRIME in DRM planes mode"
        export MYTHTV_DRM_VIDEO=1
    fi
    export XDG_RUNTIME_DIR=/var/run/xdg/minimyth
else
    echo "Runing myth in XCB"
    export QT_QPA_PLATFORM=xcb
    export QT_QPA_DEBUG=1
fi

export QT_PLUGIN_PATH=/usr/lib/qt5/plugins
export QT_LOGGING_RULES=qt.qpa.*=true

env

if [ x$1 = "xgdb" ] || [ x$2 = "xgdb" ]; then
    echo "Runing myth under gdb"
    su minimyth -c "gdb /usr/bin/mythfrontend -x /etc/gdb.commands"
elif [ x$1 = "xapitrace" ] || [ x$2 = "xapitrace" ]; then
    echo "Running myth under apitrace"
    su minimyth -c "apitrace trace -a egl -o /usr/local/share/mythfrontend-apitrace.txt mythfrontend ${params}"
elif [ x$1 = "xstrace" ] || [ x$2 = "xstrace" ]; then
    echo "Running myth under strace"
    su minimyth -c "strace -o /usr/local/share/mythfrontend-strace.txt mythfrontend ${params}"
else
    su minimyth -c "/usr/bin/mythfrontend ${params}"
fi

# all             - ALL available debug output
# audio           - Audio related messages
# channel         - Channel related messages
# chanscan        - Channel Scanning messages
# commflag        - Commercial detection related messages
# database        - Display all SQL commands executed
# decode          - MPEG2Fix Decode messages
# dsmcc           - DSMCC carousel related messages
# dvbcam          - DVB CAM debugging messages
# eit             - EIT related messages
# file            - File and AutoExpire related messages
# frame           - MPEG2Fix frame messages
# general         - General info
# gpu             - GPU Commercial Flagging messages
# gpuaudio        - GPU Audio Processing messages
# gpuvideo        - GPU Video Processing messages
# gui             - GUI related messages
# idle            - System idle messages
# jobqueue        - JobQueue related messages
# libav           - Enables libav debugging
# media           - Media Manager debugging messages
# mheg            - MHEG debugging messages
# most            - Most debug (nodatabase,notimestamp,noextra)
# network         - Network protocol related messages
# none            - NO debug output
# osd             - On-Screen Display related messages
# playback        - Playback related messages
# process         - MPEG2Fix processing messages
# record          - Recording related messages
# refcount        - Reference Count messages
# rplxqueue       - MPEG2Fix Replex Queue messages
# schedule        - Scheduling related messages
# siparser        - Siparser related messages
# socket          - socket debugging messages
# system          - External executable related messages
# timestamp       - Conditional data driven messages
# upnp            - UPnP debugging messages
# vbi             - VBI related messages
# xmltv           - xmltv output and related messages
