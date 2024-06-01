
if [ -z "`/bin/pidof seatd`" ] ; then

    /usr/bin/seatd -uminimyth -gminimyth -l debug > /var/log/seatd.log 2>&1 &

fi

if [ -z "`/bin/pidof weston`" ] ; then

    openvt -v -w -s -- su minimyth -c "/usr/bin/weston.sh $1"

fi
