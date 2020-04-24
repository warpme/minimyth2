#!/bin/sh

. /etc/rc.d/functions

freq_sysfs_entry=`find /sys/devices/system/cpu/cpufreq/policy*/scaling_cur_freq -type f`
temp_sysfs_entry=`find /sys/class/thermal/thermal_zone*/temp -type f`

if [ ! -e ${freq_sysfs_entry} ] ; then
    echo " "
    echo "Error: can't find cpufreq sysfs entry....  Exiting!"
    echo " "
    exit 1
else
    echo " "
    echo "CPU Freg monitor v1.0"
    echo " "
    echo "Using:"
    echo "  cpufreq sysfs entry : "${freq_sysfs_entry}
    echo "  temp sysfs entry    : "${temp_sysfs_entry}
    echo " "
fi

prev_speed=0

while true ; do

    speed=""
    for policy in ${freq_sysfs_entry} ; do

        policy_speed=`cat ${policy}`
        policy_speed=$((policy_speed/1000))

        speed=${speed}${policy_speed}"/"

    done

    speed=`echo ${speed} | sed -e "s%/$%%"`

    if [ ${speed} != ${prev_speed} ] ; then

        timestamp=`date +%T`
        location=`mm_mythfrontend_networkcontrol "query location"`

        if [ -n ${temp_sysfs_entry} ] ; then

            temp=`cat ${temp_sysfs_entry}`
            temp=$((temp/1000))

            echo ${timestamp}" | "${location}" | CPU: "${speed}" MHz | Temp: "${temp}" C"

        else

            echo ${timestamp}" | "${location}" | CPU: "${speed}" MHz"

        fi

        prev_speed=${speed}
    fi

    sleep 1

done

exit 0
