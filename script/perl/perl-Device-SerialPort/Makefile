GARNAME             = perl-Device-SerialPort
GARVERSION          = 1.04
MASTER_SITES        = http://www.cpan.org/authors/id/C/CO/COOK/
PERL_MODULE_PATCHES = configure_args.patch
PERL_MODULE_SO      = true

include ../../perl/perl/perl-module.mk

CONFIGURE_ARGS += CONFIGURE_ARGS="$(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)"
