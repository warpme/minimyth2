GARNAME = libdevmapper
GARVERSION = 2.02.98
CATEGORIES = lib
MASTER_SITES = ftp://sources.redhat.com/pub/lvm2/
DISTFILES = $(GARNAME)-$(GARVERSION).tgz

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
