GARNAME = aquosserver
GARVERSION =
CATEGORIES = system
#MASTER_SITES = http://www.ronfrazier.net/mythtv/downloads/
DISTFILES = $(GARNAME)
PATCHFILES = $(GARNAME).patch.gar
LICENSE =

DESCRIPTION =
define BLURB
endef

DEPENDS = perl/perl perl/perl-RFLibs

INSTALL_SCRIPTS = $(GARNAME)

include ../../gar.mk

extract-$(GARNAME):
	@mkdir -p $(WORKSRC)
	@rm -f $(WORKSRC)/$(GARNAME)
	@cp $(DOWNLOADDIR)/$(GARNAME)  $(WORKSRC)/$(GARNAME)
	@chmod 755 $(WORKSRC)/$(GARNAME)
	@$(MAKECOOKIE)

install-$(GARNAME):
	@mkdir -p $(DESTDIR)$(sbindir)
	@cp -f $(WORKSRC)/$(GARNAME) $(DESTDIR)$(sbindir)/$(GARNAME)
	@$(MAKECOOKIE)
