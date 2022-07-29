
GARNAME      = libblockdev
GARVERSION   = 2.27
CATEGORIES   = lib
MASTER_SITES = https://github.com/rhinstaller/libblockdev/archive/
DISTFILES    = $(GARVERSION)-1.tar.gz
WORKSRC      = $(WORKDIR)/$(DISTNAME)-1
LICENSE      = LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c disk/dosfstools disk/gptfdisk utils/kmod lib/libbytesize disk/cryptsetup

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
	@rm -f $(DESTDIR)$(libdir)/libbd_part_err.la
	@rm -f $(DESTDIR)$(libdir)/libbd_part.la
	@rm -f $(DESTDIR)$(libdir)/libbd_swap.la
	@rm -f $(DESTDIR)$(libdir)/libbd_mdraid.la
	@rm -f $(DESTDIR)$(libdir)/libbd_fs.la
	@rm -f $(DESTDIR)$(libdir)/libbd_crypto.la
	@$(MAKECOOKIE)
