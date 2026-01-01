
GARNAME             = perl-Net-SSLeay
GARVERSION          = 1.94
MASTER_SITES        = https://cpan.metacpan.org/authors/id/C/CH/CHRISN/
DEPENDS             = lib/openssl
PERL_MODULE_SO      = true

include ../../perl/perl/perl-module.mk

CONFIGURE_ENV := echo N | $(CONFIGURE_ENV)
CONFIGURE_ARGS += --libs="-L$(DESTDIR)$(libdir)"
