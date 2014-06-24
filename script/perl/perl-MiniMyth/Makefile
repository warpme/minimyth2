GARNAME    = perl-MiniMyth
GARVERSION =
CATEGORIES = perl
DISTFILES  = MiniMyth.pm
LICENSE    = Artistic

DESCRIPTION = 
define BLURB
endef

DEPENDS = perl/perl perl/perl-DBD-mysql perl/perl-DBI perl/perl-Net-Telnet perl/perl-WWW-Curl

INSTALL_SCRIPTS = MiniMyth.pm

GAR_EXTRA_CONF += perl/perl/package-api.mk
include ../../gar.mk

extract-MiniMyth.pm:
	@mkdir -p $(WORKSRC)
	@rm -f $(WORKSRC)/MiniMyth.pm
	@cp $(DOWNLOADDIR)/MiniMyth.pm  $(WORKSRC)/MiniMyth.pm
	@chmod 644 $(WORKSRC)/MiniMyth.pm
	@$(MAKECOOKIE)

install-MiniMyth.pm:
	@mkdir -p $(DESTDIR)$(PERL_sitelib)
	@rm -f $(DESTDIR)$(PERL_sitelib)/MiniMyth.pm
	@cp $(WORKSRC)/MiniMyth.pm $(DESTDIR)$(PERL_sitelib)/MiniMyth.pm
	@chmod 644 $(DESTDIR)$(PERL_sitelib)/MiniMyth.pm
	@$(MAKECOOKIE)
