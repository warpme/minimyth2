GARNAME      = perl-RFLibs
GARVERSION   = v2
CATEGORIES   = perl
MASTER_SITES = http://www.ronfrazier.net/mythtv/downloads/
DISTFILES    = RFLibs_$(GARVERSION).tar.gz
PATCHFILES   = RFLibs-$(GARVERSION)-aquos_flush_fix.patch
LICENSE      =

DESCRIPTION = 
define BLURB
endef

DEPENDS = perl/perl perl/perl-Device-SerialPort

WORKSRC = $(WORKDIR)/mnt/mythfe-livingroom/setup-files/scripts

INSTALL_SCRIPTS = RFLibs

GAR_EXTRA_CONF += perl/perl/package-api.mk
include ../../gar.mk

install-RFLibs:
	@mkdir -p $(DESTDIR)$(PERL_sitelib)
	@rm -rf $(DESTDIR)$(PERL_sitelib)/RFLibs
	@mkdir -p $(DESTDIR)$(PERL_sitelib)/RFLibs
	@cp $(WORKSRC)/RFLibs/Aquos.pm $(DESTDIR)$(PERL_sitelib)/RFLibs/Aquos.pm
	@cp $(WORKSRC)/RFLibs/IOSelectBuffered.pm $(DESTDIR)$(PERL_sitelib)/RFLibs/IOSelectBuffered.pm
	@chmod 755 $(DESTDIR)$(PERL_sitelib)/RFLibs
	@chmod 644 $(DESTDIR)$(PERL_sitelib)/RFLibs/*
	@$(MAKECOOKIE)
