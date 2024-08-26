#!/bin/sh

pids=`/bin/pidof sip-daemon.sh`
instances=`/bin/echo ${pids} | /usr/bin/wc -w`
if [ ${instances} -ne 1 ] ; then
    echo "Another instanceis running..."
    exit 1
fi

. /etc/rc.d/functions

if [ ! -e /var/log/sip-daemon ] ; then
    /bin/touch /var/log/sip-daemon
fi

trap "_exit_" 0 1 2 3 15

_exit_()
{
    ps -o ppid,pid,args \
    | sed -e 's%  *% %g' -e 's%^ %%' -e 's% $%%' \
    | grep "^$$ " \
    | grep '/bin/sleep [^ ]*$' \
    | cut -d ' ' -f 2 \
    | while read pid ; do
        kill $pid
    done
}

/usr/bin/logger -t minimyth -p "local0.info" "[sip-daemon.sh] watchdog now monitors killed/trapped sip-daemon.py process..."

while true ; do
  instances=`ps --no-headers -o command -C python | grep -c "sip-daemon.py"`
  if [ ${instances} -ne 1 ] ; then
    /usr/bin/logger -t minimyth -p "local0.info" "[sip-daemon.sh] watchdog detected killed/trapped sip-daemon.py process. Restarting it..."
    /usr/bin/python -u /usr/bin/sip-daemon.py >> /var/log/sip-daemon.log &
    /bin/sleep 10
  else
    /bin/sleep 3
  fi
done

exit 0
