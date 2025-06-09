# MiniMyth2

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/donate/?hosted_button_id=XWV5VJH6L3DF6)

Note: Last years I funded my semi-lab with 15+ various TVboxes by my private money and decided to stop investing my
private money - effectively just (and seems only) - to increase sells of tv box vendors.

If you want me to work on various issues or add new hardware support - pls consider donation to help me get required 
hardware to work on. Please note that this will also increase my satisfaction from - currently free of charge - work on minimyth2/miniarch.

Thank You in advance !

[Quick Start](https://github.com/warpme/minimyth2/wiki/Deploying-MiniMyth2#overview)

## What it is

MiniMyth2 is baseline for following artefacts:
![alt text](https://github.com/warpme/minimyth2/blob/master/miniX_projects_overview.jpg?raw=true)

## MiniMyth2 Appliance
MiniMyth2 artefact is dedicated firmware designed to turnaround small-factor ARMv7, ARMv8, i386 and x86_64 small-factor
computers into MythTV appliance offering fully functional MythTV frontend.

For platforms supporting PXE boot - MiniMyth2 offers disk-less, zero-effort provisioned, network booted MythTV frontend appliance.

From the software perspective, MiniMyth2 is MythTV frontend with minimal required run-time
(Linux kernel, GNU libraries, video/audio/IR remote drivers) allowing to run MythTV frontend with full speed & features
on recent hardware from Intel/AMD/Amlogic/Rockchip/Allwinner/Raspbery.

Conceptually, MiniMyth2 potential differentiator is full state-less design.
Practically it means MiniMyth2 offers fully functional MythTV fronted without ANY
hardware & user specific data needed at deployment. MiniMyth2 hardware specific config is automatically generated from HW
autodetection while user specific config is set with MythTV defaults. This allows real zero-config deployment.
After deployment - in normal usage - MiniMyth2 stays fully state-less. No runtime/user data is stored on local storage (for best
runtime speed - MiniMyth2 uses RAM disks. NFS is not used - as slow network links like FastEthernet or WiFi - are too slow
for good user experience).
In this context - MiniMyth2 is exactly like live USB / SD card distro with capability of automatic
customizations at every boot time. Boot customization data is stored in single config file and MiniMyth2 can automatically
download it at boot from central location (or read it from SD card / USB stick when central server not offers config file).

From distro perspective - when compared to other media-player-like distributions (i.e. CoreELEC, LibreELEC, etc) - MiniMyth2
is single universal rootfs image prepared for all supported boards.

## MiniMyth2 GAR build system
From development perspective - comparing MiniMyth2 GAR with other rootfs build systems - MiniMyth2 is closest to buildroot - with
difference MiniMyth2 uses canadian cross cross-compilation. In MiniMyth2 issuing make build command automates:
- downloading sources
- building build environment for building cross-toolchain
- building cross-toolchain
- building target binaries with cross-toolchain
- preparing bootable image
- uploading created bootable image to i.e. PXE server or NFS server or starts flashing SD card

In this context - MiniMyth2 GAR is closest to LFS build working in fully automated way.

MiniMyth2 GAR build system offers multi-board capability - so theoretically - it can build in one build session an single SD card
image for all SoC - if u-boot allow that. Practically - due some SoC boot procedure conflicts/bootloader SoC specific overlaps -
only subset of SoC are working well with such universal card SD image currently.



## MiniMyth2 Appliance Project Goals
Major goals of MiniMyth2 artefact are:

- Make MythTV frontend zero-effort setup/deployment.
Setup of MythTV frontend might be as simple as burning SD card or enabling PXE boot in frontend’s BIOS/EFI.

- Make graphics/sound/IR remote detection/configuration fully automatic.
No any drivers install nor configuration is required for any from 1500+ of graphic supported. The same for audio and IR remotes.

- Make easy adoption of recent FOSS achievements as base for creating zero-effort provisioned out-of-box ready to use
dedicated MythTV appliance.
Project is exploiting developments in GNU/Linux area like:
  - common single mainline Linux kernel support for Amlogic/Rockchip/Allwinner/Raspbery SoCs
  - Mesa3D support for ARM 3D IP
  - stateless/stateful V4L2 Video decode (Amlogic VDEC, Rockchip HANTRO/RKVDEC, Allwinner CEDRUS and Bradcom RPIVID)
  - in-kernel IR remote decode for covering wide variety of supported IR remotes




## More Info
- MiniMyth2 [Changelog](https://raw.githubusercontent.com/warpme/minimyth2/master/html/minimyth/document-changelog.txt)
- Current version [Release Notes](https://raw.githubusercontent.com/warpme/minimyth2/master/html/minimyth/document-release-notes.txt)
- List of supported [Graphics HW](https://raw.githubusercontent.com/warpme/minimyth2/master/html/minimyth/document-supported-gfx-hardware.txt) (on x86_64 platforms)
- List of supported [IR receivers](https://raw.githubusercontent.com/warpme/minimyth2/master/html/minimyth/document-supported-IR-remotes.txt)



## More details: Wiki
MiniMyth2 [Wiki](https://github.com/warpme/minimyth2/wiki)



## Current Status

### General Functionality
This is general functionality avaliable on current code (Mainline Linux kernel)

SoC           | Tested on        | WiFi Chip & Support                    | eMMC boot | CEC Support | LED display | Sleep/Resume                   | Remarks                       |
------------- |------------------|----------------------------------------|-----------|-------------|-------------|--------------------------------|-------------------------------|
Allwinner H6  | EachLink H6 Mini | works  (rtl8723bs@SDIO)                | works     | works       | works                          | well supported                |
Allwinner H6  | TanixTX6         | works  (ap6330@SDIO)                   | works     | works       | works       | works                          | well supported                |
Allwinner H6  | TanixTX6-Mini    | works  (xr819@SDIO)                    | not tested| works       | n/a         | not works                      | well supported                |
Allwinner H6  | Beelink GS1      | not works (fn-link6222@PCI-e no PCI-e) | works     | works       | n/a         | not works (firmware issue)     | some things are still missing |
Allwinner H6  | OrangePi-3 LTS   | not works (aw859a)                     | works     | works       | LED Diode,OK| not works (firmware issue)     | some things are still missing |
Allwinner H313| X96-Q(DDR3)      | works  (xr819@SDIO)                    | works     | works       | LED Diode,OK| not works (firmware issue)     | some things are still missing |
Allwinner H313| X96-Q(LPDDR3)    | works  (xr819@SDIO)                    | works     | works       | LED Diode,OK| not works (firmware issue)     | some things are still missing |
Allwinner H313| X96-Q(LPDDR3v1.3)| works  (xr819@SDIO)                    | works     | works       | LED Diode,OK| not works (firmware issue)     | some things are still missing |
Allwinner H313| X96-Q(DDR3Lv5.1) | works  (xr819@SDIO)                    | works     | works       | LED Diode,OK| not works (firmware issue)     | some things are still missing |
Allwinner H313| TanixTX1         | not works (9082@SDIO)                  | works     | works       | LED Diode,OK| not works (firmware issue)     | some things are still missing |
Allwinner H616| TanixTX6s-axp313 | works  (ap6330@SDIO)                   | not tested| works       | works       | not works (firmware issue)     | some things are still missing |
Allwinner H616| TanixTX6s        | works  (xr819@SDIO)                    | works     | works       | works       | not works (firmware issue)     | some things are still missing |
Allwinner H616| Pendoo-X12Pro    | works  (sp6330@SDIO)                   | works     | works       | works       | not works (firmware issue)     | some things are still missing |
Allwinner H616| OrangePi-Zero2   | works  (aw859a@SDIO)                   | not tested| works       | LED Diode,OK| not works (firmware issue)     | some things are still missing |
Allwinner H618| OrangePi-Zero3   | works  (uwe5622a@SDIO)                 | not tested| works       | LED Diode,OK| not works (firmware issue)     | some things are still missing |
Allwinner H618| Vontar H618      | works  (ap6334@SDIO)                   | works     | works       | works       | not works (firmware issue)     | some things are still missing |
Allwinner H618| OrangePi-Zero2w  | works  (uwe5622a@SDIO)                 | not tested| works       | LED Diode,OK| not works (firmware issue)     | some things are still missing |
Allwinner H618| Transpeed-8k618t | works  (hk2735@SDIO)                   | works     | works       | works       | not works (firmware issue)     | some things are still missing |
Rockchip 3328 | Beelink A1       | works  (rtl8821@USB)                   | not works | works       | works       | currently power off/on         | well supported                |
Rockchip 3399 | RockPI 4-b       | works  (ap6256@SDIO)                   | works     | works       | n/a         | currently power off/on         | well supported                |
Rockchip 3399 | RockPI 4-se      | works  (ap6255@SDIO)                   | works     | works       | n/a         | currently power off/on         | well supported                |
Rockchip 3399 | OrangePi-4 LTS   | works  (uwe5622@SDIO)                  | works     | works       | LED Diode,OK| not works                      | good prospects                |
Rockchip 3528 | Vontar-R3        | not works                              | not tested| not works   | not works   | not works                      | missing VOP3 so no HDMI       |
Rockchip 3566 | X96-X6           | works  (am7256@SDIO)                   | works     | works       | works       | not works                      | good prospects                |
Rockchip 3566 | Quartz64 Model B | works  (cm256sm@SDIO)                  | not tested| works       | n/a         | not works                      | good prospects                |
Rockchip 3566 | URVE Pi          | works  (rtl8821@SDIO)                  | works     | not works   | n/a         | not works                      | good prospects                |
Rockchip 3566 | OrangePi-3B      | works  (uwe5622@SDIO)                  | not tested| works       | LED Diode,OK| not works                      | good prospects                |
Rockchip 3566 | Zero-3w (wifi6)  | works  (aic8800@SDIO)                  | works     | works       | LED Diode,OK| not works                      | good prospects                |
Rockchip 3566 | Zero-3w (wifi5)  | works  (ap6212@SDIO)                   | works     | works       | LED Diode,OK| not works                      | good prospects                |
Rockchip 3566 | Zero-3e          | n/a                                    | n/a       | works       | LED Diode,OK| not works                      | good prospects                |
Rockchip 3566 | Rock3-C          | works  (ap6256@SDIO)                   | works     | works       | n/a         | not works                      | good prospects                |
Rockchip 3568 | Rock3-A          | works  (iwl7265@PCI-e)                 | works     | works       | n/a         | not works                      | good prospects                |
Rockchip 3568 | Rock3-B          | works  (iwl7265@PCI-e)                 | works     | works       | n/a         | not works                      | good prospects                |
Rockchip 3588s| Rock5A           | n/a                                    | works     | works       | n/a         | not works                      | good prospects                |
Rockchip 3588s| Rock5C           | works  (aic8800@USB)                   | works     | works       | n/a         | not works                      | good prospects                |
Rockchip 3576 | NanoPi-M5        | not tested                             | not tested| not works   | LED Diode,OK| not works                      | good prospects                |
Rockchip 3588s| NanoPi-M6        | n/a                                    | works     | works       | n/a         | not works                      | good prospects                |
Rockchip 3588s| NanoPi-R6S       | n/a                                    | works     | works       | n/a         | not works                      | good prospects                |
Rockchip 3588s| OrangePi 5       | n/a                                    | works     | works       | n/a         | not works                      | good prospects                |
Rockchip 3588s| OrangePi 5 Pro   | works  (ap6256@SDIO)                   | works     | works       | n/a         | not works                      | good prospects                |
Rockchip 3588 | Rock5B           | n/a                                    | works     | works       | n/a         | not works                      | good prospects                |
Rockchip 3588 | Rock5T           | works  (rtl8852@PCI-e)                 | works     | works       | n/a         | not works                      | good prospects                |
Rockchip 3588 | Orange5 Plus     | n.a                                    | works     | works       | n/a         | not works                      | good prospects                |
Rockchip 3588 | NanoPC-T6        | n.a                                    | works     | works       | n/a         | not works                      | good prospects                |
Rockchip 3588 | NanoPC-T6-LTS    | n.a                                    | works     | works       | n/a         | not works                      | good prospects                |
Rockchip 3588 | Rock5 ITX        | n/a                                    | works     | works       | n/a         | not works                      | good prospects                |
Amlogic s905  | TanixTX3-Mini    | not works (sv6051@SDIO no driver aval) | not tested| works       | WiP         | not works (firmware issue)     | support stalled               |
Amlogic s912  | Beelink GT1      | works v.unreliably (qca9377@SDIO)      | not tested| works       | n/a         | not works (firmware issue)     | support stalled               |
Amlogic sm1   | X96-Air          | works  (rtl8189@SDIO)                  | not tested| works       | WiP         | not works (firmware issue)     | support stalled               |
Amlogic g12a  | Radxa-Zero       | works  (ap6256@SDIO)                   | not tested| works       | n/a         | not works (firmware issue)     | support stalled               |
Broadcom 2837 | Rpi3-b           | works  (brcm43430@SDIO)                | n/a       | works       | n/a         | no plans                       | all basics works nicelly      |
Broadcom 2711 | Rpi4-b           | works  (brcm4345@SDIO)                 | n/a       | works       | n/a         | no plans                       | all basics works nicelly      |
Broadcom 2712 | Rpi5-b           | works  (brcm4345@SDIO)                 | n/a       | works       | n/a         | no plans                       | all basics works nicelly      |
Intel i5      | i5 NUC           | n/a                                    | n/a       | n/a         | n/a         | works (s3ram)                  | perfect support               |
Intel Z8500   | Beelink MII-V    | works  (ac3165@PCI-e)                  | not tested| n/a         | n/a         | works (s1idle)                 | perfect support               |
Intel N3450   | Beelink BT4      | works  (ac3165@PCI-e)                  | not tested| n/a         | n/a         | not works (bios issue)         | perfect support, bootsplah nok|
Intel N3450   | Beelink T34      | works  (ac3165@PCI-e)                  | not tested| n/a         | n/a         | works (s3ram)                  | perfect support, bootsplah nok|
AMD E1-2100   | AMD Kabini       | n/a                                    | n/a       | n/a         | n/a         | works (s3ram)                  | perfect support               |
Intel D2550   | ION2             | n/a                                    | n/a       | n/a         | n/a         | works (s3ram)                  | perfect support               |

### Hardware Video Decode support
This is video related functionality avaliable on current code (Linux kernel + Mesa + MythTV)
At the moment quality of playback is good for technology preview. 
On platforms with statefull v4l2_m2m video codecs: RPI3/RPI4 H.264 playback seek works well but fails on Amlogic.

SoC              | Tested on                                    | Supported Decoder/ Hw.decode API      | Currently supported video decode HW.accel  | Supported drawing     | Supported video render    | Remarks                                              |
-----------------|----------------------------------------------|---------------------------------------|--------------------------------------------|-----------------------|---------------------------|------------------------------------------------------|
Allwinner H6     | EachLink H6 Mini, TanixTX6, Beelink GS1, OPi3| cedrus/v4l2_request                   | MPEG2, H.264, HEVC, VP8, VP9               | X11, EGLFS, Wayland   | EGL_DMABUF, DRM_DMABUF    | Good playback
Allwinner H313   | X96-Q (DDR3), X96-Q (LPDDR3)                 | cedrus(6)/v4l2_request                | MPEG2, H.264, HEVC, VP8                    | X11, EGLFS, Wayland   | EGL_DMABUF, DRM_DMABU1(6)| Good playback
Allwinner H616   | TanixTX6s, OrangePI-Zero2                    | cedrus(6)/v4l2_request                | MPEG2, H.264, HEVC, VP8                    | X11, EGLFS, Wayland   | EGL_DMABUF, DRM_DMABU1(6)| Good playback
Allwinner H618   | Vontar H618, OrangePI-Zero3, OrangePI-Zero2W | cedrus(6)/v4l2_request                | MPEG2, H.264, HEVC, VP8                    | X11, EGLFS, Wayland   | EGL_DMABUF, DRM_DMABU1(6)| Good playback
Rockchip 3328    | Beelink A1                                   | rkvdec/v4l2_request                   | MPEG2, H.264, HEVC, VP8, VP9               | X11, EGLFS, Wayland   | EGL_DMABUF, DRM_DMABUF    | Good playback
Rockchip 3399    | RockPi4, RockPi4SE, OrangePi4-LTS            | rkvdec/v4l2_request                   | MPEG2, H.264, HEVC, VP8, VP9               | X11, EGLFS, (1)       | EGL_DMABUF, DRM_DMABUF    | Good playback, wyaland gives black.screen
Rockchip 3566    | X96-x6, Quartz64B, UrvePi, OrangePi3B, Rock3C| hantro,rkvdec2(7,10)/v4l2_request     | MPEG2, H.264, HEVC, VP8 (8)                | X11, EGLFS(9), Wayland| EGL_DMABUF, DRM_DMABUF(10)| Good playback, rendering to DRM plane has no OSD
Rockchip 3568    | Rock3-A, Rock3-B                             | hantro,rkvdec2(7,10)/v4l2_request     | MPEG2, H.264, HEVC, VP8 (8)                | X11, EGLFS(9), Wayland| EGL_DMABUF, DRM_DMABUF(10)| Good playback, rendering to DRM plane has no OSD
Rockchip 3576    | Nanopi-M5                                    | rkvdec2(13)/v4l2_request              | (13)                                       | X11, EGLFS(9), Wayland| EGL_DMABUF, DRM_DMABUF(10)| Good playback, rendering to DRM plane has no OSD
Rockchip 3588    | Rock5A, Rock5B, OrangePi5, OrangePi5Plus     | hantro,rkvdec2(7,10)/v4l2_request     | MPEG2, H.264, HEVC, VP8 (8)                | X11, EGLFS(9), Wayland| EGL_DMABUF, DRM_DMABUF(10)| Good playback, rendering to DRM plane has no OSD
Amlogic s905     | TanixTX3-Mini                                | vdec/v4l2_m2m                         | MPEG2, H.264, HEVC, VP9                    | X11, Wayland (2)      | EGL_DMABUF, DRM_DMABUF    | Good playback, seek on breaks playback, limited HEVC on s905w
Amlogic s912     | Beelink GT1                                  | vdec/v4l2_m2m                         | MPEG2, H.264, HEVC, VP9                    | X11, EGLFS, Wayland   | EGL_DMABUF, DRM_DMABUF    | Good playback, seek on breaks playback
Amlogic sm1      | X96-Air                                      | vdec/v4l2_m2m                         | MPEG2, H.264, HEVC, VP9                    | X11, EGLFS, Wayland   | EGL_DMABUF, DRM_DMABUF    | Good playback, seek on breaks playback, artefacts on H.264
Amlogic g12a     | Radxa-Zero                                   | vdec/v4l2_m2m                         | MPEG2, H.264, HEVC, VP9                    | X11, EGLFS, Wayland   | EGL_DMABUF, DRM_DMABUF    | Good playback, seek on breaks playback
Broadcom 2837    | Rpi3-b                                       | rpi_dec/v4l2_m2m                      | H.264                                      | X11, EGLFS, Wayland   | EGL_DMABUF, DRM_DMABUF    | Good playback
Broadcom 2711    | Rpi4-b                                       | rpi_dec/v4l2_m2m, rpivid/v4l2_request | H.264, HEVC                                | X11, EGLFS, Wayland   | EGL_DMABUF, DRM_DMABUF    | Good playback
Broadcom 2712    | Rpi5-b                                       | rpivid/v4l2_request                   | HEVC                                       | X11, EGLFS(12),Wayland| EGL_DMABUF, DRM_DMABUF    | Good playback
Intel i5         | i5 NUC                                       | VAAPI                                 | MPEG2, H.264, VC1                          | X11, EGLFS, Wayland   | EGL_DMABUF (3)            | Perfect playback
Intel Z8500      | Beelink BT4                                  | VAAPI                                 | MPEG2, H.264, VC1, HVEC, VP8               | X11, EGLFS (4)        | EGL_DMABUF (3)            | Perfect playback
Intel N3450      | Beelink MII-V                                | VAAPI                                 | MPEG2, H.264, VC1, HVEC, VP8, VP9          | X11, EGLFS, Wayland   | EGL_DMABUF (3)            | Perfect playback
AMD E1-2100      | AMD Kabini                                   | VAAPI                                 | MPEG2, H.264, VC1                          | X11, EGLFS, Wayland   | EGL_DMABUF (3)            | Perfect playback
Intel D2550      | ION2                                         | VDPAU,VAPPI(11)                       | MPEG2, MPEG4, H.264, VC1                   | X11, (5)              | By GFx internally         | Perfect playback

- (1) - Wayland gives black screen on this HW
- (2) - EGLFS not works due z-position issue in messon-drm driver on this HW
- (3) - DRM Planes fails with KMS Atomic Commit on this HW
- (4) - mythfrontend segfaults in Wayland on this HW
- (5) - EGLFS and Wayland not working on this HW as legacy Nvidia drivers are not providing EGL nor DRM
- (6) - hw.video decode with rendering to DRM planes has very dark picture on this HW
- (7) - rkvdec2 is currently only partially supported on this SoC so some HEVC content is not decoded properly
- (8) - vp9 is not yet supported on this SoC (no rkvdec2 vp9 support yet)
- (9) - hw.video decode with rendering to DRM planes has no OSD (probably Z-order issue)
- (10) - rendering to DRM Planes gives not visible OSD on this HW
- (11) - mesa nouveau as of 22.2.0 has issue with VAAPI decode on Nvidia ION1/ION2
- (12) - as of 6.8-rc6 kernel EGLFS in DMABuf mode not works correctly
- (13) - rkvdec2 is currently in development for this soc

### Video Decoding Test results




# Tests

## Playback HW video decode tests on various HW.

This is summary of video samples tests conducted on current MiniMyth2 code: [Video test summary](https://github.com/warpme/minimyth2/blob/master/video-test-summary.txt)
