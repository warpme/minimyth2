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
SoC           | Tested on        | WiFi Chip & Support                     | CEC Support            | Sleep/Resume                   | Remarks                       |
------------- |------------------|-----------------------------------------|------------------------|--------------------------------|-------------------------------|
Allwinner H6  | EachLink H6 Mini | rtl8723bs@SDIO; not works (I/O issue)   | works                  | works                          | well supported                | 
Allwinner H6  | TanixTX6-Mini    | xr819@SDIO; not works (firmware issue)  | works                  | works                          | well supported                | 
Allwinner H6  | Beelink GS1      | fn-link6222@PCI-e; not works (no PCI-e) | works                  | not works (firmware issue)     | some things are still missing | 
Rockchip 3328 | Beelink A1       | rtl8821@USB; works                      | works                  | not works (not implmented yet) | good prospects                |
Rockchip 3399 | RockPI 4-b       | ap6256@SDIO; works                      | works                  | not works (not implmented yet) | well supported                |
Amlogic s905  | TanixTX3-Mini    | sv6051@SDIO; not works (no driver aval) | not works (kernel bug) | not works (firmware issue)     | support stalled               |
Amlogic s912  | Beelink GT1      | qca9377@SDIO; works v.unreliably        | not works (kernel bug) | not works (firmware issue)     | support stalled               |
Amlogic sm1   | x96Air           | rtl8189@SDIO; works                     | not works (kernel bug) | not works (firmware issue)     | support stalled               |
Broadcom 2837 | Rpi3-b           | brcm43430@SDIO; works                   | not works (kernel bug) | not works (not implmented yet) | only RPI custom kernel works  |
Broadcom 2711 | Rpi4-b           | brcm4345@SDIO; works                    | not works (kernel bug) | not works (not implmented yet) | only RPI custom kernel works  | 
x86_64        | i5 NUC           | n/a                                     | n/a                    | works (s3ram)                  | perfect support               |
x86_64        | Beelink BT4      | ac3165@PCI-e; works                     | n/a                    | works (s1idle)                 | perfect support               |
x86_64        | AMD Kabini       | n/a                                     | n/a                    | works (s3ram)                  | perfect support               |
x86_64        | ION2             | n/a                                     | n/a                    | works (s3ram)                  | perfect support               |

### Hardware Video Decode support
This is video related functionality avaliable on current code (Linux kernel + Mesa + MythTV)
At this moment quality of playback is good for technology preview. It is __not ready yet to daily usage__ as playback seek not works correctly.
SoC           | Tested on                                    | Decoder/API                           | Currently supported video decode HW.accel | Screen drawing      | Video rendering                     | Remarks                                              |
------------- |----------------------------------------------|---------------------------------------|-------------------------------------------|---------------------|-------------------------------------|------------------------------------------------------|
Allwinner H6  | EachLink H6 Mini, TanixTX6-Mini, Beelink GS1 | cedrus/v4l2_request                   | MPEG2, H264, HEVC, VP8                    | X11, EGLFS, Wayland | DRM_PRIME (EGL_DMABUF & DRM_DMABUF) | Good playback, seek not works 
Rockchip 3328 | Beelink A1                                   | rkvdec/v4l2_request                   | MPEG2, H264, HEVC, VP8, VP9               | X11, EGLFS, Wayland | DRM_PRIME (EGL_DMABUF & DRM_DMABUF) | Good playback, seek not works
Rockchip 3399 | RockPI 4-b                                   | rkvdec/v4l2_request                   | MPEG2, H264, HEVC, VP8, VP9               | X11, EGLFS, Wayland | DRM_PRIME (EGL_DMABUF & DRM_DMABUF) | Good playback, seek not works, wyaland gives black.screen
Amlogic s905  | TanixTX3-Mini                                | vdec/v4l2_m2m                         | MPEG2, H264, HEVC, VP9                    | X11, EGLFS, Wayland | DRM_PRIME (EGL_DMABUF & DRM_DMABUF) | Good playback, seek not works, limited HEVC on s905w
Amlogic s912  | Beelink GT1                                  | vdec/v4l2_m2m                         | MPEG2, H264, HEVC, VP9                    | X11, EGLFS, Wayland | DRM_PRIME (EGL_DMABUF & DRM_DMABUF) | Good playback, seek not works
Amlogic sm1   | x96Air                                       | vdec/v4l2_m2m                         | MPEG2, H264, HEVC, VP9                    | X11, EGLFS, Wayland | DRM_PRIME (EGL_DMABUF & DRM_DMABUF) | Good playback, seek not works, artefacts on h264
Broadcom 2837 | Rpi3-b                                       | rpi_dec/v4l2_m2m                      | MPEG4, H264                               | X11, EGLFS, Wayland | DRM_PRIME (EGL_DMABUF & DRM_DMABUF) | Good playback, seek not works
Broadcom 2711 | Rpi4-b                                       | rpi_dec/v4l2_m2m, rpivid/v4l2_request | H264, HEVC                                | X11, EGLFS, Wayland | DRM_PRIME (EGL_DMABUF & DRM_DMABUF) | Works only with RPI kernel, HEVC not works yet
x86_64        | i5 NUC, Beelink BT4, AMD Kabini, ION2        | VAAPI, VDPAU, NvDEC                   | MPEG2, MPEG4, H264, HVEC                  | X11, EGLFS, Wayland | DRM_PRIME (EGL_DMABUF & DRM_DMABUF) | Perfect playback

### Video Decoding Test results




# Tests

## Playback HW video decode tests on various HW.

