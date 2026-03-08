
GARNAME      = util-linux
GARVERSION   = 2.41.3
CATEGORIES   = utils
MASTER_SITES = https://www.kernel.org/pub/linux/utils/util-linux/v2.41/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/ncursesw devel/zlib python3/python lib/libxcrypt

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D program-tests=false \
	-D chfn-chsh-password=false \
	-D chsh-only-listed=true \
	-D use-tty-group=false \
	-D use-tls=true \
	-D pg-bell=true \
	-D colors-default=false \
	-D python=python3 \

include ../../gar.mk

post-install:
	@mv -f $(DESTDIR)$(bindir)/eject $(DESTDIR)$(bindir)/eject-cdrom

	@ln -srf $(DESTDIR)$(bindir)/findmnt $(DESTDIR)$(ebindir)/
	@ln -srf $(DESTDIR)$(bindir)/lsblk   $(DESTDIR)$(ebindir)/
	@ln -srf $(DESTDIR)$(bindir)/lsfd    $(DESTDIR)$(ebindir)/
	@ln -srf $(DESTDIR)$(bindir)/mount   $(DESTDIR)$(ebindir)/
	@ln -srf $(DESTDIR)$(bindir)/umount  $(DESTDIR)$(ebindir)/

	@ln -srf $(DESTDIR)$(sbindir)/agetty       $(DESTDIR)$(esbindir)/
	@ln -srf $(DESTDIR)$(sbindir)/blkdiscard   $(DESTDIR)$(esbindir)/
	@ln -srf $(DESTDIR)$(sbindir)/blkid        $(DESTDIR)$(esbindir)/
	@ln -srf $(DESTDIR)$(sbindir)/blkzone      $(DESTDIR)$(esbindir)/
	@ln -srf $(DESTDIR)$(sbindir)/blockdev     $(DESTDIR)$(esbindir)/
	@ln -srf $(DESTDIR)$(sbindir)/chcpu        $(DESTDIR)$(esbindir)/
	@ln -srf $(DESTDIR)$(sbindir)/ctrlaltdel   $(DESTDIR)$(esbindir)/
	@ln -srf $(DESTDIR)$(sbindir)/findfs       $(DESTDIR)$(esbindir)/
	@ln -srf $(DESTDIR)$(sbindir)/fsck.cramfs  $(DESTDIR)$(esbindir)/
	@ln -srf $(DESTDIR)$(sbindir)/fsfreeze     $(DESTDIR)$(esbindir)/
	@ln -srf $(DESTDIR)$(sbindir)/fstrim       $(DESTDIR)$(esbindir)/
	@ln -srf $(DESTDIR)$(sbindir)/mkfs         $(DESTDIR)$(esbindir)/
	@ln -srf $(DESTDIR)$(sbindir)/mkfs.cramfs  $(DESTDIR)$(esbindir)/
	@ln -srf $(DESTDIR)$(sbindir)/swaplabel    $(DESTDIR)$(esbindir)/
	@ln -srf $(DESTDIR)$(sbindir)/switch_root  $(DESTDIR)$(esbindir)/
	@ln -srf $(DESTDIR)$(sbindir)/wipefs       $(DESTDIR)$(esbindir)/
	@ln -srf $(DESTDIR)$(sbindir)/zramctl      $(DESTDIR)$(esbindir)/
	@$(MAKECOOKIE)
