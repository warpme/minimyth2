GARNAME = slang
GARVERSION = 2.3.0
CATEGORIES = lib
MASTER_SITES = http://www.jedsoft.org/releases/slang/old/
DISTFILES = $(GARNAME)-$(GARVERSION).tar.bz2

LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/pcre devel/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

include ../../gar.mk
