
GARNAME      = mpv
# 0.34.0 @ 02.11.2021
GARVERSION   = 9ca9066d052acecb5b05369141a76993a753ee1e
CATEGORIES   = mediaplayers
MASTER_SITES = https://github.com/mpv-player/mpv/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/mpv-$(GARVERSION)
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/alsa-lib lib/ffmpeg lib/libass lib/SDL2 xorg/libdrm
BUILDDEPS = devel/waf

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

CC=$(compiler_prefix)$(build_CC)
CXX=$(compiler_prefix)$(build_CXX)
PKG_CONFIG_LIBDIR="$(DESTDIR)$(libdir)"
PKG_CONFIG_PATH="$(DESTDIR)$(libdir)/pkgconfig"
export CC
export CXX
export PKG_CONFIG_LIBDIR
export PKG_CONFIG_PATH

CONFIGURE_ARGS = \
	--prefix="$(prefix)" \
	--sysconfdir="$(sysconfdir)" \
	--enable-sdl2 \
	--enable-drm \
	--enable-gbm \
	--enable-egl-drm \
	--disable-debug-build \
	--disable-pdf-build \

include ../../gar.mk

configure-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/python $(build_DESTDIR)$(build_bindir)/waf configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/python $(build_DESTDIR)$(build_bindir)/waf
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/python $(build_DESTDIR)$(build_bindir)/waf install --destdir=$(DESTDIR)
	@echo '# echo "0xFF" > /sys/module/drm/parameters/debug' > $(DESTDIR)$(bindir)/mpv-drm.sh
	@echo 'mpv --drm-connector=HDMI-A-1 --vo=gpu --gpu-context=drm --hwdec=auto $$1' >> $(DESTDIR)$(bindir)/mpv-drm.sh
	@chmod +x $(DESTDIR)$(bindir)/mpv-drm.sh
	@$(MAKECOOKIE)
