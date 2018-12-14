GARNAME = mtools
GARVERSION = 4.0.23
CATEGORIES = utils
MASTER_SITES = https://ftp.gnu.org/gnu/mtools/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-rpath \
	--with-gnu-ld \
	ac_cv_func_getpgrp_void=no

include ../../gar.mk

pre-configure:
	@$(call RUN_GETTEXTIZE)
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@cp -f $(WORKSRC)/mtools.conf $(DESTDIR)$(sysconfdir)/mtools.conf
	@echo "mtools_skip_check=1" >> $(DESTDIR)$(sysconfdir)/mtools.conf
	@$(MAKECOOKIE)
