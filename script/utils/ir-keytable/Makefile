GARNAME = v4l-utils
GARVERSION = 0.9.2
CATEGORIES = utils
MASTER_SITES = http://linuxtv.org/downloads/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = \
	$(DISTNAME)-rc_keymaps.patch
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx system/udev

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/utils/keytable/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/utils/keytable/Makefile


CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--enable-nls \
	--disable-rpath \
	--disable-libdvbv5 \
	--disable-libv4l \
	--disable-v4l-utils \
	--disable-qv4l2 \
	--with-gnu-ld \
	--without-jpeg \
	--with-udevdir="$(libdir)/udev"

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
