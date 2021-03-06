#!/bin/sh

# Script requires at input file where each card is described like this:
#
# <tr id="0x0191">
# <td>GeForce 8800 GTX</td>
# <td>0x0191</td>
# <td>A</td>
# </tr>
#

in_file='./supportedchips.html'
out_file='./05-minimyth-detect-x-nvidia-340.96.rules.disabled'
suported_devices_file='supported-gfx-hardware.txt'
vendor_id='10de'


































#------------------------------------------------------------------------------_

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
cat ./file1.tmp | grep '<tr id="0x' > ./file.tmp

rm ./file1.tmp

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
echo "GOTO=\"end-nvidia\"" >> ${out_file}
echo "LABEL=\"begin\"" >> ${out_file}
echo "" >> ${out_file}
echo "# Import mm_detect_id." >> ${out_file}
echo "IMPORT{program}=\"/usr/lib/udev/mm_detect_id\"" >> ${out_file}
echo "" >> ${out_file}
echo "#-------------------------------------------------------------------------------" >> ${out_file}
echo "# NVIDIA devices" >> ${out_file}
echo "#-------------------------------------------------------------------------------" >> ${out_file}
echo "" >> ${out_file}
echo "ENV{mm_detect_id}!=\"pci:0300:00:${vendor_id}:????:????:????\", GOTO=\"end-nvidia\"" >> ${out_file}
echo "" >> ${out_file}
echo "  ENV{mm_detect_id}==\"pci:0300:00:${vendor_id}:????:????:????\", ENV{mm_detect_state_x}=\"nvidia\"" >> ${out_file}
echo "" >> ${out_file}

echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}
echo "NVIDIA devices" >> ${suported_devices_file}
echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}

old_id=" "

for card in ${card_list} ; do
   #echo "-------- "
       id=`echo "${card}" | sed -e 's/<tr id="0x\([0-9a-fA-F\s]*\)<td>\([a-zA-Z0-9/ ()-\+]*\)><td>0x\([a-zA-Z0-9x ]*\)><td>\([A-Z0-9 -]*\).*/\1/' -e 's/\(.*\)/\L\1/'`
     name=`echo "${card}" | sed -e 's/<tr id="0x\([0-9a-fA-F\s]*\)<td>\([a-zA-Z0-9/ ()-\+]*\)><td>0x\([a-zA-Z0-9x ]*\)><td>\([A-Z0-9 -]*\).*/\2/'`
   pci_id=`echo "${card}" | sed -e 's/<tr id="0x\([0-9a-fA-F\s]*\)<td>\([a-zA-Z0-9/ ()-\+]*\)><td>0x\([a-zA-Z0-9x ]*\)><td>\([A-Z0-9 -]*\).*/\3/' -e 's/\(.*\)/\L\1/'`
    class=`echo "${card}" | sed -e 's/<tr id="0x\([0-9a-fA-F\s]*\)<td>\([a-zA-Z0-9/ ()-\+]*\)><td>0x\([a-zA-Z0-9x ]*\)><td>\([A-Z0-9 -]*\).*/\4/' -e 's/ //'`
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
     echo "${legend}" >> ${out_file}
     echo "${entry}" >> ${out_file}
     if [ ${class} = '-' ] ; then
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
echo "LABEL=\"end-nvidia\"" >> ${out_file}
echo "" >> ${out_file}

echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}
echo "" >> ${suported_devices_file}

unset IFS

rm ./file.tmp

echo ""
echo "Done!"
echo "Results are in ${out_file}"

exit 0
