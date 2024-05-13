
GARNAME      = util-linux
GARVERSION   = 2.40.1
CATEGORIES   = utils
MASTER_SITES = https://www.kernel.org/pub/linux/utils/util-linux/v2.40/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/ncursesw devel/zlib python3/python

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D tinfo=disabled \
	-D ncursesw=disabled \
	-D ncurses=disabled \
	-D slang=disabled \
	-D cryptsetup=disabled \
	-D cryptsetup-dlopen=disabled \
	-D zlib=enabled \
	-D readline=disabled \
	-D nls=enabled \
	-D libutil=disabled \
	-D libutempter=disabled \
	-D libpcre2-posix=disabled \
	-D libuser=disabled \
	-D selinux=disabled \
	-D audit=disabled \
	-D smack=disabled \
	-D magic=disabled \
	-D econf=disabled \
	-D systemd=disabled \
	-D sysvinit=disabled \
	-D btrfs=disabled \
	-D widechar=disabled \
	-D python=python3 \
	-D build-python=disabled \
	-D build-libblkid=enabled \
	-D build-libuuid=enabled \
	-D build-liblastlog2=disabled \
	-D build-pam-lastlog2=disabled \
	-D build-libmount=enabled \
	-D build-libsmartcols=enabled \
	-D build-libfdisk=disabled \
	-D build-fdisks=disabled \
	-D build-mount=enabled \
	-D build-losetup=disabled \
	-D build-zramctl=enabled \
	-D build-fsck=disabled \
	-D build-partx=disabled \
	-D build-uuidd=enabled \
	-D build-wipefs=disabled \
	-D build-mountpoint=disabled \
	-D build-fallocate=disabled \
	-D build-unshare=disabled \
	-D build-nsenter=disabled \
	-D build-setpriv=disabled \
	-D build-hardlink=disabled \
	-D build-eject=enabled \
	-D build-agetty=enabled \
	-D build-cramfs=enabled \
	-D build-bfs=disabled \
	-D build-minix=disabled \
	-D build-fdformat=disabled \
	-D build-hwclock=disabled \
	-D build-lslogins=disabled \
	-D build-wdctl=disabled \
	-D build-cal=disabled \
	-D build-logger=disabled \
	-D build-switch_root=enabled \
	-D build-pivot_root=disabled \
	-D build-lsmem=enabled \
	-D build-lsirq=enabled \
	-D build-irqtop=disabled \
	-D build-chmem=disabled \
	-D build-ipcrm=disabled \
	-D build-ipcs=disabled \
	-D build-rfkill=disabled \
	-D build-tunelp=disabled \
	-D build-kill=disabled \
	-D build-last=disabled \
	-D build-utmpdump=disabled \
	-D build-line=disabled \
	-D build-mesg=disabled \
	-D build-raw=disabled \
	-D build-rename=enabled \
	-D build-vipw=disabled \
	-D build-newgrp=disabled \
	-D build-chfn-chsh=disabled \
	-D build-login=disabled \
	-D build-nologin=disabled \
	-D build-sulogin=disabled \
	-D build-su=disabled \
	-D build-runuser=disabled \
	-D build-ul=disabled \
	-D build-more=disabled \
	-D build-pg=disabled \
	-D build-pipesz=disabled \
	-D build-setterm=disabled \
	-D build-schedutils=disabled \
	-D build-wall=disabled \
	-D build-write=disabled \
	-D build-bash-completion=disabled \
	-D build-pylibmount=disabled \
	-D program-tests=false \
	-D chfn-chsh-password=false \
	-D chsh-only-listed=true \
	-D use-tty-group=false \
	-D build-plymouth-support=disabled \
	-D use-tls=true \
	-D pg-bell=true \
	-D colors-default=false \

include ../../gar.mk

post-install:
	@mv -f $(DESTDIR)$(bindir)/eject $(DESTDIR)$(bindir)/eject-cdrom
	@ln -srf $(DESTDIR)$(bindir)/findmnt $(DESTDIR)$(ebindir)/findmnt
	@ln -srf $(DESTDIR)$(bindir)/lsblk   $(DESTDIR)$(ebindir)/lsblk
	@ln -srf $(DESTDIR)$(bindir)/lsfd    $(DESTDIR)$(ebindir)/lsfd
	@ln -srf $(DESTDIR)$(bindir)/mount   $(DESTDIR)$(ebindir)/mount
	@ln -srf $(DESTDIR)$(bindir)/umount  $(DESTDIR)$(ebindir)/umount
	@$(MAKECOOKIE)
