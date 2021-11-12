
GARNAME      = pjproject
GARVERSION   = 2.11.1
CATEGORIES   = lib
MASTER_SITES = https://github.com/pjsip/pjproject/archive/
DISTFILES    = $(GARVERSION).tar.gz
PATCHFILES   = $(DISTNAME)-fix-cross-compile.patch
LICENSE      = GPL2
DESCRIPTION  = 
define BLURB
endef

DEPENDS   = lang/c lib/portaudio

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--prefix=/usr \
	--enable-shared \
	--disable-opencore-amr \
	--disable-video \
	--disable-sdl \
	--disable-ffmpeg \
	--disable-v4l2 \
	--disable-libwebrtc \
	--enable-resample-dll \
	--with-external-pa \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libpj*.a
	@cp $(WORKSRC)/pjsip-apps/bin/samples/*-linux-gnu/auddemo $(DESTDIR)$(bindir)/auddemo
	@$(MAKECOOKIE)
