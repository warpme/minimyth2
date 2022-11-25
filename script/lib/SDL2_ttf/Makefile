GARNAME = SDL2_ttf
GARVERSION = 2.0.12
CATEGORIES = lib
MASTER_SITES = https://www.libsdl.org/projects/SDL_ttf/release/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-configure.patch

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/freetype lib/SDL2 xorg/xorg

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes="$(DESTDIR)$(includedir)" \
	--x-libraries="$(DESTDIR)$(libdir)" \
	--enable-shared \
	--disable-static \
	--enable-silent-rules \
	--disable-sdltest \
	--with-gnu-ld \
	--with-x

CONFIGURE_ENV = \
	SDL2_CONFIG=$(DESTDIR)$(prefix)/bin-config/sdl2-config

include ../../gar.mk

pre-configure:
	@cd $(WORKSRC) ; rm -rf acinclude
	@cd $(WORKSRC) ; mkdir -p acinclude
	@cd $(WORKSRC) ; rm -f aclocal.m4
	@cd $(WORKSRC) ; touch AUTHORS
	@cd $(WORKSRC) ; touch ChangeLog
	@cd $(WORKSRC) ; touch COPYING
	@cd $(WORKSRC) ; touch INSTALL
	@cd $(WORKSRC) ; touch NEWS
	@cd $(WORKSRC) ; touch README
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libSDL2_ttf.la
	@$(MAKECOOKIE)
