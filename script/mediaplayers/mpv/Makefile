
ifeq (1,1)
GARNAME      = mpv
# head  27.12.2025
GARVERSION   = d15f34b24eec58034c3c91a197f2b0323e5c86c4
CATEGORIES   = mediaplayers
MASTER_SITES = https://github.com/mpv-player/mpv/archive/
DISTFILES    = $(GARVERSION).zip mpv-v4l2_m2m-drm.sh mpv-v4l2_m2m-x11.sh mpv-v4l2_request-drm.sh mpv-v4l2_request-wayland.sh mpv-v4l2_request-x11.sh
PATCHFILES   = 00-stop-building-mpv-desktop.patch
PATCHFILES  += 01-pull14690-meson-add-detection-logic-for-v4l2request-support.patch
PATCHFILES  += 02-pull14690-vo-hwdec-drmprime-add-separate-hwdecs-for-v4l2request.patch
WORKSRC      = $(WORKDIR)/mpv-$(GARVERSION)
endif

ifeq (0,1)
GARNAME      = mpv
# diederik branch https://salsa.debian.org/diederik/mpv/-/commits/v4l2request-support @15.12.2025
GARVERSION   = e53318aa946dd4af79ec7d4850f3d3cc81439a0f
CATEGORIES   = mediaplayers
MASTER_SITES = https://salsa.debian.org/diederik/mpv/-/archive/$(GARVERSION)/
DISTFILES    = $(GARVERSION).zip mpv-v4l2_m2m-drm.sh mpv-v4l2_m2m-x11.sh mpv-v4l2_request-drm.sh mpv-v4l2_request-wayland.sh mpv-v4l2_request-x11.sh
PATCHFILES   = 00-stop-building-mpv-desktop.patch
WORKSRC      = $(WORKDIR)/mpv-$(GARVERSION)
endif

LICENSE      = GPL2

DESCRIPTION =.
define BLURB
endef

DEPENDS = lang/c lib/alsa-lib lib/ffmpeg8.0-mythtv lib/libass lib/SDL2 xorg/libdrm lib/libplacebo xorg/libXss xorg/libXpresent

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D cdda="disabled" \
	-D x11="enabled" \
	-D egl-x11="enabled" \

include ../../gar.mk

post-install:
	@cp -f $(WORKDIR)/mpv-*.sh $(DESTDIR)$(bindir)/
	@$(MAKECOOKIE)
