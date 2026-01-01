
GARNAME             = perl-IO-Socket-SSL
GARVERSION          = 2.095
MASTER_SITES        = https://www.cpan.org/authors/id/S/SU/SULLR/
DEPENDS             = perl/perl perl/perl-Net-SSLeay perl/perl-URI
PERL_MODULE_PATCHES = stop-die-on-older-ssl.patch

include ../../perl/perl/perl-module.mk

CONFIGURE_ARGS += --libs="-L$(DESTDIR)$(libdir)"
CONFIGURE_ENV := echo N | $(CONFIGURE_ENV)
