#!/bin/sh

# Script requires at input file ONLY with following structure per each card:
#
# '#define PCI_CHIP_RV380_3150 0x3150'
#

in_file='./i915_pciids.h'
out_file='./05-minimyth-detect-x-intel-20151105-3a172a0.rules.disabled'
suported_devices_file='supported-intel-gfx-hardware.txt'
vendor_id='8086'


# List of cards with supported vaapi
# string is compared with comment in i915_pciids.h with removed spaces, /* and */
# example:
# INTEL_VGA_DEVICE(0x1916, info), /* ULT GT2 */ \
#                                 ^^^^^^^^^^^^^
# will require 'ULTGT2

vaapi_list='\
GT1mobile,\
GT2mobile,\
GT1desktop,\
GT2desktop,\
GT1server,\
GT2server,\
GT1desktop,\
GT2desktop,\
GT3desktop,\
GT1server,\
GT2server,\
GT3server,\
GT1reserved,\
GT2reserved,\
GT3reserved,\
GT1reserved,\
GT2reserved,\
GT3reserved,\
SDVGT1desktop,\
SDVGT2desktop,\
SDVGT3desktop,\
SDVGT1server,\
SDVGT2server,\
SDVGT3server,\
SDVGT1reserved,\
SDVGT2reserved,\
SDVGT3reserved,\
SDVGT1reserved,\
SDVGT2reserved,\
SDVGT3reserved,\
ULTGT1desktop,\
ULTGT2desktop,\
ULTGT3desktop,\
ULTGT1server,\
ULTGT2server,\
ULTGT3server,\
ULTGT1reserved,\
ULTGT2reserved,\
ULTGT3reserved,\
CRWGT1desktop,\
CRWGT2desktop,\
CRWGT3desktop,\
CRWGT1server,\
CRWGT2server,\
CRWGT3server,\
CRWGT1reserved,\
CRWGT2reserved,\
CRWGT3reserved,\
CRWGT1reserved,\
CRWGT2reserved,\
CRWGT3reserved,\
GT1mobile,\
GT2mobile,\
GT2mobile,\
SDVGT1mobile,\
SDVGT2mobile,\
SDVGT3mobile,\
ULTGT1mobile,\
ULTGT2mobile,\
ULTGT3mobile,\
ULXGT1mobile,\
ULXGT2mobile,\
ULTGT3reserved,\
CRWGT1mobile,\
CRWGT2mobile,\
CRWGT3mobile,\
ULTGT2,\
ULTGT1,\
ULTGT3,\
ULTGT2F,\
ULXGT1,\
ULXGT2,\
DTGT2,\
DTGT1,\
HaloGT2,\
HaloGT3,\
HaloGT1,\
SRVGT2,\
SRVGT3,\
SRVGT1,\
WKSGT2,\
Iris,\
'























#-------------------------------------------------------------------------------
cat ${in_file} | grep "INTEL_VGA_DEVICE(0x" > ./file.tmp

sed -e 's/,/ /g' -i ./file.tmp
sed -e 's/\s*//g' -i ./file.tmp
sed -e 's/\\//g' -i ./file.tmp

card_list=`cat ./file.tmp 2> /dev/null`

IFS='
'

echo "#-------------------------------------------------------------------------------" >> ${out_file}
echo "# Detect video devices." >> ${out_file}
echo "#" >> ${out_file}
echo "# An X device is assumed to" >> ${out_file}
echo "#     be in the pci subsystem, and" >> ${out_file}
echo "#     in the 0x0300 PCI class." >> ${out_file}
echo "#" >> ${out_file}
echo "# mm_detect_id has the following format:" >> ${out_file}
echo "#     pci:<class>:<class_prog>:<vendor>:<device>:<subsystem_vendor>:<subsystem_device>" >> ${out_file}
echo "# mm_detect_state_x has the following format:" >> ${out_file}
echo "#     <driver>" >> ${out_file}
echo "# where" >> ${out_file}
echo "#     <driver>: The X video driver. Actually, this is the 'Identifier' (sans the" >> ${out_file}
echo "#               'Device_' prefix) of the 'Device' section in the" >> ${out_file}
echo "#               '/etc/xorg.conf' file." >> ${out_file}
echo "#-------------------------------------------------------------------------------" >> ${out_file}
echo "ACTION==\"add|remove\", SUBSYSTEM==\"pci\", ATTR{class}==\"0x0300??\", GOTO=\"begin\"" >> ${out_file}
echo "GOTO=\"end-intel\"" >> ${out_file}
echo "LABEL=\"begin\"" >> ${out_file}
echo "" >> ${out_file}
echo "# Import mm_detect_id." >> ${out_file}
echo "IMPORT{program}=\"/usr/lib/udev/mm_detect_id\"" >> ${out_file}
echo "" >> ${out_file}
echo "#-------------------------------------------------------------------------------" >> ${out_file}
echo "# intel devices" >> ${out_file}
echo "#-------------------------------------------------------------------------------" >> ${out_file}
echo "" >> ${out_file}
echo "ENV{mm_detect_id}!=\"pci:0300:00:${vendor_id}:????:????:????\", GOTO=\"end-intel\"" >> ${out_file}
echo "" >> ${out_file}
echo "  ENV{mm_detect_id}==\"pci:0300:00:${vendor_id}:????:????:????\", ENV{mm_detect_state_x}=\"intel_i915\"" >> ${out_file}
echo "" >> ${out_file}

echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}
echo "Intel devices" >> ${suported_devices_file}
echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}

old_id=" "

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
      if [ `echo ${vaapi_list} | grep -s -c ${name}` = 0 ] ; then
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
      echo "${legend}" >> ${out_file}
      echo "${entry}" >> ${out_file}
      if [ ${type} = 'intel_i915' ] ; then
        echo "  ${name}, PCI_ID=${id}" >> ${suported_devices_file}
      else
        echo "  ${name}, PCI_ID=${id}, (HW Video Decode)" >> ${suported_devices_file}
      fi
    fi
done

echo "" >> ${out_file}
echo "#-------------------------------------------------------------------------------" >> ${out_file}
echo "" >> ${out_file}
echo "# The state has been set, so save it." >> ${out_file}
echo "ENV{mm_detect_state_x}==\"?*\", RUN+=\"/usr/lib/udev/mm_detect x %k \$env{mm_detect_state_x}\"" >> ${out_file}
echo "" >> ${out_file}
echo "LABEL=\"end-intel\"" >> ${out_file}
echo "" >> ${out_file}

echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}
echo "" >> ${suported_devices_file}

unset IFS

rm ./file.tmp

echo ""
echo "Done!"
echo "Results are in ${out_file}"

exit 0
