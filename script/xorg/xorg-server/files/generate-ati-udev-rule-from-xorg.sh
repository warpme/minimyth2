#!/bin/sh

# Script requires at input file ONLY with following structure per each card:
#
# 'CHIPSET(0x29A2, i965,    "Intel(R) 965G")'
#

in_file='./r200_pci_ids.h ./r300_pci_ids.h ./r600_pci_ids.h ./radeonsi_pci_ids.h'
out_file='./05-minimyth-detect-x-ati-1.18.0.rules.disabled'
suported_devices_file='supported-gfx-hardware.txt'
vendor_id='1002'


# List of cards with supported vdpau
# string is compared with last string in i915_pci_ids.h with removed spaces
# example:
# CHIPSET(0x29A2, i965,    "Intel(R) 965G")
#                 ^^^^
# will require i965
#List of cards with UVD2.2+
# R700 family:             RV770, RV730, RV710, RV740
# Evergreen family;        R600: CEDAR, REDWOOD, JUNIPER, CYPRESS, PALM, SUMO, SUMO2
# Northern Islands family; R600: ARUBA, BARTS, TURKS, CAICOS, CAYMAN
# Southern Islands family; RadeonSI: CAPE VERDE, PITCAIRN, TAHITI, OLAND, HAINAN
# Sea Islands family;      RadeonSI: BONAIRE, KABINI, KAVERI, HAWAII, MULLINS, HEMLOCK

vdpau_list='\
RS880, RV710, RV710, RV730, RV740,\
CEDAR, REDWOOD, JUNIPER, CYPRESS, PALM, SUMO, SUMO2,\
ARUBA, BARTS, TURKS, CAICOS, CAYMAN,\
CAPE VERDE, PITCAIRN, TAHITI, OLAND, HAINAN,\
BONAIRE, KABINI, KAVERI, HAWAII, MULLINS, HEMLOCK,\
'























#-------------------------------------------------------------------------------
for file in ${in_file} ; do
  cat ${file} >> ./${vendor_id}
done

cat ./${vendor_id} | grep "CHIPSET(0x" > ./${vendor_id}.tmp
rm ./${vendor_id}

sed -e 's/,/ /g' -i ./${vendor_id}.tmp
sed -e 's/[(|)|]//g' -i ./${vendor_id}.tmp
sed -e 's/CHIPSET0x//g' -i ./${vendor_id}.tmp

sed -e 's/IntelR //g' -i ./${vendor_id}.tmp

card_list=`cat ./${vendor_id}.tmp 2> /dev/null`

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
echo "GOTO=\"end-${vendor_id}\"" >> ${out_file}
echo "LABEL=\"begin\"" >> ${out_file}
echo "" >> ${out_file}
echo "# Import mm_detect_id." >> ${out_file}
echo "IMPORT{program}=\"/usr/lib/udev/mm_detect_id\"" >> ${out_file}
echo "" >> ${out_file}
echo "#-------------------------------------------------------------------------------" >> ${out_file}
echo "# ATI devices" >> ${out_file}
echo "#-------------------------------------------------------------------------------" >> ${out_file}
echo "" >> ${out_file}
echo "ENV{mm_detect_id}!=\"pci:0300:00:${vendor_id}:????:????:????\", GOTO=\"end-${vendor_id}\"" >> ${out_file}
echo "" >> ${out_file}
echo "  ENV{mm_detect_id}==\"pci:0300:00:${vendor_id}:????:????:????\", ENV{mm_detect_state_x}=\"radeon\"" >> ${out_file}
echo "" >> ${out_file}

echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}
echo "ATI devices" >> ${suported_devices_file}
echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}

old_id=" "

for card in ${card_list} ; do
    #echo "-------- "
    #echo ${card}
    #echo '5975  RS482_5975  RS480' | sed 's/\([0-9a-fA-F]*\)\s*\([a-zA-Z0-9_]*\)\s*\(.*\)/\1 \2 \3/'
    id=`       echo "${card}" | sed -e 's/\([0-9a-fA-F]*\)\s*\([a-zA-Z0-9_]*\)\s*\(.*\)/\1/' -e 's/\(.*\)/\L\1/'`
    name=`     echo "${card}" | sed -e 's/\([0-9a-fA-F]*\)\s*\([a-zA-Z0-9_]*\)\s*\(.*\)/\3/' -e 's/\s*//g'`
    call_name=`echo "${card}" | sed -e 's/\([0-9a-fA-F]*\)\s*\([a-zA-Z0-9_]*\)\s*\(.*\)/\2/'`
    _name=x${name}
    #echo "       ID = ${id}"
    #echo "     Name = ${name}"
    #echo "Call name = ${call_name}"
    if [ ${_name} = 'x' ] ; then
      type="radeon"
      name="Unknown name"
    else
      if [ `echo ${vdpau_list} | grep -s -c ${name}` = 0 ] ; then
        type="radeon"
      else
        type="radeon_vdpau"
      fi
    fi
    #echo "    Type = ${type}"
    legend=`echo "  # Card=${name} ${call_name}, PCI_ID=${id}"`
    entry=`echo "  ENV{mm_detect_id}==\"pci:0300:00:${vendor_id}:${id}:????:????\", ENV{mm_detect_state_x}=\"${type}\""`
    if [ ${id} = ${old_id} ] ; then
      echo "Processing  ${call_name}: PCI ID same like previous. Skipping!"
    else
      echo "Processing  ${call_name}"
      old_id=${id}
      #echo "${legend}"
      #echo "${entry}"
      echo "${legend}" >> ${out_file}
      echo "${entry}" >> ${out_file}
      if [ `echo ${vdpau_list} | grep -s -c ${name}` = 0 ] ; then
        echo "  ${name} (${call_name}), PCI_ID=${id}" >> ${suported_devices_file}
      else
        echo "  ${name} (${call_name}), PCI_ID=${id}, (HW Video Decode)" >> ${suported_devices_file}
      fi
    fi
done

echo "" >> ${out_file}
echo "#-------------------------------------------------------------------------------" >> ${out_file}
echo "" >> ${out_file}
echo "# The state has been set, so save it." >> ${out_file}
echo "ENV{mm_detect_state_x}==\"?*\", RUN+=\"/usr/lib/udev/mm_detect x %k \$env{mm_detect_state_x}\"" >> ${out_file}
echo "" >> ${out_file}
echo "LABEL=\"end-${vendor_id}\"" >> ${out_file}
echo "" >> ${out_file}

echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}
echo "" >> ${suported_devices_file}

unset IFS

rm ./${vendor_id}.tmp

echo ""
echo "Done!"
echo "Results are in ${out_file}"

exit 0
