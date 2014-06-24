GARNAME = libdca
GARVERSION = 0.0.5
CATEGORIES = lib
MASTER_SITES = http://download.videolan.org/pub/videolan/libdca/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = $(DISTNAME)-configure_optimization.patch $(DISTNAME)-configure_c++.patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-debug \
	--enable-shared \
	--disable-static \
	--disable-fixed \
	--disable-double \
	--disable-oss \
	--disable-solaris-audio \
	--disable-al-audio \
	--disable-win \
	--disable-warnings \
	--disable-gprof \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libdca.la
	@rm -f $(DESTDIR)$(libdir)/libdts.a
	@$(if $(wildcard $(DESTDIR)$(libdir)/libdca.a), ln -sf "libdca.a" "$(DESTDIR)$(libdir)/libdts.a")
	@rm -f $(DESTDIR)$(libdir)/libdts.so
	@$(if $(wildcard $(DESTDIR)$(libdir)/libdca.so), ln -sf "libdca.so" "$(DESTDIR)$(libdir)/libdts.so")
	@$(MAKECOOKIE)
