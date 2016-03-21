GARNAME = squashfs
GARVERSION = 4.3
CATEGORIES = lib
MASTER_SITES = http://downloads.sourceforge.net/project/$(GARNAME)/$(GARNAME)/$(GARNAME)$(GARVERSION)/
DISTFILES = $(GARNAME)$(GARVERSION).tar.gz
PATCHFILES = $(DISTNAME).patch.gar
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/zlib utils/xz

WORKSRC = $(WORKDIR)/$(GARNAME)$(GARVERSION)

BUILD_SCRIPTS   = $(WORKSRC)/squashfs-tools/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/squashfs-tools/Makefile

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program
