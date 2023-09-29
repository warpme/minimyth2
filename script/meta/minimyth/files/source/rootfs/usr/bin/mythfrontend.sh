#!/bin/sh

# All cases: starting is as minimyth user by using 'su minimyth -c "..."'
#
# Launched without any params:
#   use MM_MYTHTV_DRAW_ON to select drawing method (eglfs|wayland|x11)
#   if MM_MYTHFRONTEND_CMDLINE defined)  - use it as ${myth_cmdline}
#   if MM_MYTHFRONTEND_CMDLINE not defined, starts with ${myth_cmdline}='mythfrontend --no-syslog'
#
# If param is 'gdb':
#   gdb ${myth_cmdline} -x /etc/gdb.commands"
#
# If param is 'apitrace':
#   apitrace trace -a egl -o /usr/local/share/mythfrontend-apitrace.txt ${myth_cmdline}"
#
# If param is 'strace':
#   strace -o /usr/local/share/mythfrontend-strace.txt ${myth_cmdline}
#
# If param is 'eglfs':
#   select drawing method: eglfs
#   if MM_MYTHFRONTEND_CMDLINE defined)  - use it as ${myth_cmdline}
#   if MM_MYTHFRONTEND_CMDLINE not defined, starts with ${myth_cmdline}='mythfrontend --no-syslog'
#
# If param is 'eglfsdrm':
#   select drawing method: eglfs with MYTHTV_DRM_VIDEO=1 set
#   if MM_MYTHFRONTEND_CMDLINE defined)  - use it as ${myth_cmdline}
#   if MM_MYTHFRONTEND_CMDLINE not defined, starts with ${myth_cmdline}='mythfrontend --no-syslog'
#
# If param is 'wayland':
#   select drawing method: wayland
#   if MM_MYTHFRONTEND_CMDLINE defined)  - use it as ${myth_cmdline}
#   if MM_MYTHFRONTEND_CMDLINE not defined, starts with ${myth_cmdline}='mythfrontend --no-syslog'
#
# If param is 'xxx':
#   starts 'xxx'
#

# Uncomment to degug Qt QPA
# export QT_QPA_DEBUG=1
# export QT_LOGGING_RULES=qt.qpa.*=true
# export QT_QPA_EGLFS_DEBUG=1
# export QT_DEBUG_PLUGINS=1








. /etc/rc.d/functions

stop_kodi() {
    list_to_stop="kodi-gbm kodi-wayland kodi-x11"
    for prog in ${list_to_stop} ; do
        if [ -n "`/bin/pidof ${prog}`" ] ; then
            /usr/bin/killall ${prog} 2> /dev/null
            while [ -n "`/bin/pidof ${prog}`" ] ; do
                /usr/bin/killall ${prog} 2> /dev/null
                /bin/sleep 1
                echo "Waiting ${prog} to exit ..."
            done
            echo "${prog} successfuly stopped ..."
        else
            echo "${prog} is not running ..."
        fi
    done
    sleep 1
}

set_myth_user_env() {
    if [ -n "${MM_MYTHTV_SET_ENV_VAR}" ] ; then
        for VAR in `echo ${MM_MYTHTV_SET_ENV_VAR} | sed -e "s/:/ /g"` ; do
            export ${VAR}
            echo "setting ${VAR}"
        done
    fi
}

date

export XDG_RUNTIME_DIR=/var/run/xdg/minimyth
# export MESA_SHADER_CACHE_DISABLE=1

if [ x${MM_MYTHTV_DRAW_ON} = "xterm" ] ; then
    echo " "
    echo "You configured 'term' in MM_MYTHTV_DRAW_ON !!!"
    echo "despite that we will start mythtv in least demanding mode: EGLFS"
    echo " "
fi

stop_kodi

date

