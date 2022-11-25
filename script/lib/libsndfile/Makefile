GARNAME = libsndfile
GARVERSION = 1.0.28
CATEGORIES = lib
MASTER_SITES = http://www.mega-nerd.com/libsndfile/files/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx lib/alsa-lib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-experimental \
	--disable-sqlite \
	--enable-alsa \
	--disable-external-libs \
	--disable-test-coverage \
	--enable-largefile \
	--disable-shave \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libsndfile.la
	@$(MAKECOOKIE)
