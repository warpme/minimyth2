GARNAME = libcap
GARVERSION = 2.24
CATEGORIES = lib
MASTER_SITES = http://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/
DISTFILES = $(DISTNAME).tar.xz
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
