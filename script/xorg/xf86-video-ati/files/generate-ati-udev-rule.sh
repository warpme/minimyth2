#!/bin/sh

# Script requires at input file ONLY with following structure per each card:
#
# '#define PCI_CHIP_RV380_3150 0x3150'
#

ver=$1

in_file='./ati_pciids_gen.h'
out_file="05-minimyth-detect-x-ati-${ver}.rules.disabled"
out_dir='../../../../script/meta/minimyth/files/source/rootfs/usr/lib/udev/rules.d'
suported_devices_file='../../../../images/main/usr/share/supported-ati-gfx-hardware.txt'
vendor_id='1002'


#List of cards with UVD2.2+
# R700 family:             RV770, RV730, RV710, RV740
# Evergreen family;        R600: CEDAR, REDWOOD, JUNIPER, CYPRESS, PALM, SUMO, SUMO2
# Northern Islands family; R600: ARUBA, BARTS, TURKS, CAICOS, CAYMAN
# Southern Islands family; RadeonSI: CAPE VERDE, PITCAIRN, TAHITI, OLAND, HAINAN
# Sea Islands family;      RadeonSI: BONAIRE, KABINI, KAVERI, HAWAII

vdpau_list='\
RS880, RV710, RV710, RV730, RV740,\
CEDAR, REDWOOD, JUNIPER, CYPRESS, PALM, SUMO, SUMO2,\
ARUBA, BARTS, TURKS, CAICOS, CAYMAN,\
CAPE VERDE, PITCAIRN, TAHITI, OLAND, HAINAN,\
BONAIRE, KABINI, KAVERI, HAWAII, OLAND, MULLINS,\
'






















#-------------------------------------------------------------------------------
rm -f ${out_dir}/05-minimyth-detect-x-ati-*
rm -f ${suported_devices_file}

cp ${in_file} ./file.tmp

sed -e 's/RAGE/RAGE_/g' -i ./file.tmp
sed -e 's/MACH/MACH_/g' -i ./file.tmp

card_list=`cat ./file.tmp 2> /dev/null`

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
echo "GOTO=\"end-ati\"" >> ${out_dir}/${out_file}
echo "LABEL=\"begin\"" >> ${out_dir}/${out_file}
echo "" >> ${out_dir}/${out_file}
echo "# Import mm_detect_id." >> ${out_dir}/${out_file}
echo "IMPORT{program}=\"/usr/lib/udev/mm_detect_id\"" >> ${out_dir}/${out_file}
echo "" >> ${out_dir}/${out_file}
echo "#-------------------------------------------------------------------------------" >> ${out_dir}/${out_file}
echo "# ATI devices" >> ${out_dir}/${out_file}
echo "#-------------------------------------------------------------------------------" >> ${out_dir}/${out_file}
echo "" >> ${out_dir}/${out_file}
echo "ENV{mm_detect_id}!=\"pci:0300:00:${vendor_id}:????:????:????\", GOTO=\"end-ati\"" >> ${out_dir}/${out_file}
echo "" >> ${out_dir}/${out_file}
echo "  ENV{mm_detect_id}==\"pci:0300:00:${vendor_id}:????:????:????\", ENV{mm_detect_state_x}=\"radeon\"" >> ${out_dir}/${out_file}
echo "" >> ${out_dir}/${out_file}

echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}
echo "ATI devices by xf86-video-ati driver ver. ${ver}" >> ${suported_devices_file}
echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}

old_id=" "
c=1

for card in ${card_list} ; do
   #echo "-------- "
       id=`echo "${card}" | sed -e 's/#define PCI_CHIP_\([0-9a-zA-Z]*\)_.* 0x\([0-9a-fA-F]*\)/\2/' -e 's/\(.*\)/\L\1/'`
     name=`echo "${card}" |    sed 's/#define PCI_CHIP_\([0-9a-zA-Z]*\)_.* 0x\([0-9a-fA-F]*\)/\1/'`
   #echo "      ID = ${id}"
   #echo "    Name = ${name}"
   if [ `echo ${vdpau_list} | grep -c ${name}` = 0 ] ; then
     type="radeon"
   else 
     type="radeon_vdpau"
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
     if [ ${type} = 'radeon' ] ; then
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
echo "LABEL=\"end-ati\"" >> ${out_dir}/${out_file}
echo "" >> ${suported_devices_file}
echo "Total: $c ATI cards supported" >> ${suported_devices_file}

echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}
echo "" >> ${suported_devices_file}

unset IFS

rm ./file.tmp

echo ""
echo "Done!"
echo "Rules for $c cards are in ${out_dir}/${out_file}"

exit 0
