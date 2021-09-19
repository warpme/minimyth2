
GARNAME      = pcre2
GARVERSION   = 10.37
CATEGORIES   = lib
MASTER_SITES = https://ftp.pcre.org/pub/pcre/
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
	@$(MAKECOOKIE)
