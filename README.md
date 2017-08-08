# MiniMyth2

What it is
==========
Minimyth2 is dedicated PXE boot image designed
to turnaround small-factor computers like Intel
NUC, Nvidia ION or AMD APU (Brazos/Kabini/etc),
into disk-less, zero-effort provisioned,
network booted MythTV frontend appliance.
From the software perspective, Minimyth2 is MythTV
frontend with minimal required run-time and
video/audio/IR remote drivers allowing to run
MythTV frontend with full speed & features on
recent hardware from Intel/AMD/Nvidia.


Project Goals
=============
Major goals of this project are:
Make MythTV frontend zero-effort setup/deployment.
Setup of MythTV frontend might be as simple as
enabling PXE boot in frontend’s BIOS/EFI.

Make graphics/sound/IR remote detection/configuration
fully automatic. No any drivers install nor configuration
is required for any from 1100+ of graphic supported.
The same for audio and IR remotes.

Make easy adoption of recent technology achievements
like Intel NUC, Nvidia ION or AMD APU (Brazos/Kabini/etc)
as hardware base for dedicated MythTV appliance.
Project is exploiting recent developments in GNU/Linux
area like i.e. Mesa3D/Gallium, Intel SNA/Glamor for video
hardware decode, in-kernel IR remote decode for covering
as wide as possible variety of supported IR remotes.


What it is not
==============
Minimyth2 is not yet another Linux distro which is
designed to install on PC hardware and to used as computer
running various software. 
Target scenario with Minmyth2 is small, disk-less appliance
running MythTV Frontend (and only MythTV Frontend).


