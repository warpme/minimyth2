GARNAME        = perl-DBD-mysql
GARVERSION     = 4.051
MASTER_SITES   = https://search.cpan.org/CPAN/authors/id/D/DV/DVEEDEN/
DEPENDS        = perl/perl-DBI perl/perl-Devel-CheckLib
PERL_MODULE_SO = true

include ../../perl/perl/perl-module.mk

CONFIGURE_ARGS += --libs="-L$(DESTDIR)$(libdir)"
