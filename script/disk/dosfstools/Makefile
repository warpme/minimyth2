
GARNAME      = dosfstools
GARVERSION   = 4.2
CATEGORIES   = utils
MASTER_SITES = https://github.com/$(GARNAME)/$(GARNAME)/releases/download/v$(GARVERSION)/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.gz
LICENSE      = GPL2

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
        --enable-compat-symlinks \

include ../../gar.mk
