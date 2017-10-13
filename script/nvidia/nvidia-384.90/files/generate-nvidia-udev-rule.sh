#!/bin/sh

# Script requires at input file where each card is described like this:
#
# <tr id="0x0191">
# <td>GeForce 8800 GTX</td>
# <td>0x0191</td>
# <td>A</td>
# </tr>
#

ver=$1

in_file='./supportedchips.html'
out_file="05-minimyth-detect-x-nvidia2-${ver}.rules.disabled"
out_dir='../../../../script/meta/minimyth/files/source/rootfs/usr/lib/udev/rules.d'
suported_devices_file='../../../../images/main/usr/share/supported-nvidia-gfx-hardware.txt'
vendor_id='10de'


































#------------------------------------------------------------------------------_
rm -f ${out_dir}/05-minimyth-detect-x-nvidia2-*
rm -f ${suported_devices_file}

cp ${in_file} ./file.tmp

# Removing ending newline <tr id="0x????">\n
sed -e ':a;N;$!ba;s/">\n//g' -i ./file.tmp
# Removing ending newline for lines </td>\n
sed -e ':a;N;$!ba;s/<\/td>\n/>/g' -i ./file.tmp
# Fixing probable bug with dealing strings like '192-bit'
sed -e 's/-bit/bit/g' -i ./file.tmp
# Removing all cards starting with Quadro to end of file
sed '/name="Quadro"/,/class="navfooter"/d' ./file.tmp > ./file1.tmp
# Removing all lines except lines with <tr id="0x????">
cat ./file1.tmp | grep '<tr id="devid' > ./file.tmp

rm ./file1.tmp

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
echo "GOTO=\"end-nvidia\"" >> ${out_dir}/${out_file}
echo "LABEL=\"begin\"" >> ${out_dir}/${out_file}
echo "" >> ${out_dir}/${out_file}
echo "# Import mm_detect_id." >> ${out_dir}/${out_file}
echo "IMPORT{program}=\"/usr/lib/udev/mm_detect_id\"" >> ${out_dir}/${out_file}
echo "" >> ${out_dir}/${out_file}
echo "#-------------------------------------------------------------------------------" >> ${out_dir}/${out_file}
echo "# NVIDIA devices" >> ${out_dir}/${out_file}
echo "#-------------------------------------------------------------------------------" >> ${out_dir}/${out_file}
echo "" >> ${out_dir}/${out_file}
echo "ENV{mm_detect_id}!=\"pci:0300:00:${vendor_id}:????:????:????\", GOTO=\"end-nvidia\"" >> ${out_dir}/${out_file}
echo "" >> ${out_dir}/${out_file}
echo "  # commented as this is second nvidia rule so not overrite first rule results when this detects nothing ENV{mm_detect_id}==\"pci:0300:00:${vendor_id}:????:????:????\", ENV{mm_detect_state_x}=\"nvidia\"" >> ${out_dir}/${out_file}
echo "" >> ${out_dir}/${out_file}

echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}
echo "NVIDIA devices by Nvidia driver ver.: ${ver}" >> ${suported_devices_file}
echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}

old_id=" "
c=1

for card in ${card_list} ; do
   #echo "-------- "
   #                                  <tr id="devid1C60<td>GeForce GTX 1060><td>1C60><td>H></tr>
   #                                  <tr id="devid1427_1458_D003<td>GeForce GTX 950><td>1427 1458 D003><td>F></tr>
       id=`echo "${card}" | sed -e 's/<tr id="devid\([0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]\).*<td>.*/\1/' -e 's/\(.*\)/\L\1/'`
     name=`echo "${card}" | sed -e 's/<tr id="devid\([0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]\).*<td>\([a-zA-Z0-9/ ()-\+]*\)><td>\([a-zA-Z0-9x ]*\)><td>\([A-Z0-9 -]*\).*/\2/'`
   pci_id=`echo "${card}" | sed -e 's/<tr id="devid\([0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]\).*<td>\([a-zA-Z0-9/ ()-\+]*\)><td>\([a-zA-Z0-9x ]*\)><td>\([A-Z0-9 -]*\).*/\3/' -e 's/\(.*\)/\L\1/'`
    class=`echo "${card}" | sed -e 's/<tr id="devid\([0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]\).*<td>\([a-zA-Z0-9/ ()-\+]*\)><td>\([a-zA-Z0-9x ]*\)><td>\([A-Z0-9 -]*\).*/\4/' -e 's/ //'`
   #echo "      ID = ${id}"
   #echo "    Name = ${name}"
   #echo "  PCI_ID = ${pci_id}"
   #echo "   Class = ${class}"
   if [ ${class} = '-' ] ; then
     type="nvidia"
   else
     type="nvidia_vdpau"
   fi
   #echo "    Type = ${type}"
   legend=`echo "  # Card=${name}, PCI_ID=${id}, VDPAU class=${class}"`
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
     if [ ${class} = '-' ] ; then
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
echo "LABEL=\"end-nvidia\"" >> ${out_dir}/${out_file}
echo "" >> ${out_dir}/${out_file}
echo "" >> ${suported_devices_file}
echo "Total: $c Nvidia cards supported" >> ${suported_devices_file}
echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}
echo "" >> ${suported_devices_file}

unset IFS

rm ./file.tmp

echo ""
echo "Done!"
echo "Rules for $c cards are in ${out_dir}/${out_file}"

exit 0
