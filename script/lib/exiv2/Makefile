GARNAME = exiv2
GARVERSION = 0.25
CATEGORIES = lib
MASTER_SITES = https://github.com/Exiv2/exiv2/archive/v$pkgver.tar.gz
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = add_aarch64_detection.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lang/cxx lib/expat devel/zlib

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
