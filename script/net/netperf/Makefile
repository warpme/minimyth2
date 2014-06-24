GARNAME = netperf
GARVERSION = 2.4.5
CATEGORIES = utils
MASTER_SITES = ftp://ftp.netperf.org/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = 
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/readline

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

CONFIGURE_ENV = \
	ac_cv_func_setpgrp_void=yes

include ../../gar.mk

