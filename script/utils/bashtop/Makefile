
GARNAME      = bashtop
GARVERSION   = 0.8.17
CATEGORIES   = utils
MASTER_SITES = https://github.com/aristocratos/bashtop/archive/
DISTFILES    = v$(GARVERSION).tar.gz
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = utils/bash

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = 
INSTALL_SCRIPTS   = custom

include ../../gar.mk

install-custom:
	@cp $(WORKSRC)/bashtop $(DESTDIR)$(bindir)/
	@$(MAKECOOKIE)
