GARNAME = fceux
GARVERSION = 2.2.3
CATEGORIES = emulators
MASTER_SITES = http://sourceforge.net/projects/fceultra/files/Source%20Code/2.2.3%20src/
DISTFILES = $(DISTNAME).src.tar.gz
#PATCHFILES = \
#	$(DISTNAME)-zlib_1.2.6.patch \
#	$(DISTNAME)-fixes.patch \
#	$(DISTNAME)-sdl_sound.patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/SDL

#WORKSRC = $(WORKDIR)/$(GARNAME)

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-sdltest \
	--without-debugger \
	--without-nativewin32 \
	--with-opengl

CONFIGURE_ENV = \
	SDL_CONFIG=$(DESTDIR)$(prefix)/bin-config/sdl-config

include ../../gar.mk

CFLAGS  := $(CFLAGS) -lm

LDFLAGS := $(LDFLAGS) -fwhole-program

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(MAKECOOKIE)
