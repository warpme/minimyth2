
GARNAME      = netperf
GARVERSION   = 2.7.0
CATEGORIES   = utils
MASTER_SITES = https://github.com/HewlettPackard/netperf/archive/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = add_aarch64_detection.patch
LICENSE      = GPL3

WORKSRC = $(WORKDIR)/$(GARNAME)-$(DISTNAME)

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

CFLAGS += -Wno-implicit-function-declaration -fcommon
