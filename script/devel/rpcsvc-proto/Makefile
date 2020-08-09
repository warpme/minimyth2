GARNAME      = rpcsvc-proto
GARVERSION   = 1.4.2
CATEGORIES   = lib
MASTER_SITES = https://github.com/thkukuk/rpcsvc-proto/archive/
DISTFILES    = v$(GARVERSION).tar.gz

LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \

include ../../gar.mk

pre-configure:
	@cd $(WORKSRC); autoreconf -fi
	@$(MAKECOOKIE)
