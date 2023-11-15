
GARNAME      = sbc
GARVERSION   = 8dc5d5ba381512ad5b1afa45c63ec6b0a3833244
CATEGORIES   = lib
MASTER_SITES = https://kernel.googlesource.com/pub/scm/bluetooth/sbc.git/+archive/
DISTFILES    = $(GARVERSION).tar.gz
WORKSRC      = $(WORKDIR)
LICENSE      = GPL

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

pre-configure:
	@cd $(WORKSRC) ; autoreconf -fvi
	@$(MAKECOOKIE)
