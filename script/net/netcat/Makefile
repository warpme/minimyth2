GARNAME = netcat
GARVERSION = 0.7.1
CATEGORIES = net
MASTER_SITES = http://garr.dl.sourceforge.net/sourceforge/netcat/
DISTFILES = $(GARNAME)-$(GARVERSION).tar.bz2

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
