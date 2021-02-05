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
# If param is 'xxx':
#   starts 'xxx'
#




. /etc/rc.d/functions

# Uncomment to degug Qt QPA
# export QT_QPA_DEBUG=1


export QT_PLUGIN_PATH=/usr/lib/qt5/plugins
export QT_LOGGING_RULES=qt.qpa.*=true

# Setup desired env variables
case "${MM_MYTHTV_DRAW_ON}" in

    eglfs)
        /usr/bin/logger -t minimyth -p "local0.info" "[functions] Starting '${args}' in EGLFS..."
        echo "Runing with drawing to EGLFS"
        export QT_QPA_PLATFORM=eglfs
        export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
        # export QT_QPA_EGLFS_DEBUG=1
        if [ "x${MM_MYTHTV_DRM_VIDEO}" = "xyes" ] ; then
            echo "Using DRM_PRIME in DRM planes mode"
            export MYTHTV_DRM_VIDEO=1
        fi
        ;;

    wayland)
        /usr/bin/logger -t minimyth -p "local0.info" "[functions] Starting '${args}' in Wayland..."
        echo "Runing with drawing to Wayland-EGL"
        export QT_QPA_PLATFORM=wayland-egl
        export XDG_RUNTIME_DIR=/var/run/xdg/minimyth
        ;;

    x11|*)
        echo "Runing with drawing to Xorg"
        export QT_QPA_PLATFORM=xcb
        if [ x${mode} = 'xforeground' ] ; then
            /usr/bin/logger -t minimyth -p "local0.info" "[functions] Starting '${args}' in foreground in X11..."
            su minimyth -c "${args}"
        else
            /usr/bin/logger -t minimyth -p "local0.info" "[functions] Starting '${args}' in background in X11..."
            su minimyth -c "${args}" &
        fi
        ;;

esac

env

if [ -n "${MM_MYTHFRONTEND_CMDLINE}" ] ; then
    myth_cmdline="${MM_MYTHFRONTEND_CMDLINE}"
else
    myth_cmdline="mythfrontend --no-syslog"
fi

echo "Myth cmd.line:"${myth_cmdline}

if [ x$1 = "xgdb" ] ; then

    echo "Starting under GDB"
    su minimyth -c "gdb ${myth_cmdline} -x /etc/gdb.commands"

elif [ x$1 = "xapitrace" ] ; then

    echo "Starting under apitrace"
    su minimyth -c "apitrace trace -a egl -o /usr/local/share/mythfrontend-apitrace.txt ${myth_cmdline}"

elif [ x$1 = "xstrace" ] ; then

    echo "Starting under strace"
    su minimyth -c "strace -o /usr/local/share/mythfrontend-strace.txt ${myth_cmdline}"

elif [ x$1 != "x" ] ; then

    su minimyth -c "${1}"

else

    su minimyth -c "${myth_cmdline}"

fi
