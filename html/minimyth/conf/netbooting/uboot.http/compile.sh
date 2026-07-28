#!/bin/sh

# Script compiles uboot scripts using *.conf and boot-common-nfs.inc[boot-common-nfs.inc]
# compiled .scr scripts are move one-dir-up

compile_command="mkimage -A arm64 -T script -C none -n 'NFS_NetBoot' -d"




files_to_compile=$(ls -1 *.conf)

for file in ${files_to_compile} ; do

    echo "==> compiling ${file} for NFS variant ..."
    cp -f ${file} ${file}.nfs.tmp
    cat boot-common-nfs.inc >> ${file}.nfs.tmp
    ${compile_command} ${file}.nfs.tmp ${file}.nfs.compiled

    echo "==> compiling ${file} for RAM variant ..."
    cp -f ${file} ${file}.ram.tmp
    cat boot-common-ram.inc >> ${file}.ram.tmp
    ${compile_command} ${file}.ram.tmp ${file}.ram.compiled

    rm ${file}.*.tmp

done

rename ".conf.nfs.compiled" ".nfs.scr" *
rename ".conf.ram.compiled" ".ram.scr" *

echo "==> moving *.scr scripts one dir up ..."
mv *.scr ../

echo "done ..."
