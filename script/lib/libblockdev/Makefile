
GARNAME      = libblockdev
GARVERSION   = 3.5.0
CATEGORIES   = lib
MASTER_SITES = https://github.com/storaged-project/libblockdev/archive/refs/tags/
DISTFILES    = $(GARVERSION).tar.gz
WORKSRC      = $(WORKDIR)/$(DISTNAME)
LICENSE      = LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = \
	lang/c \
	disk/dosfstools \
	disk/gptfdisk \
	utils/kmod \
	lib/libbytesize \
	lib/libnvme \
	disk/cryptsetup \
	disk/parted \
	lib/keyutils \
	gtk/json-glib \

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--without-s390 \
	--without-python2 \
	--without-python3 \
	--without-gtk-doc \
	--without-bcache \
	--without-escrow \
	--without-dmraid \
	--without-tools \
	--without-btrfs \
	--without-smart \
	--with-crypto \
	--without-dm \
	--with-loop \
	--without-lvm \
	--without-lvm_dbus \
	--with-mdraid \
	--without-mpath \
	--with-swap \
	--without-kbd \
	--with-part \
	--with-fs \
	--without-nvdimm \
	--without-vdo \

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libbd_loop.la
	@rm -f $(DESTDIR)$(libdir)/libbd_utils.la
	@rm -f $(DESTDIR)$(libdir)/libblockdev.la
	@rm -f $(DESTDIR)$(libdir)/libbd_part.la
	@rm -f $(DESTDIR)$(libdir)/libbd_swap.la
	@rm -f $(DESTDIR)$(libdir)/libbd_mdraid.la
	@rm -f $(DESTDIR)$(libdir)/libbd_nvme.la
	@rm -f $(DESTDIR)$(libdir)/libbd_fs.la
	@rm -f $(DESTDIR)$(libdir)/libbd_crypto.la
	@rm -f $(DESTDIR)$(libdir)/libbd_smart.la
	@rm -f $(DESTDIR)$(libdir)/libbd_smartmontools.la
	@$(MAKECOOKIE)