This is summary of video samples tests conducted on current MiniMyth2 code:
- MiniMyth2: 11.15.2
- MythTV: 2021-02-23 gd2c2c8f r2365
- Linux kernel: 5.11.1
- Mesa3D: 21.0.0-rc5
- Screen drawing mode: EGLFS
- DRM_PRIME mode: DRM Planes
                                  |    Allwinner    |    Rockchip     |         Amlogic          |   RaspberryPi   |  AMD   |      Intel      | Nvidia |
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
 Sample                           |   H6   |  h616  | rk3328 | rk3399 |s905w(1)|  s912  |   sm1  |bcm2837 |bcm2711 |Kabini2 | hd4000 |hd600(3)| ion2(1)|
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
h264-big_buck_bunny_1080_60fps.mp4|   ok   |  WiP   |   ok   |   ok   |panning |   ok   |   ok   | jumpy  | no 3D  |        |   ok   |   ok   |   ok   |
h264-big_buck_bunny_2160_60fps.mp4| jumpy  |  WiP   | jumpy  | jumpy  | jumpy  | jumpy  | jumpy  |  hang  | No 3D  |        |   ok   |   ok   |   ok   |
h264-dubai_2160p_23.978fps.mkv    |   ok   |  WiP   | jumpy  |   ok   | jumpy  |   ok   |   ok   |  hang  | No 3D  |        |   ok   |   ok   |   ok   |
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
h264-Sat_1080i_25fps.mkv          |   ok   |  WiP   |   ok   |   ok   |quite ok|   ok   |artefact|   ok   | No 3D  |        |   ok   |   ok   |   ok   |
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
h264-TVN_1080i_25fps.ts           |   ok   |  WiP   |   ok   |   ok   |quite ok|   ok   |artefact|   ok   | No 3D  |        |   ok   |   ok   |   ok   |
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
h264-TVP3_576i_25fps.ts           |   ok   |  WiP   |   ok   |   ok   | tilling|   ok   | garbage|   ok   | No 3D  |        |   ok   |   ok   |   ok   |
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
hevc-about_tomsk_2160p.mp4        |   ok   |  WiP   | jumpy  |   ok   |  hang  |  hang  |  hang  |  hang  | No 3D  |        |  ok(2) |   ok   | s.w.dec|
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
hevc-big_buck_bunny_1080p.mp4     |   ok   |  WiP   |   ok   |   ok   |   ok   |   ok   |   ok   |s.w.dec | No 3D  |        |  ok(2) |   ok   | s.w.dec|
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
hevc-big_buck_bunny_2160p.mp4     |   ok   |  WiP   | jumpy  |   ok   |  hang  |  hang  |  hang  |  hang  | No 3D  |        |  ok(2) |   ok   | s.w.dec|
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
hevc-FasionTV_2160p_25fps.ts      |   ok   |  WiP   | q.exit | q.exit |v.jumpy |   ok   |   ok   |  hang  | No 3D  |        |  ok(2) |   ok   | s.w.dec|
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
hevc-NASA_2160p_29.978fps.ts      | jumpy  |  WiP   | v.jumpy|   ok   |v.jumpy | jumpy  |   ok   |  hang  | No 3D  |        |jumpy(2)|   ok   | s.w.dec|
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
hevc-tos_4096x1720_24fps.mkv      |   ok   |  WiP   | s.w.dec|   ok   |  hang  | jumpy  |  hang  |  hang  | No 3D  |        |  ok(2) |   ok   | s.w.dec|
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
hevc-trailer_1080p_23.978fps.mkv  |   ok   |  WiP   |   ok   |   ok   |  hang  |  hang  |black.sc| s.w.dec| No 3D  |        |   ok   |   ok   | s.w.dec|
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
mpeg2-sample_1080_23.978fps.ts    |   ok   |  WiP   |   ok   |   ok   | green.s| green.s|  green |   ok   | No 3D  |        |   ok   |   ok   |   ok   |
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
mpeg2-sample_2160_23.978fps.ts    |   ok   |  WiP   |  hang  |  hang  |artefact|  hang  |  green |  hang  | No 3D  |        |   ok   |   ok   |   ok   |
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
mpeg2-TV4_576i_25fps.mpg          |   ok   |  WiP   |   ok   |   ok   | green.s| green.s| garbage|   ok   | No 3D  |        |   ok   |   ok   |   ok   |
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
vp8-big_buck_bunny_1080p.webm     |   ok   |  WiP   |   ok   |   ok   | s.w.dec| s.w.dec| s.w.dec| s.w.dec| No 3D  |        |  ok(2) |   ok   | s.w.dec|
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
vp8-big_buck_bunny_4000p.webm     |artefact|  WiP   |  hang  |  hang  | s.w.dec| s.w.dec| s.w.dec|  hang  | No 3D  |        |jumpy(2)|   ok   | s.w.dec|
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
vp9-big_buck_bunny_720p.webm      | s.w.dec|  WiP   |   ok   |   ok   |artefact| s.w.dec|   ok   | s.w.dec| No 3D  |        |  ok(2) |  ok(2) | s.w.dec|
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
vp9-big_buck_bunny_1080p.webm     | s.w.dec|  WiP   |   ok   |   ok   |artefact| s.w.dec|   ok   | s.w.dec| No 3D  |        |  ok(2) |  ok(2) | s.w.dec|
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|
vp9-big_buck_bunny_2160p.webm     | s.w.dec|  WiP   | jumpy  |   ok   |artefact| s.w.dec|  jumpy |  hang  | No 3D  |        |jumpy(2)|jumpy(2)| s.w.dec|
----------------------------------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|--------|

(1) - tested only drawing to X11 as EGLFS/Wayland not works on this HW
(2) - sw.decode by FFMPEG
(3) - testing on EGLGS DMAbuf as DRM Planes not works
