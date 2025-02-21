
GARNAME      = pcre2
GARVERSION   = 10.37
CATEGORIES   = lib
MASTER_SITES = https://github.com/PCRE2Project/pcre2/releases/download/$(DISTNAME)/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = BSD

DEPENDS = lib/readline devel/zlib utils/bzip2 utils/bash

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libpcre2*.la
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)pcre2-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/pcre2-config $(DESTDIR)$(bindir)-config/pcre2-config
	@$(if $(compiler_prefix), ln -s pcre2-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)pcre2-config)
	@$(MAKECOOKIE)
