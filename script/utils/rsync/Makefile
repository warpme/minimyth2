
GARNAME      = rsync
GARVERSION   = 3.2.7
CATEGORIES   = utils
MASTER_SITES = https://download.samba.org/pub/rsync/src/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-simd \
	--disable-xxhash \
	--disable-zstd \
	--disable-lz4 \

include ../../gar.mk

# disable LTO as build with LTO fails on armv7
CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))
