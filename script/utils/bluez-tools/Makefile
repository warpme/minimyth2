
GARNAME      = bluez-tools
# master @25.10.2020
GARVERSION   = f65321736475429316f07ee94ec0deac8e46ec4a
CATEGORIES   = utils
MASTER_SITES = https://github.com/khvzak/bluez-tools/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/bluez-tools-$(GARVERSION)
LICENSE      = GPL

DEPENDS = lib/bluez

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
