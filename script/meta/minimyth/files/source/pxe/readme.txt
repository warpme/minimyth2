You can network boot MiniMyth using PXE.

There are two PXE boot loaders known to work with MiniMyth: the more common
PXELINUX and the more flexible iPXE. Because PXELINUX is more common, it is
easier to find network boot tutorials based on PXELINUX and PXELINUX is more
likely to work. However, at this time PXELINUX only supports downloading the
kernel and root file system using TFTP, whereas iPXE supports downloading the
kernel and root file system using TFTP and HTTP.

These directory contain files to help with configuring either PXELINUX or
iPXE based network booting, including the boot loaders
(pxelinux/tftpboot/minimyth/pxelinux.0 and ipxe/tftpboot/minimyth/ipxe.0),
sample boot loader configuration files
(pxelinux/tftpboot/minimyth/pxelinux.cfg/default and ipxe/tftpboot/minimyth/ipxe.cfg/default),
and ISC DHCP server configuration file fragments 
(pxelinux/dhcpd.conf and ipxe/dhcpd.conf).

The boot loader configuration files and the ISC DHCP server configuration file
fragments assume that you are in the 'America/Los_Angeles' timezone, that you
are using a server with the name 'tftp.home' and the address '192.168.0.1' and
that you are using the 'standard' MiniMyth boot directory structure:

[...]/tftpboot/minimyth/pxelinux.0
[...]/tftpboot/minimyth/pxelinux.cfg/default
[...]/tftpboot/minimyth/ipxe.0
[...]/tftpboot/minimyth/ipxe.cfg/default
[...]/tftpboot/minimyth/minimyth-{version}/kernel
[...]/tftpboot/minimyth/minimyth-{version}/rootfs
[...]/tftpboot/minimyth/minimyth-{version}/themes/
[...]/tftpboot/minimyth/conf/
[...]/tftpboot/minimyth/conf-rw/

were '[...]/tftpboot' is your TFTP server root directory. In addition,
when network booting with an NFS root file system, the files assume that you
are sharing the MiniMyth root file system as the NFS share
'192.168.0.1:/home/public/minimyth/minimyth-{version}'. Finally, the iPXE
files assume that either you are sharing your TFTP root directory as
'http://tftp.home/' or that you have copied the contents of your TFTP root
directory to 'http://tftp.home/'. You will need to change the files to
match your set up. However, for most reliable operation, it is strongly
suggested that you do not deviate from the 'standard' MiniMyth boot directory
structure.
