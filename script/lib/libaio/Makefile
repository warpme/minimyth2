
GARNAME      = libaio
GARVERSION   = 0.3.112
CATEGORIES   = lib
MASTER_SITES = http://ftp.de.debian.org/debian/pool/main/liba/libaio/
DISTFILES    = $(GARNAME)_$(GARVERSION).orig.tar.xz

LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

include ../../gar.mk

# LTO breaks compilation of LVM2
CFLAGS   := $(filter-out -flto=auto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto=auto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto=auto, $(LDFLAGS))
