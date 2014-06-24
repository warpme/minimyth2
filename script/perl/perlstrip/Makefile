GARNAME = perlstrip
GARVERSION =
CATEGORIES = perl
DISTFILES = perlstrip.pl
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = perl/perl perl/perl-Perl-Tidy

DISTNAME = $(GARNAME)

INSTALL_SCRIPTS = custom

include ../../gar.mk

extract-perlstrip.pl:
	@mkdir -p $(WORKSRC)
	@cp -f $(DOWNLOADDIR)/perlstrip.pl $(WORKSRC)/
	@$(MAKECOOKIE)

post-patch:
	@sed -i 's%^#!/usr/bin/perl%#!$(bindir)/perl%' -i $(WORKSRC)/perlstrip.pl
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp -r $(WORKSRC)/perlstrip.pl $(DESTDIR)$(bindir)/perlstrip.pl
	@chmod 755 $(DESTDIR)$(bindir)/perlstrip.pl
	@$(MAKECOOKIE)
