GARNAME = harfbuzz
GARVERSION = 0.9.12
CATEGORIES = lib
MASTER_SITES = http://www.freedesktop.org/software/harfbuzz/release/
http://www.fontconfig.org/release/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = harfbuzz
harfbuzz_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/cxx gtk/cairo gtk/glib lib/freetype

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libharfbuzz.la
	@$(MAKECOOKIE)
