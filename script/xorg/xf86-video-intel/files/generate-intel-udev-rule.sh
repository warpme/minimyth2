#!/bin/sh

# Script requires at input file ONLY with following structure per each card:
#
# '#define PCI_CHIP_RV380_3150 0x3150'
#

ver=$1

in_file='./i915_pciids.h'
out_file="05-minimyth-detect-x-intel-${ver}.rules.disabled"
out_dir='../../../../script/meta/minimyth/files/source/rootfs/usr/lib/udev/rules.d'
suported_devices_file='../../../../images/main/usr/share/supported-intel-gfx-hardware.txt'
suported_devices_dir='../../../../images/main/usr/share'
vendor_id='8086'


# List of cards with supported vaapi
# string is compared with comment in i915_pciids.h with removed spaces, /* and */
# example:
# INTEL_VGA_DEVICE(0x1916, info), /* ULT GT2 */ \
#                                 ^^^^^^^^^^^^^
# will require 'ULTGT2

vaapi_list='\
Intel HD Graphics 3000,\
Intel HD Graphics 3000,\
GT1 mobile,\
GT2 mobile,\
GT1 desktop,\
GT2 desktop,\
GT1 server,\
GT2 server,\
GT1 desktop,\
GT2 desktop,\
GT3 desktop,\
GT1 server,\
GT2 server,\
GT3 server,\
GT1 reserved,\
GT2 reserved,\
GT3 reserved,\
GT1 reserved,\
GT2 reserved,\
GT3 reserved,\
SDV GT1 desktop,\
SDV GT2 desktop,\
SDV GT3 desktop,\
SDV GT1 server,\
SDV GT2 server,\
SDV GT3 server,\
SDV GT1 reserved,\
SDV GT2 reserved,\
SDV GT3 reserved,\
SDV GT1 reserved,\
SDV GT2 reserved,\
SDV GT3 reserved,\
ULT GT1 desktop,\
ULT GT2 desktop,\
ULT GT3 desktop,\
ULT GT1 server,\
ULT GT2 server,\
ULT GT3 server,\
ULT GT1 reserved,\
ULT GT2 reserved,\
ULT GT3 reserved,\
CRW GT1 desktop,\
CRW GT2 desktop,\
CRW GT3 desktop,\
CRW GT1 server,\
CRW GT2 server,\
CRW GT3 server,\
CRW GT1 reserved,\
CRW GT2 reserved,\
CRW GT3 reserved,\
CRW GT1 reserved,\
CRW GT2 reserved,\
CRW GT3 reserved,\
GT1 mobile,\
GT2 mobile,\
GT2 mobile,\
SDV GT1 mobile,\
SDV GT2 mobile,\
SDV GT3 mobile,\
ULT GT1 mobile,\
ULT GT2 mobile,\
ULT GT3 mobile,\
ULX GT1 mobile,\
ULX GT2 mobile,\
ULT GT3 reserved,\
CRW GT1 mobile,\
CRW GT2 mobile,\
CRW GT3 mobile,\
GT1 ULT,\
GT1 ULT,\
GT1 Iris,\
GT1 ULX,\
GT2 Halo,\
GT2 ULT,\
GT2 ULT,\
GT2 ULX,\
GT1 Server,\
GT1 Workstation,\
GT2 Server,\
GT2 Workstation,\
ULT,\
ULT,\
Iris,\
ULX,\
Server,\
Workstation,\
ULT,\
ULT,\
Iris,\
ULX,\
Server,\
Workstation,\
ULT GT1,\
ULX GT1,\
DT  GT1,\
Halo GT1,\
SRV GT1,\
ULT GT2,\
ULT GT2F,\
ULX GT2,\
DT  GT2,\
Halo GT2,\
SRV GT2,\
WKS GT2,\
ULT GT3,\
ULT GT3,\
ULT GT3,\
Halo GT3,\
SRV GT3,\
DT GT4,\
Halo GT4,\
WKS GT4,\
SRV GT4,\
SRV GT4e,\
APLHDGraphics505,\
APLHDGraphics500,\
ULT GT1.5,\
ULX GT1.5,\
DT  GT1.5,\
ULT GT1,\
ULX GT1,\
DT  GT1,\
Halo GT1,\
Halo GT1,\
SRV GT1,\
ULT GT2,\
ULT GT2F,\
ULX GT2,\
DT  GT2,\
Halo GT2,\
SRV GT2,\
WKS GT2,\
ULT GT3,\
ULT GT3,\
ULT GT3,\
Halo GT4,\
'























#-------------------------------------------------------------------------------
rm -f ${out_dir}/05-minimyth-detect-x-intel-*
rm -f ${suported_devices_file}

cat ${in_file} | grep "INTEL_VGA_DEVICE(0x" > ./file.tmp

sed -e 's/,/ /g' -i ./file.tmp
sed -e 's/\s*//g' -i ./file.tmp
sed -e 's/\\//g' -i ./file.tmp

card_list=`cat ./file.tmp 2> /dev/null`
vaapi_lst=`echo "${vaapi_list}" | sed -e 's/\s*//g'`

