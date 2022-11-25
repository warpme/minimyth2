GARNAME = xdpyinfo
GARVERSION = 1.3.2
CATEGORIES = $(CATEGORY)
MASTER_SITES = $(XORG_MASTER_SITES)
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	$(CATEGORY)/libX11 \
	$(CATEGORY)/libXext \
	$(CATEGORY)/libXi \
	$(CATEGORY)/libXinerama \
	$(CATEGORY)/libXrender \
	$(CATEGORY)/libXtst \
	$(CATEGORY)/libXxf86vm

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--without-dga \
	--without-xf86misc \
	--with-xinerama \
	--without-dmx \
	--without-xprint

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk
