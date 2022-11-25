
GARNAME      = acpid
GARVERSION   = 2.0.32
CATEGORIES   = system
MASTER_SITES = http://downloads.sourceforge.net/project/acpid2/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules

CONFIGURE_ENV = \
	ac_cv_func_malloc_0_nonnull='yes' \
	ac_cv_func_realloc_0_nonnull='yes'

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
