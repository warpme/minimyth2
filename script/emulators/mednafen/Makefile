GARNAME = mednafen
GARVERSION = 0.8.D.3
CATEGORIES = emulators
MASTER_SITES = http://downloads.sourceforge.net/project/mednafen/Mednafen/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = \
	$(DISTNAME)-zlib_1.2.6.patch \
	$(DISTNAME)-autoconf_2.65.patch \
	$(DISTNAME)-automake_1.13.patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx lib/alsa-lib lib/libcdio lib/libsndfile lib/SDL lib/SDL_net

WORKSRC = $(WORKDIR)/$(GARNAME)

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes="$(DESTDIR)$(includedir)" \
	--x-libraries="$(DESTDIR)$(libdir)" \
	--disable-rpath \
	--enable-nls \
	--enable-threads=posix \
	--disable-debugger \
	--disable-cjk-fonts \
	--enable-gb \
	--enable-gba \
	--enable-lynx \
	--enable-nes \
	--enable-ngp \
	--enable-pce \
	--enable-pcfx \
	--enable-sms \
	--enable-wswan \
	--enable-alsa \
	--disable-alsatest \
	--disable-jack \
	--with-gnu-ld \
	--with-x \
	--without-libiconv-prefix \
	--without-libpth-prefix \
	--without-libintl-prefix

CONFIGURE_ENV = \
	SDL_CONFIG=$(DESTDIR)$(prefix)/bin-config/sdl-config

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

pre-configure:
	@cd $(WORKSRC) ; rm -f acinclude.m4
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
