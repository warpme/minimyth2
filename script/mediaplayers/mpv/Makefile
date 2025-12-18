
ifeq (0,1)
GARNAME      = mpv
# v0.40 25.03.2025
GARVERSION   = e48ac7ce08462f5e33af6ef9deeac6fa87eef01e
CATEGORIES   = mediaplayers
MASTER_SITES = https://github.com/mpv-player/mpv/archive/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = stop-building-mpv-desktop.patch
WORKSRC      = $(WORKDIR)/mpv-$(GARVERSION)
endif

ifeq (1,1)
GARNAME      = mpv
# diederik branch https://salsa.debian.org/diederik/mpv/-/commits/v4l2request-support @15.12.2025
GARVERSION   = e53318aa946dd4af79ec7d4850f3d3cc81439a0f
CATEGORIES   = mediaplayers
MASTER_SITES = https://salsa.debian.org/diederik/mpv/-/archive/$(GARVERSION)/
DISTFILES    = mpv-$(GARVERSION).zip mpv-v4l2_m2m.sh mpv-v4l2_request.sh
PATCHFILES   = stop-building-mpv-desktop.patch
WORKSRC      = $(WORKDIR)/mpv-$(GARVERSION)
endif

LICENSE      = GPL2

DESCRIPTION =.
define BLURB
endef

DEPENDS = lang/c lib/alsa-lib lib/ffmpeg8.0-mythtv lib/libass lib/SDL2 xorg/libdrm lib/libplacebo

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D cdda="disabled" \

include ../../gar.mk

CFLAGS   := $(filter-out -flto=auto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto=auto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto=auto, $(LDFLAGS))

post-install:
	@cp -f $(WORKDIR)/{mpv-v4l2_m2m.sh,mpv-v4l2_request.sh} $(DESTDIR)$(bindir)/
	@$(MAKECOOKIE)
