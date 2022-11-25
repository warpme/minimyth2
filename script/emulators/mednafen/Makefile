GARNAME = mednafen
GARVERSION = 1.24.1
CATEGORIES = emulators
MASTER_SITES = https://mednafen.github.io/releases/files/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx lib/alsa-lib lib/libsndfile lib/SDL lib/SDL_net

WORKSRC = $(WORKDIR)/$(GARNAME)

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-rpath \
	--enable-nls \
	--enable-threads=posix \
	--disable-debugger \
	--disable-cjk-fonts \
	--disable-fancy-scalers \
	--disable-altivec \
	--enable-gb \
	--enable-gba \
	--enable-lynx \
	--enable-md \
	--enable-nes \
	--enable-ngp \
	--enable-pce \
	--enable-pce-fast \
	--enable-pcfx \
	--enable-psx \
	--enable-sms \
	--enable-snes \
	--enable-vb \
	--enable-wswan \
	--enable-alsa \
	--disable-alsatest \
	--disable-jack \
	--disable-sdltest \
	--with-gnu-ld \
	--without-libiconv-prefix \
	--without-libpth-prefix \
	--without-included-gettext \
	--without-libintl-prefix \
	--with-libsndfile

CONFIGURE_ENV = \
	SDL_CONFIG=$(DESTDIR)$(prefix)/bin-config/sdl-config

include ../../gar.mk

LDFLAGS  := $(LDFLAGS) -fwhole-program

# Mednafen takes ages to link with gcc9.3.0 LTO so turn-off LTO
CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

pre-configure:
	@cd $(WORKSRC) ; rm -f acinclude.m4
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
