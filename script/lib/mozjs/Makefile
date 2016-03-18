GARNAME = mozjs
GARVERSION = 17.0.0
CATEGORIES = lib
MASTER_SITES = http://ftp.mozilla.org/pub/mozilla.org/js/
DISTFILES = $(GARNAME)$(GARVERSION).tar.gz

WORKSRC = $(WORKDIR)/$(GARNAME)$(GARVERSION)/js/src
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
