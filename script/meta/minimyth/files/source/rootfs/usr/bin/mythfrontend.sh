
if [ x$1 = "xeglfs" ]; then
    QT_QPA_PLATFORM=eglfs
else
    QT_QPA_PLATFORM=xcb
fi

QT_QPA_EGLFS_FORCE888=1
QT_PLUGIN_PATH=/usr/lib/qt5/plugins

export QT_QPA_EGLFS_FORCE888
export QT_QPA_PLATFORM
export QT_PLUGIN_PATH

su minimyth -c "/usr/bin/mythfrontend --verbose libav,playback,audio --loglevel=debug --syslog none --logpath /tmp/"

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
