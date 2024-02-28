
GARNAME      = mpv
# v0.37 21.11.2023
GARVERSION   = 818ce7c51a6b9179307950e919983e0909942098
CATEGORIES   = mediaplayers
MASTER_SITES = https://github.com/mpv-player/mpv/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/mpv-$(GARVERSION)
LICENSE      = GPL2

DESCRIPTION =.
define BLURB
endef

DEPENDS = lang/c lib/alsa-lib lib/ffmpeg6 lib/libass lib/SDL2 xorg/libdrm lib/libplacebo

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \

include ../../gar.mk

post-install:
	@echo '# echo "0xFF" > /sys/module/drm/parameters/debug' > $(DESTDIR)$(bindir)/mpv-drm.sh
	@echo 'mpv --drm-connector=HDMI-A-1 --vo=gpu --gpu-context=drm --hwdec=auto --msg-level=vd=v,vo=v $$1' >> $(DESTDIR)$(bindir)/mpv-drm.sh
	@chmod +x $(DESTDIR)$(bindir)/mpv-drm.sh
	@$(MAKECOOKIE)
