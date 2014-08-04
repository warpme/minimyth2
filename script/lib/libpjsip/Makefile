GARNAME = pjproject
# GARVERSION = 2.2.1
GARVERSION = svn-4883
CATEGORIES = lib
MASTER_SITES = http://www.pjsip.org/release/$(GARVERSION)
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = GPL2

DESCRIPTION = 
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
  --enable-resample-dll \
  --with-external-pa

include ../../gar.mk

CFLAGS   := $(filter-out -O%, $(CFLAGS)) -Os
CXXFLAGS := $(filter-out -O%, $(CXXFLAGS)) -Os
CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))

pre-configure:
	@touch $(WORKSRC)/pjlib/include/pj/config_site.h
	@echo "#undef PJMEDIA_AUDIO_DEV_HAS_PORTAUDIO"    >> $(WORKSRC)/pjlib/include/pj/config_site.h
	@echo "#define PJMEDIA_AUDIO_DEV_HAS_PORTAUDIO 0" >> $(WORKSRC)/pjlib/include/pj/config_site.h
	@echo "#undef PJMEDIA_AUDIO_DEV_HAS_ALSA"         >> $(WORKSRC)/pjlib/include/pj/config_site.h
	@echo "#define PJMEDIA_AUDIO_DEV_HAS_ALSA 1"      >> $(WORKSRC)/pjlib/include/pj/config_site.h
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libpj*.a
	@cp $(WORKSRC)/pjsip-apps/bin/samples/x86_64-minimyth-linux-gnu/auddemo $(DESTDIR)$(bindir)/sip-audio-diagnoze
	@$(MAKECOOKIE)
