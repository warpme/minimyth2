GARNAME = mktemp
GARVERSION = 1.7
CATEGORIES = utils
MASTER_SITES  = http://www.mktemp.org/mktemp/dist/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = mktemp
mktemp_LICENSE_TEXT=$(WORKSRC)/LICENSE

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

include ../../gar.mk
