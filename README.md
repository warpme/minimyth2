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

## Building MiniMyth2

### Prerequisites
The build system requires following set of binaries and libraries:

- bison
- cvs
- flex
- gawk
- gcc[gcc-multilib]
- git
- grep
- make
- mercurial
- patch
- subversion
- texinfo
- wget

### Build instructions

#### For Ubuntu 16.04 LTS or 19.10 (just those two were tested) quick build guide:
Start terminal and run commands below:
- sudo apt install git bison make cvs flex gawk mercurial subversion texinfo gcc-multilib
- cd Desktop
- git clone https://github.com/warpme/minimyth2.git
- mkdir ../.minimyth2 ../build
- cp minimyth2/minimyth.conf.mk.example.aarch64 ../.minimyth2/minimyth.conf.mk
- set mm_HOME variable in file $(HOME)/.minimyth2/minimyth.conf.mk to minimyth2 build-root directory
- cd Desktop/minimyth2/script/
- make garchive
- cd Desktop/minimyth2/script/meta/minimyth/
- make build

#### For ArchLinux (tested on 20-03-2020 rolling release state) quick build guide:

Start terminal, and run commands below:
- sudo pacman -S bison make cvs flex gawk mercurial subversion texinfo gcc patch wget git which
- git clone https://github.com/warpme/minimyth2.git
- mkdir .minimyth2 build
- cp minimyth2/minimyth.conf.mk.example.aarch64 .minimyth2/minimyth.conf.mk
- set mm_HOME variable in file $(HOME)/.minimyth2/minimyth.conf.mk to minimyth2 build-root directory
- cd minimyth2/script/
- make garchive
- cd minimyth2/script/meta/minimyth/
- make build

#### For Fedora (tested on Fedora31) quick build guide:

Start terminal and run commands below:
- sudo dnf install bison make cvs flex gawk mercurial subversion texinfo gcc gcc-c++ patch wget git
- cd Desktop
- git clone https://github.com/warpme/minimyth2.git
- mkdir ../.minimyth2 ../build
- cp minimyth2/minimyth.conf.mk.example.aarch64 ../.minimyth2/minimyth.conf.mk
- set mm_HOME variable in file $(HOME)/.minimyth2/minimyth.conf.mk to minimyth2 build-root directory
- cd Desktop/minimyth2/script/
- make garchive
- cd Desktop/minimyth2/script/meta/minimyth/
- make build

