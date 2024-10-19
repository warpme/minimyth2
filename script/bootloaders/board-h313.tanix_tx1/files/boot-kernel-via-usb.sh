#!/bin/sh

if [ x$(whoami) != "xroot" ] ; then
  echo " "
  echo "Script requires to run as root. Exiting ..."
  echo " "
  exit 1
fi

missing_libs=$(ldd ./sunxi-fel | grep "not found" | sed -e "s|sunxi-fel\:||g")

if [ ! -z "${missing_libs}" ] ; then
  echo " "
  echo "Script has issue with:${missing_libs}"
  echo "Install missing compnent(s) then run again. Now exiting ..."
  echo " "
  exit 1
fi

welcome_string="H616"

echo "Awaiting for device ..."

while true
do
    device=$(sunxi-fel -l | sed -e 's/\s*//g')
    if [[ "${device}" =~ "${welcome_string}" ]] ; then
        echo "Device discovered. Good!!!"
        break
    else
        sleep 1
        echo "Awaiting for device ..."
    fi
done

echo "Starting upload U-Boot, Linux Kernel, DTB to device ..."

sunxi-fel -v -p uboot bootloader/u-boot-sunxi-with-spl.bin \
write 0x40200000 Image \
write 0x4fa00000 dtbs/allwinner/sun50i-h313-tanix-tx1.dtb \
write 0x4fc00000 load-kernel.scr \

echo "Booting Linux kernel on device. Please wait ..."

sleep 15

echo " "
echo " "
echo "Now you can (re)connect USB key with rootfs ..."
echo " "
echo " "
