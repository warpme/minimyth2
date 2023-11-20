
GARNAME      = bluez-alsa
GARVERSION   = f7e6ee596917deb1a3fd2715398cff19203f30af
CATEGORIES   = utils
MASTER_SITES = https://github.com/arkq/bluez-alsa/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      = MIT

DEPENDS = lib/bluez lib/alsa-lib lib/sbc

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \
	--enable-cli \

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
