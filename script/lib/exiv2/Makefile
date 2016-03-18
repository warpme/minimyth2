GARNAME = exiv2
GARVERSION = 0.25
CATEGORIES = lib
MASTER_SITES = http://www.exiv2.org/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lang/cxx lib/expat lib/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--disable-rpath \
	--enable-visibility \
	--enable-lensdata \
	--disable-commercial \
	--enable-xmp \
	--with-gnu-ld \
	--with-zlib=$(DESTDIR)$(prefix) \
	--with-expat

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/lib$(GARNAME).la
	@$(MAKECOOKIE)
