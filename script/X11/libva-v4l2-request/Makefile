
# https://github.com/mxsrc/libva-v4l2
GARNAME      = libva-v4l2-request
GARVERSION   = fb641df37bdb8a3674b091ffd086cac8a34ca945
MASTER_SITES = https://github.com/mxsrc/libva-v4l2/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/libva-v4l2-$(GARVERSION)

LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c X11/libva xorg/xorg X11/libva

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS_BUILD =

MESON_CONFIGURE_ARGS = \
	--buildtype=release \

include ../../gar.mk

post-install:
	@mv $(DESTDIR)$(libdir)/dri/v4l2_drv_video.so $(DESTDIR)$(libdir)/

clean-all:
	@rm -rf $(DESTDIR)$(libdir)/v4l2_drv_video.so
