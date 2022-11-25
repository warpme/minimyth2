GARNAME = v4l-utils
GARVERSION = 1.6.3
CATEGORIES = utils
MASTER_SITES = http://linuxtv.org/downloads/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = \
	$(DISTNAME)-rc_keymaps.patch
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx system/eudev

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/utils/keytable/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/utils/keytable/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-doxygen-doc \
	--disable-doxygen-dot \
	--disable-doxygen-man \
	--disable-doxygen-rtf \
	--disable-doxygen-xml \
	--disable-doxygen-chm \
	--disable-doxygen-chi \
	--disable-doxygen-html \
	--disable-doxygen-ps \
	--disable-doxygen-pdf \
	--disable-rpath \
	--disable-libdvbv5 \
	--disable-libv4l \
	--disable-v4l-utils \
	--disable-qv4l2 \
	--with-gnu-ld \
	--without-jpeg \
	--with-gnu-ld \
	--with-udevdir="$(libdir)/udev"

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
