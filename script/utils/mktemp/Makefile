GARNAME = mktemp
GARVERSION = 1.6
CATEGORIES = utils
MASTER_SITES  = ftp://ftp.mktemp.org/pub/$(GARNAME)/
MASTER_SITES += ftp://ftp.mktemp.org/pub/$(GARNAME)/OLD/
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
