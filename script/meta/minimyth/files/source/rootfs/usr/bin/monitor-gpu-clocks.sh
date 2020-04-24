#!/bin/sh

. /etc/rc.d/functions

# s905 GPU /sys/bus/platform/drivers/lima/d00c0000.gpu/devfreq/d00c0000.gpu/cur_freq"
# s912 GPU /sys/bus/platform/drivers/panfrost/d00c0000.gpu/devfreq/d00c0000.gpu/cur_freq"
# H6 GPU /sys/bus/platform/drivers/panfrost/1800000.gpu/devfreq/1800000.gpu/cur_freq

freq_sysfs_entry=`find /sys/bus/platform/drivers/*/*.gpu/devfreq -name cur_freq`
temp_sysfs_entry=`find /sys/class/thermal/thermal_zone*/temp -type f`

if [ ! -e ${freq_sysfs_entry} ] ; then
    echo " "
    echo "Error: can't find cpufreq sysfs entry....  Exiting!"
    echo " "
    exit 1
else
    echo " "
    echo "GPU Freg monitor v1.0"
    echo " "
    echo "Using:"
    echo "  GPUfreq sysfs entry : "${freq_sysfs_entry}
    echo "  temp sysfs entry    : "${temp_sysfs_entry}
    echo " "
fi

prev_speed=0

while true ; do

    speed=`cat ${freq_sysfs_entry}`
    speed=$((speed/1000000))

    if [ ${speed} != ${prev_speed} ] ; then

        timestamp=`date +%T`
        location=`mm_mythfrontend_networkcontrol "query location"`

        if [ -n ${temp_sysfs_entry} ] ; then

            temp=`cat ${temp_sysfs_entry}`
            temp=$((temp/1000))

            echo ${timestamp}" | "${location}" | GPU: "${speed}" MHz | Temp: "${temp}" C"

        else

            echo ${timestamp}" | "${location}" | GPU: "${speed}" MHz"

        fi

        prev_speed=${speed}
    fi

    sleep 1

done

exit 0
