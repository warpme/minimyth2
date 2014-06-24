GARNAME      = perl-XML-SAX
GARVERSION   = 0.99
MASTER_SITES = http://www.cpan.org/authors/id/G/GR/GRANTM/
DEPENDS      = perl/perl-XML-SAX-Base perl/perl-File-Temp perl/perl-XML-NamespaceSupport

include ../../perl/perl/perl-module.mk

CONFIGURE_ENV := echo Y | $(CONFIGURE_ENV)

post-install:
	@if [ ! -e "$(DESTDIR)$(PERL_sitelib)/XML/SAX/ParserDetails.ini" ] ; then \
		perl -I$(DESTDIR)$(PERL_sitelib) -MXML::SAX -e "XML::SAX->add_parser(q(XML::SAX::PurePerl))->save_parsers()" ; \
	fi
	@$(MAKECOOKIE)
