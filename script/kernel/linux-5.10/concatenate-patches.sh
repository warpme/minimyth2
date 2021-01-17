#!/bin/sh

patch_list=`ls -1 *.patch`
final_patch="0552-arm64-dts-ARM-dts-allwinner-a64-h3-h6-add-crust-support.patch"

rm -f ${final_patch}
touch ${final_patch}

for patch in ${patch_list} ; do

  echo "Adding ${patch}"
  cat ${patch} >> ${final_patch}

done

