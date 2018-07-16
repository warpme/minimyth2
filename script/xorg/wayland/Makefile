GARNAME = wayland
GARVERSION = 1.15.0
CATEGORIES = $(CATEGORY)
MASTER_SITES = https://wayland.freedesktop.org/releases/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

#DEPENDS = lang/c \
#	$(CATEGORY)/libX11 \
#	$(CATEGORY)/libXrandr \
#	$(CATEGORY)/libXrender
	
CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-documentation

#--disable-dtd-validation

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libwayland-client.la
	@rm -f $(DESTDIR)$(libdir)/libwayland-cursor.la
	@rm -f $(DESTDIR)$(libdir)/libwayland-egl.la
	@rm -f $(DESTDIR)$(libdir)/libwayland-server.la
	@$(MAKECOOKIE)