# Setup desired env variables
case "${MM_MYTHTV_DRAW_ON}" in

    eglfs|term)
        /usr/bin/logger -t minimyth -p "local0.info" "[mythfrontend.sh] Starting mythfrontend in EGLFS ..."
        export QT_QPA_PLATFORM=eglfs
        export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
        if [ "x${MM_MYTHTV_DRM_VIDEO}" = "xyes" ] ; then
            echo "Runing with drawing to EGLFS and video render to DRM plane"
            export MYTHTV_DRM_VIDEO=1
        else
            echo "Runing with drawing to EGLFS and video render via EGL DMAbuf"
        fi
        if [ -e /home/minimyth/.mythtv/eglfs-config.json ] ; then
            export export QT_QPA_EGLFS_KMS_CONFIG="/home/minimyth/.mythtv/eglfs-config.json"
            echo "Using custom eglfs-config.json with content:"
            cat /home/minimyth/.mythtv/eglfs-config.json
        fi
        ;;

    wayland)
        echo "Runing with drawing to Wayland-EGL and video render via EGL DMAbuf"
        /usr/bin/logger -t minimyth -p "local0.info" "[mythfrontend.sh] Starting mythfrontend in Wayland ..."
        export WAYLAND_DISPLAY=wayland-1
        export QT_QPA_PLATFORM=wayland-egl
        ;;

    x11|*)
        echo "Runing with drawing to Xorg and video render via EGL DMAbuf"
        export QT_QPA_PLATFORM=xcb
        export DISPLAY=':0.0'
        /usr/bin/logger -t minimyth -p "local0.info" "[mythfrontend.sh] Starting mythfrontend in X11 ..."
        ;;

esac

set_myth_user_env

env

if [ -n "${MM_MYTHFRONTEND_CMDLINE}" ] ; then
    myth_cmdline="${MM_MYTHFRONTEND_CMDLINE}"
else
    myth_cmdline="mythfrontend"
fi

echo "Myth cmd.line:"${myth_cmdline}

date

if [ x$1 = "xgdb" ] ; then

    echo "Starting under GDB"
    su minimyth -c "gdb mythfrontend -x /etc/gdb.commands"

elif [ x$1 = "xapitrace" ] ; then

    echo "Starting under apitrace"
    su minimyth -c "apitrace trace -a egl -o /usr/local/share/mythfrontend-apitrace.txt ${myth_cmdline}"

elif [ x$1 = "xstrace" ] ; then

    echo "Starting under strace"
    su minimyth -c "strace -o /usr/local/share/mythfrontend-strace.txt ${myth_cmdline}"

elif [ x$1 = "xeglfs" ] ; then
    echo "Runing with drawing to EGLFS"
    /usr/bin/logger -t minimyth -p "local0.info" "[mythfrontend.sh] Starting mythfrontend in EGLFS EGL DMABUF ..."
    export QT_QPA_PLATFORM=eglfs
    export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
    su minimyth -c "${myth_cmdline}"

elif [ x$1 = "xeglfsdrm" ] ; then
    echo "Runing with drawing to EGLFS"
    /usr/bin/logger -t minimyth -p "local0.info" "[mythfrontend.sh] Starting mythfrontend in EGLFS DRM DMABUF ..."
    export QT_QPA_PLATFORM=eglfs
    export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
    echo "Using DRM_PRIME in DRM planes mode"
    export MYTHTV_DRM_VIDEO=1
    su minimyth -c "${myth_cmdline}"

elif [ x$1 = "xwayland" ] ; then
    echo "Runing with drawing to Wayland-EGL"
    /usr/bin/logger -t minimyth -p "local0.info" "[mythfrontend.sh] Starting mythfrontend in Wayland ..."
    export WAYLAND_DISPLAY=wayland-1
    export QT_QPA_PLATFORM=wayland-egl
    su minimyth -c "${myth_cmdline}"

elif [ x$1 != "x" ] ; then

    su minimyth -c "${1}"

else

    su minimyth -c "${myth_cmdline}"

fi
