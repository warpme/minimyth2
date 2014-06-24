GARNAME = ImageMagick
GARVERSION = 6.7.6-9
CATEGORIES = lib
MASTER_SITES = ftp://ftp.imagemagick.org/pub/ImageMagick/
DISTFILES = $(GARNAME)-$(GARVERSION).tar.xz

LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

include ../../gar.mk

#CFLAGS   := $(filter-out -flto -fuse-linker-plugin, $(CFLAGS))
#CXXFLAGS := $(filter-out -flto -fuse-linker-plugin, $(CXXFLAGS))
#LDFLAGS  := $(filter-out -flto -fuse-linker-plugin, $(LDFLAGS))

post-install:
	@$(MAKECOOKIE)
