
GARNAME      = libvdpau
GARVERSION   = 1.4
CATEGORIES   = $(CATEGORY)
MASTER_SITES = https://gitlab.freedesktop.org/vdpau/libvdpau/-/archive/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx xorg/xorgproto xorg/libX11 xorg/libXext

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-dri2 \
	--disable-documentation \
	--with-gnu-ld \
	--with-module-dir="$(libdir)/vdpau"

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@rm -f $(DESTDIR)$(libdir)/vdpau/$(GARNAME)_trace.la
	@$(MAKECOOKIE)