IFS='
'
echo " "
echo "Generating udev rules for driver ver=${ver}"
echo " "
echo "#-------------------------------------------------------------------------------" >> ${out_dir}/${out_file}
echo "# Detect video devices." >> ${out_dir}/${out_file}
echo "#" >> ${out_dir}/${out_file}
echo "# An X device is assumed to" >> ${out_dir}/${out_file}
echo "#     be in the pci subsystem, and" >> ${out_dir}/${out_file}
echo "#     in the 0x0300 PCI class." >> ${out_dir}/${out_file}
echo "#" >> ${out_dir}/${out_file}
echo "# mm_detect_id has the following format:" >> ${out_dir}/${out_file}
echo "#     pci:<class>:<class_prog>:<vendor>:<device>:<subsystem_vendor>:<subsystem_device>" >> ${out_dir}/${out_file}
echo "# mm_detect_state_x has the following format:" >> ${out_dir}/${out_file}
echo "#     <driver>" >> ${out_dir}/${out_file}
echo "# where" >> ${out_dir}/${out_file}
echo "#     <driver>: The X video driver. Actually, this is the 'Identifier' (sans the" >> ${out_dir}/${out_file}
echo "#               'Device_' prefix) of the 'Device' section in the" >> ${out_dir}/${out_file}
echo "#               '/etc/xorg.conf' file." >> ${out_dir}/${out_file}
echo "#-------------------------------------------------------------------------------" >> ${out_dir}/${out_file}
echo "ACTION==\"add|remove\", SUBSYSTEM==\"pci\", ATTR{class}==\"0x0300??\", GOTO=\"begin\"" >> ${out_dir}/${out_file}
echo "GOTO=\"end-intel\"" >> ${out_dir}/${out_file}
echo "LABEL=\"begin\"" >> ${out_dir}/${out_file}
echo "" >> ${out_dir}/${out_file}
echo "# Import mm_detect_id." >> ${out_dir}/${out_file}
echo "IMPORT{program}=\"/usr/lib/udev/mm_detect_id\"" >> ${out_dir}/${out_file}
echo "" >> ${out_dir}/${out_file}
echo "#-------------------------------------------------------------------------------" >> ${out_dir}/${out_file}
echo "# intel devices" >> ${out_dir}/${out_file}
echo "#-------------------------------------------------------------------------------" >> ${out_dir}/${out_file}
echo "" >> ${out_dir}/${out_file}
echo "ENV{mm_detect_id}!=\"pci:0300:00:${vendor_id}:????:????:????\", GOTO=\"end-intel\"" >> ${out_dir}/${out_file}
echo "" >> ${out_dir}/${out_file}
echo "  ENV{mm_detect_id}==\"pci:0300:00:${vendor_id}:????:????:????\", ENV{mm_detect_state_x}=\"intel_i915\"" >> ${out_dir}/${out_file}
echo "" >> ${out_dir}/${out_file}

echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}
echo "Intel devices by xf86-video-intel driver ver: ${ver}" >> ${suported_devices_file}
echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}

old_id=" "
c=1

for card in ${card_list} ; do
   #echo "-------- "
   #echo ${card}
    id=`echo "${card}" | sed -e 's/\s*INTEL_VGA_DEVICE(0x//g' -e 's/\([0-9a-zA-Z]*\)info).*/\1/'`
    name=`echo "${card}" | sed -e 's/\s*INTEL_VGA_DEVICE(0x//g' -e 's/\([0-9a-zA-Z]*\)info)\([0-1a-zA-Z\*\/\\]*\)/\2/' -e 's/\*//g' -e 's/\///g'`
    _name=x${name}
    #echo "      ID = ${id}"
    #echo "    Name = ${name}"
    if [ ${_name} = 'x' ] ; then
      type="intel_i915"
      name="Unknown name"
    else
      if [ `echo ${vaapi_lst} | grep -s -c ${name}` = 0 ] ; then
        type="intel_i915"
      else
        type="intel_vaapi"
      fi
    fi
    #echo "    Type = ${type}"
    legend=`echo "  # Card=${name}, PCI_ID=${id}"`
    entry=`echo "  ENV{mm_detect_id}==\"pci:0300:00:${vendor_id}:${id}:????:????\", ENV{mm_detect_state_x}=\"${type}\""`
    if [ ${id} = ${old_id} ] ; then
      echo "Processing ${name}: card is duplicate of previous. Skipping!"
    else
      echo "Processing ${name}"
      old_id=${id}
      #echo "${legend}"
      #echo "${entry}"
      echo "${legend}" >> ${out_dir}/${out_file}
      echo "${entry}" >> ${out_dir}/${out_file}
      if [ ${type} = 'intel_i915' ] ; then
        echo "  ${name}, PCI_ID=${id}" >> ${suported_devices_file}
      else
        echo "  ${name}, PCI_ID=${id}, (HW Video Decode)" >> ${suported_devices_file}
      fi
      c=$((${c} + 1))
    fi
done

echo "" >> ${out_dir}/${out_file}
echo "#-------------------------------------------------------------------------------" >> ${out_dir}/${out_file}
echo "" >> ${out_dir}/${out_file}
echo "# The state has been set, so save it." >> ${out_dir}/${out_file}
echo "ENV{mm_detect_state_x}==\"?*\", RUN+=\"/usr/lib/udev/mm_detect x %k \$env{mm_detect_state_x}\"" >> ${out_dir}/${out_file}
echo "" >> ${out_dir}/${out_file}
echo "LABEL=\"end-intel\"" >> ${out_dir}/${out_file}
echo "" >> ${out_dir}/${out_file}
echo "" >> ${suported_devices_file}
echo "Total: $c Intel cards supported" >> ${suported_devices_file}
echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}
echo "" >> ${suported_devices_file}

unset IFS

rm ./file.tmp

echo ""
echo "Done!"
echo "Rules for $c cards are in ${out_dir}/${out_file}"

exit 0
