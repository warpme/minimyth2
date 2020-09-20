
GARNAME      = mpv
# master @ 20.09.2020
GARVERSION   = 03047a0169495c3323ecbaf1c7ea8029c082dc2e
CATEGORIES   = mediaplayers
MASTER_SITES = https://github.com/mpv-player/mpv/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/mpv-$(GARVERSION)
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/alsa-lib lib/ffmpeg-git lib/libass lib/SDL2 xorg/libdrm

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
	@cd $(WORKSRC); wget http://www.freehackers.org/~tnagy/release/waf-2.0.9 -O waf; $(build_DESTDIR)$(build_bindir)/python ./bootstrap.py; $(build_DESTDIR)$(build_bindir)/python ./waf configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/python ./waf
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/python ./waf install --destdir=$(DESTDIR)
	@echo 'echo "0xFF" > /sys/module/drm/parameters/debug' > $(DESTDIR)$(bindir)/test-mpv-drm.sh
	@echo 'mpv --drm-connector=HDMI-A-1 --vo=gpu --gpu-context=drm --hwdec=auto $$1' >> $(DESTDIR)$(bindir)/test-mpv-drm.sh
	@chmod +x $(DESTDIR)$(bindir)/test-mpv-drm.sh
	@$(MAKECOOKIE)
