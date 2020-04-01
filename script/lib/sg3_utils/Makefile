GARNAME = sg3_utils
GARVERSION = 1.45
CATEGORIES = lib
MASTER_SITES = http://sg.danny.cz/sg/p/
DISTFILES = $(GARNAME)-$(GARVERSION).tgz

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

post-install:
	@rm -f $(DESTDIR)$(libdir)/libsgutils2.la
	@$(MAKECOOKIE)