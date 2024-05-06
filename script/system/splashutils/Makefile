
GARNAME      = splashutils
GARVERSION   = 1.5.4.4
CATEGORIES   = system
MASTER_SITES = http://download.berlios.de/fbsplash/
DISTFILES    = $(GARNAME)-lite-$(GARVERSION).tar.bz2
PATCHFILES   = $(DISTNAME)-dash.patch
PATCHFILES  += $(DISTNAME)-fix-gcc9.3.0-build.patch
PATCHFILES  += $(DISTNAME)-fix-compile-on-glibc2.36.patch
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/libjpeg lib/libmng lib/libpng devel/zlib lib/freetype

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--disable-debug \
	--disable-static-binaries \
	--disable-deprecated \
	--enable-fbcondecor \
	--enable-helper \
	--disable-misc \
	--with-gnu-ld \
	--without-gpm \
	--with-mng \
	--with-png \
	--with-ttf \
	--with-ttf-kernel \
	--with-essential-prefix="$(if $(rootdir),$(rootdir),/)" \
	--with-essential-bindir="$(ebindir)" \
	--with-essential-sbindir="$(esbindir)" \
	--with-essential-libdir="$(elibdir)" \
	--with-themedir="$(sysconfdir)/splash" \
	--without-klibc

BUILD_ENV = \
	QUIET=false

include ../../gar.mk

CFLAGS += -Wno-implicit-function-declaration

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)

pre-install:
	@rm -f $(DESTDIR)$(esbindir)/fbcondecor_ctl.static
	@rm -f $(DESTDIR)$(esbindir)/fbsplashd.static
	@rm -f $(DESTDIR)$(esbindir)/splash_util.static
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libfbsplash.la
	@rm -f $(DESTDIR)$(libdir)/libfbsplashrender.la
	@$(MAKECOOKIE)
