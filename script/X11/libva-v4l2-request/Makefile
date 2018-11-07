
# GIT URL: https://github.com/bootlin/libva-v4l2-request

GARNAME      = libva-v4l2-request
# GARVERSION   = master
GARVERSION   = e62c2d1c8e13774a758a093f605f2326ccb3a011
MASTER_SITES = https://github.com/bootlin/libva-v4l2-request/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/libva-v4l2-request-$(GARVERSION)

LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c X11/libva xorg/xorg

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-static \
	--enable-shared \
	--disable-silent-rules \

#	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
#	@rm -f $(DESTDIR)$(libdir)/va/vdpau_drv_video.la
#	@ln -s $(DESTDIR)$(libdir)/va/vdpau_drv_video.so $(DESTDIR)$(libdir)/va/r600_drv_video.so
	@$(MAKECOOKIE)
