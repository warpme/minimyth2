
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
# diederik branch 4.04.2025
GARVERSION   = 2d46d14d33df4132f119f399cdac1c3453896b1d
CATEGORIES   = mediaplayers
MASTER_SITES = https://salsa.debian.org/diederik/mpv/-/archive/$(GARVERSION)/
DISTFILES    = mpv-$(GARVERSION).zip
PATCHFILES   = stop-building-mpv-desktop.patch
PATCHFILES  += 0001-meson-add-detection-logic-for-v4l2request-support.patch
PATCHFILES  += 0002-vo-hwdec-drmprime-add-separate-hwdecs-for-v4l2reques.patch
WORKSRC      = $(WORKDIR)/mpv-$(GARVERSION)
endif

LICENSE      = GPL2

DESCRIPTION =.
define BLURB
endef

DEPENDS = lang/c lib/alsa-lib lib/ffmpeg lib/libass lib/SDL2 xorg/libdrm lib/libplacebo

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D cdda="disabled" \

include ../../gar.mk

post-install:
	@echo '# echo "0xFF" > /sys/module/drm/parameters/debug' > $(DESTDIR)$(bindir)/mpv-drm.sh
	@echo 'mpv --drm-connector=HDMI-A-1 --vo=gpu --gpu-context=drm --hwdec=v4l2request --msg-level=vd=v,vo=v $$1' >> $(DESTDIR)$(bindir)/mpv-drm.sh
	@chmod +x $(DESTDIR)$(bindir)/mpv-drm.sh
	@$(MAKECOOKIE)
