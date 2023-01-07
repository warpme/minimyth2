
GARNAME      = libva
GARVERSION   = 2.17.0
CATEGORIES   = X11
MASTER_SITES = https://github.com/intel/libva/archive/
DISTFILES    = $(GARVERSION).tar.gz
LICENSE      = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx xorg/xorg

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--disable-docs \
	--enable-drm \
	--enable-x11 \
	--enable-glx \
	--enable-egl \
	--enable-wayland \
	--disable-dummy-driver \
	--disable-static \
	--enable-shared \
	--with-drivers-path="$(libdir)" \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@mkdir -p $(WORKSRC)/m4
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libva.la
	@rm -f $(DESTDIR)$(libdir)/libva-drm.la
	@rm -f $(DESTDIR)$(libdir)/libva-glx.la
	@rm -f $(DESTDIR)$(libdir)/libva-tpi.la
	@rm -f $(DESTDIR)$(libdir)/libva-x11.la
	@rm -f $(DESTDIR)$(libdir)/libva-wayland.la
	@$(MAKECOOKIE)
