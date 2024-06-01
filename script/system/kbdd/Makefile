
GARNAME      = kbdd
# v24.04.2021
GARVERSION   = 3145099e1fbbe65b27678be72465aaa5b5872874
CATEGORIES   = system
MASTER_SITES = https://github.com/qnikst/kbdd/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c system/lirc

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

include ../../gar.mk

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \
	--disable-dbus \

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
