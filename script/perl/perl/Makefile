GARNAME      = perl
GARVERSION   = $(PERL_VERSION)
CATEGORIES   = perl
MASTER_SITES = https://www.cpan.org/src/5.0/
DISTFILES    = $(DISTNAME).tar.gz

PATCHFILES  += $(DISTNAME)-dash.patch
PATCHFILES  += $(DISTNAME)-path.patch
PATCHFILES  += $(DISTNAME)-perl5lib.patch
ifneq ($(DESTIMG),build)
PATCHFILES  += $(DISTNAME)-config_sh-$(GARCH_FAMILY).patch.gar
PATCHFILES  += $(DISTNAME)-cross.patch.gar
else
PATCHFILES  += $(DISTNAME)-cbuilder.patch
PATCHFILES  += $(DISTNAME)-xsloader.patch
PATCHFILES  += $(DISTNAME)-dynaloader.patch
PATCHFILES  += $(DISTNAME)-errno.patch
endif

LICENSE = Artistic

DESCRIPTION = 
define BLURB
endef

DEPENDS    = lang/c lib/gdbm lib/libnsl db/berkeley-db
BUILDDEPS  = utils/bash
ifneq ($(DESTIMG),build)
BUILDDEPS += perl/perl
endif

ifneq ($(DESTIMG),build)
CONFIGURE_SCRIPTS = $(WORKSRC)/configure check-version
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = config $(WORKSRC)/Makefile
else
CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = config $(WORKSRC)/Makefile miniperl generate_uudmap
endif

ifneq ($(DESTIMG),build)
CONFIGURE_ARGS = \
	-e \
	-S
else
CONFIGURE_ARGS = \
	-e \
	-d \
	-Dprefix="$(prefix)" \
	-Dman1dir='$(mandir)/man1' \
	-Dman3dir='$(mandir)/man3' \
	-Dpager='/bin/less -isR' \
	-Darchname="$(GARCH_FAMILY)-linux-thread-multi" \
	-Dusrinc="$(DESTDIR)$(includedir)" \
	-Dlibpth="$(PERL_libpth)" \
	-Dglibpth="$(PERL_libpth)" \
	-Dldlibpthname='none' \
	-Dshrpenv=' ' \
	-Duseshrplib='true' \
	-Dusethreads='true' \
	-Dcpp="$(CPP)" \
	-Dcc="$(CC)" \
	-Dld="$(CC)" \
	-Dar="$(AR)" \
	-Dnm="$(NM)" \
	-Dranlib="$(RANLIB)" \
	-Dccflags="$(CFLAGS)" \
	-Dldflags="$(LDFLAGS)" \
	-Dusethreads \
	-Adefine:cf_by=' ' \
	-Adefine:cf_email=' ' \
	-Adefine:locincpth=' ' \
	-Adefine:loclibpth=' ' \
	-Adefine:mydomain=' ' \
	-Adefine:myhostname=' ' \
	-Adefine:myuname=' ' \
	-Adefine:optimize=' '
endif

CONFIGURE_ENV = $(PERL_CONFIGURE_ENV)
BUILD_ENV     = $(PERL_BUILD_ENV)
INSTALL_ENV   = $(PERL_INSTALL_ENV)

GAR_EXTRA_CONF += devel/gcc/package-api.mk
GAR_EXTRA_CONF += devel/glibc/package-api.mk
GAR_EXTRA_CONF += kernel-$(mm_KERNEL_VERSION)/linux/package-api.mk
include ../../gar.mk

CPPFLAGS := $(PERL_CPPFLAGS)
CFLAGS   := $(PERL_CFLAGS)
CXXFLAGS := $(PERL_CXXFLAGS)
LDFLAGS  := $(PERL_LDFLAGS)

PERL_config_sh_check=$(if $(filter-out $(PERL_config_sh_$(2)),$($(2))), \
	echo "warning: config.sh was generated using $(1) $(PERL_config_sh_$(2)) but you are using $(1) $($(2)).")
PERL_config_sh_var=$(shell cat files/$(DISTNAME)-config_sh-$(GARCH_FAMILY).patch.gar \
	| grep -e "^+$(1)=" | sed -e "s%^+$(1)='\(.*\)'%\1%")
PERL_config_sh_GCC_VERSION=$(call PERL_config_sh_var,gccversion)
PERL_config_sh_GLIBC_VERSION=$(call PERL_config_sh_var,gnulibc_version)
PERL_config_sh_LINUX_VERSION=$(call PERL_config_sh_var,osvers)

PERL_libpth := `$(CC) -print-search-dirs \
	| grep '^libraries' \
	| sed -e 's%^libraries: *%%' -e 's%:% %g' -e 's%=%%g' -e 's%//*%/%g' -e 's%/ % %g' -e 's%/$$%%' \
	| sed -e 's%[^ ]*/lib/gcc/$(GARHOST)[^ ]*%%g'`

