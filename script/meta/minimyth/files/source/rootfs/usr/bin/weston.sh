
if [ -z "`/bin/pidof weston`" ] ; then

    /usr/bin/logger -t minimyth -p "local0.info" "[weston.sh] Kicking weston to start Weston ..."

    export XDG_RUNTIME_DIR=/var/run/xdg/minimyth
    weston --log=/var/log/weston.log "$1"

else

    /usr/bin/logger -t minimyth -p "local0.info" "[weston.sh] Weston already running ..."

fi
