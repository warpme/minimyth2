#!/bin/sh

# if called with para "temp" - script will monitror cpu temp. Output will be triggered when
# any chanage in cpu clock will happen

. /etc/rc.d/functions

freq_sysfs_entry=`find /sys/devices/system/cpu/cpufreq/policy*/scaling_cur_freq -type f 2>/dev/null`
temp_sysfs_entry=`find /sys/class/thermal/thermal_zone*/temp -type f 2>/dev/null`

if [ x${freq_sysfs_entry} = "x" ] ; then
    echo " "
    echo "Error: can't find cpufreq sysfs entry....  Exiting!"
    echo " "
    exit 1
else
    echo " "
    echo "CPU Freg monitor v1.2"
    echo " "
    echo "Using:"
    echo "  cpufreq sysfs entry : "${freq_sysfs_entry}
    echo "  temp sysfs entry    : "${temp_sysfs_entry}
    echo " "
fi

mode=$1

prev_val=0

while true ; do

    speed=""
    for policy in ${freq_sysfs_entry} ; do

        policy_speed=`cat ${policy}`
        policy_speed=$((policy_speed/1000))

        speed=${speed}${policy_speed}"/"

    done
    speed=`echo ${speed} | sed -e "s%/$%%"`

    temp=""
    for zone in ${temp_sysfs_entry} ; do

        zone_temp=`cat ${zone}`
        zone_temp=$((zone_temp/1000))

        temp=${temp}${zone_temp}"/"

    done
    temp=`echo ${temp} | sed -e "s%/$%%"`

    if [ x${mode} = "xtemp" ] ; then
        val=${temp}
    else
        val=${speed}
    fi

    if [ ${val} != ${prev_val} ] ; then

        timestamp=`date +%T`

        if [ ! x${mode} = "xtemp" ] ; then
            location=`mm_mythfrontend_networkcontrol "query location"`
        fi

        if [ -n ${temp} ] ; then

            echo ${timestamp}" | "${location}" | CPU: "${speed}" MHz | Temp: "${temp}" C"

        else

            echo ${timestamp}" | "${location}" | CPU: "${speed}" MHz"

        fi

        prev_val=${val}

    fi

    sleep 1

done

exit 0
