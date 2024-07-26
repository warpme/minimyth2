
GARNAME      = ddcutil
GARVERSION   = 2.1.4
CATEGORIES   = utils
MASTER_SITES = https://github.com/rockowitz/ddcutil/archive/refs/tags/
DISTFILES    = v$(GARVERSION).tar.gz
LICENSE      = GPL

DEPENDS = lang/c lib/libusb xorg/libdrm

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
