
GARNAME      = libass
GARVERSION   = 0.15.1
CATEGORIES   = lib
MASTER_SITES = https://github.com/libass/libass/releases/download/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = ISC

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/fontconfig lib/freetype lib/fribidi

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--disable-test \
	--disable-enca \
	--enable-fontconfig \
	--disable-harfbuzz \
	--disable-silent-rules \
	--with-gnu-ld \

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libass.la
	@$(MAKECOOKIE)
