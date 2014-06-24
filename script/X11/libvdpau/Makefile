GARNAME = libvdpau
GARVERSION = 0.6
CATEGORIES = $(CATEGORY)
MASTER_SITES = http://people.freedesktop.org/~aplattner/vdpau/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx xorg/dri2proto

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
