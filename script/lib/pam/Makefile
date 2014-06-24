GARNAME = Linux-PAM
GARVERSION = 1.1.8
CATEGORIES = lib
MASTER_SITES = http://fedorahosted.org/releases/l/i/linux-pam/
DISTFILES = $(GARNAME)-$(GARVERSION).tar.bz2

LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/flex

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

include ../../gar.mk

post-install:
	@cp -rf $(WORKSRC)/libpam/include/security $(DESTDIR)$(includedir)/
	@$(MAKECOOKIE)
