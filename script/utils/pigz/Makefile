
GARNAME      = pigz
GARVERSION   = 2.7
CATEGORIES   = utils
MASTER_SITES = https://www.zlib.net/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = use-gar-cc-cflags.patch
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/README

DEPENDS = lang/c devel/zlib

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp -Rdf $(WORKSRC)/pigz $(DESTDIR)$(bindir)/pigz
	@ln -srf $(DESTDIR)$(bindir)/pigz $(DESTDIR)$(bindir)/unpigz
	@$(MAKECOOKIE)
