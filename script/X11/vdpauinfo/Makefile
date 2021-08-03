GARNAME = vdpauinfo
GARVERSION = 1.4
CATEGORIES = X11
MASTER_SITES = https://gitlab.freedesktop.org/vdpau/vdpauinfo/-/archive/1.4/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = MIT

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c xorg/xorg X11/libvdpau

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
