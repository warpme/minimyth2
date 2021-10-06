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









. /etc/rc.d/functions

export QT_PLUGIN_PATH=/usr/lib/@mm_QT_VERSION@/plugins
export XDG_RUNTIME_DIR=/var/run/xdg/minimyth

if [ -n "${MM_MYTHTV_SET_ENV_VAR}" ] ; then
    export ${MM_MYTHTV_SET_ENV_VAR}
fi

# Setup desired env variables
case "${MM_MYTHTV_DRAW_ON}" in

    eglfs)
        echo "Runing with drawing to EGLFS"
        /usr/bin/logger -t minimyth -p "local0.info" "[mythfrontend.sh] Starting mythfrontend in EGLFS ..."
        export QT_QPA_PLATFORM=eglfs
        export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
        if [ "x${MM_MYTHTV_DRM_VIDEO}" = "xyes" ] ; then
            echo "Using DRM_PRIME in DRM planes mode"
            export MYTHTV_DRM_VIDEO=1
        fi
        ;;

    wayland)
        echo "Runing with drawing to Wayland-EGL"
        /usr/bin/logger -t minimyth -p "local0.info" "[mythfrontend.sh] Starting mythfrontend in Wayland ..."
        export QT_QPA_PLATFORM=wayland-egl
        ;;

    x11|*)
        echo "Runing with drawing to Xorg"
        export QT_QPA_PLATFORM=xcb
        /usr/bin/logger -t minimyth -p "local0.info" "[mythfrontend.sh] Starting mythfrontend in X11 ..."
        ;;

esac

env

if [ -n "${MM_MYTHFRONTEND_CMDLINE}" ] ; then
    myth_cmdline="${MM_MYTHFRONTEND_CMDLINE}"
else
    myth_cmdline="mythfrontend"
fi

echo "Myth cmd.line:"${myth_cmdline}

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
    export QT_QPA_PLATFORM=wayland-egl
    su minimyth -c "${myth_cmdline}"

elif [ x$1 != "x" ] ; then

    su minimyth -c "${1}"

else

    su minimyth -c "${myth_cmdline}"

fi
