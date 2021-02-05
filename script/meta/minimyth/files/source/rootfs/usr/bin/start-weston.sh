
if [ -z "`/bin/pidof weston`" ] ; then

    openvt -v -w -s -- su minimyth -c "/usr/bin/weston.sh $1"

fi
