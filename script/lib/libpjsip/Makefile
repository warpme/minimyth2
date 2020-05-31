
GARNAME      = pjproject
GARVERSION   = 2.10
CATEGORIES   = lib
MASTER_SITES = http://www.pjsip.org/release/$(GARVERSION)/
DISTFILES    = $(GARVERSION).tar.gz
PATCHFILES   = $(DISTNAME)-fix-cross-compile.patch
PATCHFILES  += $(DISTNAME)-aarch64_detection.patch
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

PARALLELMFLAGS := -j1

include ../../gar.mk

pre-configure:
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libpj*.a
	@cp $(WORKSRC)/pjsip-apps/bin/samples/*-linux-gnu/auddemo $(DESTDIR)$(bindir)/auddemo
	@$(MAKECOOKIE)
