
GARNAME      = pkg-config
GARVERSION   = 0.29.2
CATEGORIES   = devel
MASTER_SITES = http://pkgconfig.freedesktop.org/releases/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = fix-builtin-glib-int-conversion.patch fix-gcc15-boolean.patch
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--enable-silent-rules \
	--with-gnu-ld \
	--with-internal-glib

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)
