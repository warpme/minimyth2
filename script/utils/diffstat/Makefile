GARNAME = diffstat
GARVERSION = 1.61
CATEGORIES = utils
MASTER_SITES = https://invisible-island.net/archives/diffstat/
DISTFILES = $(GARNAME)-$(GARVERSION).tgz
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) \
        --build=$(GARBUILD) \
        --host=$(GARHOST) \
        --prefix="$(prefix)" \

include ../../gar.mk
