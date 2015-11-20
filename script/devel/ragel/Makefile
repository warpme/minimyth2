GARNAME = ragel
GARVERSION = 6.9
CATEGORIES = devel
MASTER_SITES = http://www.colm.net/files/ragel/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL3

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

include ../../gar.mk
