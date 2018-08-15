GARNAME = lzo
GARVERSION = 2.10
CATEGORIES = lib
MASTER_SITES = http://www.oberhumer.com/opensource/lzo/download/
DISTFILES = $(GARNAME)-$(GARVERSION).tar.gz

LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c devel/glibc

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/liblzo2.la
	@$(MAKECOOKIE)
