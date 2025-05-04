
GARNAME      = squashfs-tools
GARVERSION   = 4.6.1
CATEGORIES   = lib
MASTER_SITES = https://github.com/plougher/squashfs-tools/archive/refs/tags/
DISTFILES    = $(GARVERSION).tar.gz
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c devel/zlib utils/xz

WORKSRC = $(WORKDIR)/$(GARNAME)-$(GARVERSION)

BUILD_SCRIPTS   = $(WORKSRC)/squashfs-tools/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/squashfs-tools/Makefile

include ../../gar.mk

INSTALL_ARGS="INSTALL_PREFIX=$(DESTDIR)$(prefix)"
