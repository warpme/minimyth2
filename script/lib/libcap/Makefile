GARNAME = libcap
GARVERSION = 2.22
CATEGORIES = lib
MASTER_SITES = ftp://ftp.archlinux.org/other/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.gz
#PATCHFILES = \
#	$(DISTNAME)-automake_1.13.patch
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

include ../../gar.mk

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--with-gnu-ld \
	--without-debug \
	--with-warn \
	--without-python
