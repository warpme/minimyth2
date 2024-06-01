
GARNAME      = btop
GARVERSION   = 1.3.2
CATEGORIES   = utils
MASTER_SITES = https://github.com/aristocratos/btop/archive/refs/tags/
DISTFILES    = v$(GARVERSION).tar.gz
LICENSE      = GPL

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = custom

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

install-custom:
	@cp -f $(WORKSRC)/bin/btop $(DESTDIR)$(bindir)/btop
	@$(MAKECOOKIE)
