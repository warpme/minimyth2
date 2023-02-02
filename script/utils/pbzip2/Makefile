
GARNAME      = pbzip2
GARVERSION   = 1.1.13
CATEGORIES   = utils
MASTER_SITES = https://launchpad.net/$(GARNAME)/1.1/$(GARVERSION)/+download/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DEPENDS = lang/c utils/bzip2

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp -Rdf $(WORKSRC)/pbzip2 $(DESTDIR)$(bindir)/pbzip2
	@ln -srf $(DESTDIR)$(bindir)/pbzip2 $(DESTDIR)$(bindir)/pbunzip2
	@ln -srf $(DESTDIR)$(bindir)/pbzip2 $(DESTDIR)$(bindir)/pbzcat
	@$(MAKECOOKIE)
