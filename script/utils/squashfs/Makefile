GARNAME = squashfs
GARVERSION = 4.3
CATEGORIES = lib
MASTER_SITES = http://downloads.sourceforge.net/project/$(GARNAME)/$(GARNAME)/$(GARNAME)$(GARVERSION)/
DISTFILES = $(GARNAME)$(GARVERSION).tar.gz
PATCHFILES  = $(DISTNAME).patch.gar
PATCHFILES += $(DISTNAME)-conform-gnu11-and-gnu89-to-fix-i386-compilation.patch
PATCHFILES += $(DISTNAME)-add-sysmacros.patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c devel/zlib utils/xz

WORKSRC = $(WORKDIR)/$(GARNAME)$(GARVERSION)

BUILD_SCRIPTS   = $(WORKSRC)/squashfs-tools/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/squashfs-tools/Makefile

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