pre-configure:
	@echo "fixing perl bin patch in shebang ..."
	@find ./ -type f -exec sed -i 's|#!\/usr\/bin\/perl|#!@GAR_bindir@\/perl|g' {} \;
	@ln -sf Configure $(WORKSRC)/configure
	@$(MAKECOOKIE)

configure-check-version:
	@$(call PERL_config_sh_check,gcc,GCC_VERSION)
	@$(call PERL_config_sh_check,glibc,GLIBC_VERSION)
	@$(call PERL_config_sh_check,linux,LINUX_VERSION)
	@$(MAKECOOKIE)

post-configure:
	@$(BUILD_ENV) $(MAKE) $(PARALLELMFLAGS) $(foreach TTT,$(BUILD_OVERRIDE_DIRS),$(TTT)="$($(TTT))") -C $(WORKSRC) $(BUILD_ARGS) depend
	@for file in `find $(WORKSRC) -name makefile` ; do \
		sed -i 's%^[^:]*: *<command-line>$$%%' $${file} ; \
	 done
	@$(MAKECOOKIE)

pre-install:
	@cd $(DESTDIR)$(libdir) ; rm -f libperl.so

install-config:
	@mkdir -p $(DESTDIR)$(PERL_configdir)
	@cp -f $(WORKSRC)/lib/Config.pm       $(DESTDIR)$(PERL_configdir)
	@cp -f $(WORKSRC)/lib/Config.pod      $(DESTDIR)$(PERL_configdir)
	@cp -f $(WORKSRC)/lib/Config_heavy.pl $(DESTDIR)$(PERL_configdir)
	@$(MAKECOOKIE)

install-miniperl:
	@mkdir -p $(DESTDIR)$(bindir)
	@if test -e $(WORKSRC)/miniperl ; then \
		cp -f $(WORKSRC)/miniperl $(DESTDIR)$(bindir)/perl-miniperl ; \
	fi
	@$(MAKECOOKIE)

install-generate_uudmap:
	@mkdir -p $(DESTDIR)$(bindir)
	@if test -e $(WORKSRC)/generate_uudmap ; then \
		cp -f $(WORKSRC)/generate_uudmap $(DESTDIR)$(bindir)/perl-generate_uudmap ; \
	fi
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(PERL_archlib)/CORE/libperl.a
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)$(bindir)/perl-miniperl
	@rm -f $(DESTDIR)$(bindir)/perl-generate_uudmap
	@rm -f $(DESTDIR)$(bindir)/zipdetails
	@rm -f $(DESTDIR)$(bindir)/xsubpp
	@rm -f $(DESTDIR)$(bindir)/splain
	@rm -f $(DESTDIR)$(bindir)/shasum
	@rm -f $(DESTDIR)$(bindir)/ptargrep
	@rm -f $(DESTDIR)$(bindir)/ptardiff
	@rm -f $(DESTDIR)$(bindir)/ptar
	@rm -f $(DESTDIR)$(bindir)/prove
	@rm -f $(DESTDIR)$(bindir)/podselect
	@rm -f $(DESTDIR)$(bindir)/podchecker
	@rm -f $(DESTDIR)$(bindir)/pod2usage
	@rm -f $(DESTDIR)$(bindir)/pod2text
	@rm -f $(DESTDIR)$(bindir)/pod2man
	@rm -f $(DESTDIR)$(bindir)/pod2html
	@rm -f $(DESTDIR)$(bindir)/pl2pm
	@rm -f $(DESTDIR)$(bindir)/piconv
	@rm -f $(DESTDIR)$(bindir)/perlthanks
	@rm -f $(DESTDIR)$(bindir)/perlivp
	@rm -f $(DESTDIR)$(bindir)/perldoc
	@rm -f $(DESTDIR)$(bindir)/perlbug
	@rm -f $(DESTDIR)$(bindir)/perl*
	@rm -f $(DESTDIR)$(bindir)/libnetcfg
	@rm -f $(DESTDIR)$(bindir)/json_pp
	@rm -f $(DESTDIR)$(bindir)/instmodsh
	@rm -f $(DESTDIR)$(bindir)/h2xs
	@rm -f $(DESTDIR)$(bindir)/h2ph
	@rm -f $(DESTDIR)$(bindir)/encguess
	@rm -f $(DESTDIR)$(bindir)/enc2xs
	@rm -f $(DESTDIR)$(bindir)/cpan
	@rm -f $(DESTDIR)$(bindir)/corelist
	@rm -rf $(DESTDIR)$(libdir)/perl5/$(PERL_VERSION)*
	@rm -rf $(DESTDIR)$(libdir)/perl5/config/$(PERL_VERSION)*
