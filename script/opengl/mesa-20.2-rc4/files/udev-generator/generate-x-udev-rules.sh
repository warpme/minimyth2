#!/bin/sh
#
# Script to generate udev.rule files for all cards listed in mesa/include/pci_ids//XXX_pci_ids.h files
#
# Script expects following list of input params:
# par1: mesa pci_ids.h path/file (i.e. i965_pci_ids.h)
# par2: output udev.rule path/file (i.e. ../../../../script/meta/minimyth/files/source/rootfs/usr/lib/udev/rules.d)
# par3: supported-gfx-hardware.txt path/file (i.e ../../../../images/main/usr/share/supported-ati-gfx-hardware.txt)
# par4: PCI_vendor_ID (i.e. 8086 for Intel)
# par5: MiniMyth2 MM_HW_TYPE for non-accel gfx (i.e. intel)
# par6: MiniMyth2 MM_HW_TYPE for HW-accel gfx (i.e. intel_vaapi)
# par7: file with gfx 'name' (2nd fileld) having HW-accell
# par8: gfx familly symbolic name used as serializer in udev rules, etc
#
# v1.0: initial version, Piotr Oniszczuk, warpme@o2.pl

# set this to 'yes' to test-run with inputs like in lines 23..31
# to run you need put examplary i965_pci_ids.h filr to the same dir where script resies
test_input="no"

if [ x${test_input} = "xyes" ] ; then

  in_file='./i965_pci_ids.h'
  out_file='./05-minimyth-detect-x-i965.rules.disabled'
  suported_devices_file='./supported-gfx-hardware.txt'
  vendor_id='8086'
  mm_hw_type='intel_i915'
  mm_hw_type_accel='intel_vaapi'
  names_with_hw_acceel_file='./i965_names_with_HW_accell.lst'
  symbolic_name='i965'

else

  in_file=$1
  out_file=$2
  suported_devices_file=$3
  vendor_id=$4
  mm_hw_type=$5
  mm_hw_type_accel=$6
  names_with_hw_acceel_file=$7
  symbolic_name=$8

fi






















#-------------------------------------------------------------------------------
rm -f ${out_file}

# Filtering
# from:
# CHIPSET(0x4E71, ehl_7, "JSL", "Intel(R) UHD Graphics")
# to:
# 4E71,ehl_7,JSL,Intel(R)UHDGraphics)
#
# Rest of script uses "," as separator and expects: 
# fild1 = PCI_ID
# filed2 = name to see is HW accell or not
# filed3 - used in list of all supported devices file
card_list=`cat ${in_file} | grep "CHIPSET" | sed -e "s/CHIPSET(0x//g" -e "s/\"//g" -e "s/\s*//g" -e "s/(//g" -e "s/)//g"`






hw_accel_lst=`cat "${names_with_hw_acceel_file}" | sed -e 's/\s*//g'`

IFS='
'
echo " "
echo "Generating udev rules for ${symbolic_name} grapgics HW"
echo "  in_file                   = [${in_file}]"
echo "  out_file                  = [${out_file}]"
echo "  suported_devices_file     = [${suported_devices_file}]"
echo "  vendor_id                 = ${vendor_id}"
echo "  mm_hw_type                = ${mm_hw_type}"
echo "  mm_hw_type_accel          = ${mm_hw_type_accel}"
echo "  names_with_hw_acceel_file = [${names_with_hw_acceel_file}]"
echo "  symbolic_name             = ${symbolic_name}"
echo " "

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
echo "GOTO=\"end-${symbolic_name}\"" >> ${out_file}
echo "LABEL=\"begin\"" >> ${out_file}
echo "" >> ${out_file}
echo "# Import mm_detect_id." >> ${out_file}
echo "IMPORT{program}=\"/usr/lib/udev/mm_detect_id\"" >> ${out_file}
echo "" >> ${out_file}
echo "#-------------------------------------------------------------------------------" >> ${out_file}
echo "# ${symbolic_name} devices" >> ${out_file}
echo "#-------------------------------------------------------------------------------" >> ${out_file}
echo "" >> ${out_file}
echo "ENV{mm_detect_id}!=\"pci:0300:00:${vendor_id}:????:????:????\", GOTO=\"end-${symbolic_name}\"" >> ${out_file}
echo "" >> ${out_file}
echo "  # Setting default mm_detect_state_x value to ${mm_hw_type} when none rules are matched..." >> ${out_file}
echo "  # ENV{mm_detect_id}==\"pci:0300:00:${vendor_id}:????:????:????\", ENV{mm_detect_state_x}=\"${mm_hw_type}\"" >> ${out_file}
echo "" >> ${out_file}

echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}
echo "Supported ${symbolic_name} devices" >> ${suported_devices_file}
echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}

old_id=" "
c=1

for card in ${card_list} ; do

     id=`   echo "${card}" | cut -d ',' -f 1 | tr '[:upper:]' '[:lower:]'`
     name=` echo "${card}" | cut -d ',' -f 2`
     model=`echo "${card}" | cut -d ',' -f 3`
     #echo "      ID = ${id}"
     #echo "    Name = ${name}"
     #echo "   Model = ${model}"

     if [ `echo ${hw_accel_lst} | grep -c ${name}` = 0 ] ; then

        type=${mm_hw_type}

     else

        type=${mm_hw_type_accel}

     fi

     legend=`echo "  # Card=${name}, PCI_ID=${id}"`
     entry=`echo "  ENV{mm_detect_id}==\"pci:0300:00:${vendor_id}:${id}:????:????\", ENV{mm_detect_state_x}=\"${type}\""`

     if [ ${id} = ${old_id} ] ; then

        echo "Processing ${name}: card is duplicate of previous. Skipping!"

     else

        # Uncomment this to list all card names wich might be used in 
        # "names_with_hw_acceel_file" file
        #echo "${name}"

        old_id=${id}
        echo "${legend}" >> ${out_file}
        echo "${entry}" >> ${out_file}

        if [ x${type} = "x${mm_hw_type}" ] ; then

            echo "  ${model}, PCI_ID=${id}" >> ${suported_devices_file}

        else

            echo "  ${model}, PCI_ID=${id}, (HW Video Decode)" >> ${suported_devices_file}

        fi

        c=$((${c} + 1))

    fi

done

echo "" >> ${out_file}
echo "#-------------------------------------------------------------------------------" >> ${out_file}
echo "" >> ${out_file}
echo "# The state has been set, so save it." >> ${out_file}
echo "ENV{mm_detect_state_x}==\"?*\", RUN+=\"/usr/lib/udev/mm_detect x %k \$env{mm_detect_state_x}\"" >> ${out_file}
echo "" >> ${out_file}
echo "LABEL=\"end-${symbolic_name}\"" >> ${out_file}
echo "" >> ${suported_devices_file}
echo "Total: $c ${symbolic_name} cards supported" >> ${suported_devices_file}

echo "-------------------------------------------------------------------------------" >> ${suported_devices_file}
echo "" >> ${suported_devices_file}

unset IFS

echo ""
echo "udev rules for ${symbolic_name} are done ..."
echo "$c of ${symbolic_name} cards are in [${out_file}]"

exit 0
