#!/bin/sh

. /etc/rc.d/functions

stop_mythfrontend() {
    /usr/bin/killall mythfrontend 2> /dev/null
    while [ -n "`/bin/pidof mythfrontend`" ] ; do
        /usr/bin/killall mythfrontend 2> /dev/null
        /bin/sleep 1
        echo "Stopping mythfrontend ..."
    done
    echo "Mythfrontend is not running ..."
}

if [ -n "${MM_MYTHTV_SET_ENV_VAR}" ] ; then
    export ${MM_MYTHTV_SET_ENV_VAR}
fi

if [ x${MM_MYTHTV_DRAW_ON} = "xterm" ] ; then
    echo " "
    echo "You configured 'term' in MM_MYTHTV_DRAW_ON !!!"
    echo "despite that we will start Kodi in least demanding mode: GBM"
    echo " "
fi

# Setup desired env variables
case "${MM_MYTHTV_DRAW_ON}" in

    eglfs|term)
        echo "Runing with drawing to GBM"
        /usr/bin/logger -t minimyth -p "local0.info" "[kodi.sh] Starting Kodi in GBM ..."
        unset DISPLAY
        unset WAYLAND_DISPLAY
        /etc/rc.d/init.d/frontend stop
        kodi_cmdline="/usr/lib/kodi/kodi-gbm"
        ;;

    wayland)
        echo "Runing with drawing to Wayland-EGL"
        /usr/bin/logger -t minimyth -p "local0.info" "[kodi.sh] Starting Kodi in Wayland ..."
        unset DISPLAY
        /etc/rc.d/init.d/frontend stop
        # kodi_cmdline="/usr/lib/kodi/kodi-wayland"
        kodi_cmdline="/usr/lib/kodi/kodi-gbm"
        ;;

    x11|*)
        echo "Runing with drawing to Xorg"
        if [ -n "`/bin/pidof mm_watchdog`" ] ; then
            /usr/bin/logger -t minimyth -p "local0.info" "[kodi.sh] Killing mm_watchdog script..."
            /usr/bin/killall -9 mm_watchdog

            if [ -n "`/bin/pidof mm_watchdog`" ] ; then
                /usr/bin/logger -t minimyth -p "local0.info" "[kodi.sh] Still trying to killing mm_watchdog script..."
                /usr/bin/killall -9 mm_watchdog
            else
                /usr/bin/logger -t minimyth -p "local0.info" "[kodi.sh] mm_watchdog script killed..."
            fi
        fi
        # not calling here /etc/rc.d/init.d/frontend stop as it will stop X whike X is still needed for Kodi
        /usr/bin/logger -t minimyth -p "local0.info" "[kodi.sh] Starting Kodi in X11 ..."
        kodi_cmdline="/usr/lib/kodi/kodi-x11"
        ;;

esac

# make sure frontend is not running
stop_mythfrontend

env

if [ -n "${MM_KODI_CMDLINE}" ] ; then
    kodi_cmdline="${MM_KODI_CMDLINE}"
fi

echo "Kodi cmd.line:"${kodi_cmdline}

if [ x$1 = "xgdb" ] ; then

    echo "Starting under GDB"
    su minimyth -c "gdb kodi-standalone -x /etc/gdb.commands"

elif [ x$1 = "xapitrace" ] ; then

    echo "Starting under apitrace"
    su minimyth -c "apitrace trace -a egl -o /usr/local/share/kodi-apitrace.txt ${kodi_cmdline}"

elif [ x$1 = "xstrace" ] ; then

    echo "Starting under strace"
    su minimyth -c "strace -o /usr/local/share/kodi-strace.txt ${kodi_cmdline}"

elif [ x$1 != "x" ] ; then

    su minimyth -c "${1}"

else

    su minimyth -c "${kodi_cmdline}"

fi
