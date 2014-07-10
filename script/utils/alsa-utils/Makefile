GARNAME = alsa-utils
GARVERSION = 1.0.28
CATEGORIES = utils
MASTER_SITES  = ftp://ftp.alsa-project.org/pub/utils/
MASTER_SITES += ftp://ftp.alsa-project.org/pub/testing/
DISTFILES = $(DISTNAME).tar.bz2
#PATCHFILES = \
#	$(DISTNAME)-automake_1.13.patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/alsa-lib lib/ncursesw system/udev

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-nls \
	--disable-rpath \
	--disable-alsatest \
	--enable-alsamixer \
	--enable-alsaconf \
	--disable-xmlto \
	--disable-nls \
	--enable-largefile \
	--with-gnu-ld \
	--with-udev-rules-dir="$(libdir)/udev/rules.d" \
	--with-curses=ncursesw

include ../../gar.mk

post-patch:
	@cd $(WORKSRC) ; mv acinclude.m4 m4/acinclude.m4
	@$(MAKECOOKIE)

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)
