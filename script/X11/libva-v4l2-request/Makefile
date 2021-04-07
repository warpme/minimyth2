
GARNAME      = libva-v4l2-request
GARVERSION   = 654e91e30cca86c8bdb6c0a12c9738eaae0006a7
MASTER_SITES = https://github.com/pH5/libva-v4l2-request/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/libva-v4l2-request-$(GARVERSION)

LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c X11/libva xorg/xorg X11/libva

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-static \
	--enable-shared \
	--disable-silent-rules \

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/dri/v4l2_request_drv_video.la
	@mkdir -p $(DESTDIR)$(libdir)
	@mv $(DESTDIR)$(libdir)/dri/v4l2_request_drv_video.so $(DESTDIR)$(libdir)/v4l2_request_drv_video.so

clean-all:
	@rm -rf $(DESTDIR)$(libdir)/v4l2_request_drv_video.so
