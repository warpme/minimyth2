
GARNAME             = perl-<module name>
GARVERSION          = <version>
MASTER_SITES        = <URL of sources. Best is to search in https://search.cpan.org and then use link from package page Tools/Downolad>
DEPENDS             = <list of cross-compiled dependency packages required for package build & runtime like i.e.: lang/c lib/slang>
PERL_MODULE_PATCHES = <Lists the patch file names with the $(DISTNAME) prefix removed.>
PERL_MODULE_STYLE   = <Module's installation style. Valid values: 'Makefile.PL' and 'Build.PL' with 'Makefile.PL' being the default.>
PERL_MODULE_SO      = Do installed module contains a shared object. Valid values: 'true' or 'false' with 'false' being the default.>
PERL_NOT_NEEDED     = versions of perl for which this module is not needed, usually due to the module being included in perl.>

include ../../perl/perl/perl-module.mk

CONFIGURE_ARGS += <extra args for configure i.e. --libs="-L$(DESTDIR)$(libdir)">
