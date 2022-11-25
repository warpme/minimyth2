GARNAME = libva-vdpau-driver
GARVERSION = 0.7.4
CATEGORIES = X11
MASTER_SITES = http://www.freedesktop.org/software/vaapi/releases/libva-vdpau-driver/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = \
	$(DISTNAME)-automake_1.13.patch \
	$(DISTNAME)-install.patch \
	$(DISTNAME)-fix_compile.patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c X11/libva X11/libvdpau xorg/xorg

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-glx \
	--disable-debug \
	--disable-tracer \
	--disable-static \
	--enable-shared \
	--enable-silent-rules \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/vdpau_drv_video.la
	@ln -s $(DESTDIR)$(libdir)/vdpau_drv_video.so $(DESTDIR)$(libdir)/r600_drv_video.so
	@$(MAKECOOKIE)
