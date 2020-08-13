GARNAME = portaudio
GARVERSION = v190600_20161030
CATEGORIES = lib
MASTER_SITES = http://www.portaudio.com/archives/
DISTFILES  = pa_stable_v190600_20161030.tgz
LICENSE = GPL2
WORKSRC = $(WORKDIR)/$(GARNAME)

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

CPPFLAGS += -fcommon
CFLAGS   += -fcommon

post-install:
	@rm -f $(DESTDIR)$(libdir)/libportaudio.a
	@rm -f $(DESTDIR)$(libdir)/libportaudio.la
	@$(MAKECOOKIE)
