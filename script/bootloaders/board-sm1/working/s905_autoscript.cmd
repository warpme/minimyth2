if fatload mmc 0 0x11000000 boot_android; then if test ${ab} = 0; then setenv ab 1; saveenv; exit; else setenv ab 0; saveenv; fi; fi;
if fatload usb 0 0x11000000 boot_android; then if test ${ab} = 0; then setenv ab 1; saveenv; exit; else setenv ab 0; saveenv; fi; fi;
if fatload mmc 0 0x1000000 u-boot.ext; then go 0x1000000; fi;
if fatload usb 0 0x1000000 u-boot.ext; then go 0x1000000; fi;
setenv env_addr 0x10400000
setenv kernel_addr 0x11000000
setenv initrd_addr 0x13000000
setenv boot_start booti ${kernel_addr} - ${dtb_mem_addr}
setenv addmac 'if printenv mac; then setenv bootargs ${bootargs} mac=${mac}; elif printenv eth_mac; then setenv bootargs ${bootargs} mac=${eth_mac}; fi'
# setenv try_boot_start 'if fatload ${devtype} ${devnum} ${kernel_addr} zImage; then if fatload ${devtype} ${devnum} ${initrd_addr} uInitrd; then fatload ${devtype} ${devnum} ${env_addr} uEnv.ini && env import -t ${env_addr} ${filesize} && run addmac; fatload ${devtype} ${devnum} ${dtb_mem_addr} ${dtb_name} && run boot_start; fi; fi;'
setenv try_boot_start 'if fatload ${devtype} ${devnum} ${kernel_addr} zImage; then fatload ${devtype} ${devnum} ${env_addr} uEnv.ini && env import -t ${env_addr} ${filesize} && run addmac; fatload ${devtype} ${devnum} ${dtb_mem_addr} ${dtb_name} && run boot_start; fi;'
setenv devtype mmc
setenv devnum 0
run try_boot_start
setenv devtype usb
for devnum in 0 1 2 3 ; do run try_boot_start ; done

