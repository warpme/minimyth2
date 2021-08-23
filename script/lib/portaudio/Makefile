
GARNAME      = portaudio
GARVERSION   = 19.7.0
CATEGORIES   = lib
MASTER_SITES = https://github.com/PortAudio/portaudio/archive/refs/tags/
DISTFILES    = v$(GARVERSION).tar.gz
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c devel/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--with-alsa \
	--without-jack \
	--without-oss \
	--without-asihpi \
	--without-winapi \
	--enable-debug-output

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libportaudio.a
	@rm -f $(DESTDIR)$(libdir)/libportaudio.la
	@$(MAKECOOKIE)
