# MiniMyth2

## What it is
MiniMyth2 is dedicated firmware designed to turnaround small-factor ARMv7, ARMv8, i386 and x86_64 small-factor
computers into MythTV appliance offering fully functional MythTV frontend.

For platforms supporting PXE boot - MiniMyth2 offers disk-less, zero-effort provisioned, network booted MythTV frontend appliance.

From the software perspective, MiniMyth2 is MythTV frontend with minimal required run-time
(Linux kernel, GNU libraries, video/audio/IR remote drivers) allowing to run MythTV frontend with full speed & features
on recent hardware from Intel/AMD/Amlogic/Rockchip/Allwinner/Raspbery.


## Project Goals
Major goals of project are:

- Make MythTV frontend zero-effort setup/deployment.
Setup of MythTV frontend might be as simple as burning SD card or enabling PXE boot in frontend’s BIOS/EFI.

- Make graphics/sound/IR remote detection/configuration fully automatic.
No any drivers install nor configuration is required for any from 1500+ of graphic supported. The same for audio and IR remotes.

- Make easy adoption of recent FOSS achievements as base for creating zero-effort provisioned out-of-box ready to use
dedicated MythTV appliance.
Project is exploiting developments in GNU/Linux area like:
  - mainline Linux kernel support for Amlogic/Rockchip/Allwinner/Raspbery SoCs
  - Mesa3D Panfrost/Lima as FOSS support for ARM 3D IP
  - stateless/stateful V4L2 Video decode (Amlogic VDEC, Rockchip HANTRO/RKVDEC and Allwinner CEDRUS)
  - in-kernel IR remote decode for covering wide variety of supported IR remotes


## What it is not
MiniMyth2 is not just another Linux distro which is
designed to install on PC hardware and to used as computer
running various software.
Target scenario with MiniMyth2 is small, disk-less dedicated appliance
running MythTV Frontend (and preactically only MythTV Frontend).

## Current Status
SoC           | Tested on                                    | Currently supported video decode HW.accel | Remarks                            |
------------- |----------------------------------------------|-------------------------------------------|------------------------------------|
Allwinner H6  | EachLink H6 Mini, TanixTX6-Mini, Beelink GS1 | MPEG2, H264, HEVC, VP8                    | Good expierience, seek not works 
Rockchip 3328 | Beelink A1                                   | MPEG2, H264, VP8, VP9                     | Playback not fluent, seek not works
Rockchip 3399 | RockPI 4-b                                   | MPEG2, H264, VP8, VP9                     | Good expierience, seek not works
Amlogic s905  | TanixTX3-Mini                                | MPEG2, H264, HEVC, VP9                    | Playback not fluent, seek not works, no HEVC on s905w
Amlogic s912  | Beelink GT1                                  | MPEG2, H264, HEVC, VP9                    | Good expierience, seek not works
Amlogic sm1   | x96Air                                       | MPEG2, H264, HEVC, VP9                    | Good expierience, seek not works, artefacts on h264
Broadcom 2837 | Rpi3-b                                       | MPEG4, H264                               | Good expierience, seek not works
Broadcom 2711 | Rpi4-b                                       |                                           | Not working yet (issue with mainline kernel)
x86_64        | i5 NUC, Beelink BT4, AMD Kabini, i3+NvGT610  | MPEG2, MPEG4, H264, HVEC (on Z8500)       | Perfect expierience

## More Info
- MiniMyth2 [Changelog](https://raw.githubusercontent.com/warpme/minimyth2/master/html/minimyth/document-changelog.txt)
- Current version [Release Notes](https://raw.githubusercontent.com/warpme/minimyth2/master/html/minimyth/document-release-notes.txt)
- List of supported [Graphics HW](https://raw.githubusercontent.com/warpme/minimyth2/master/html/minimyth/document-supported-gfx-hardware.txt) (on x86_64 platforms)
- List of supported [IR receivers](https://raw.githubusercontent.com/warpme/minimyth2/master/html/minimyth/document-supported-IR-remotes.txt)

# More details: Wiki
MiniMyth2 [Wiki](https://github.com/warpme/minimyth2/wiki)
