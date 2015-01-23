GARNAME = xwininfo
GARVERSION = 1.1.3
CATEGORIES = X11
# http://xorg.freedesktop.org/archive/individual/app/xwininfo-${pkgver}.tar.bz2
MASTER_SITES = http://xorg.freedesktop.org/archive/individual/app/
DISTFILES = $(DISTNAME).tar.bz2
# PATCHFILES = $(DISTNAME)-c++.patch $(DISTNAME)-makefile.patch
LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/cxx xorg/xorg

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

include ../../gar.mk

#LDFLAGS  := $(LDFLAGS) -fwhole-program

#CXXFLAGS := $(CPPFLAGS) $(CXXFLAGS) $(LDFLAGS)
