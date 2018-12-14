GARNAME = pseudo
GARVERSION = 1.9.0
CATEGORIES = utils
MASTER_SITES = http://git.yoctoproject.org/cgit/cgit.cgi/pseudo/snapshot/
DISTFILES = $(GARNAME)-$(GARVERSION).tar.bz2
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
