GARNAME = module-init-tools
GARVERSION = 3.16
CATEGORIES = utils
MASTER_SITES = http://www.kernel.org/pub/linux/utils/kernel/module-init-tools/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = $(DISTNAME)-disable_man.patch
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-static-utils

include ../../gar.mk

bindir  := $(ebindir)
sbindir := $(esbindir)
libdir  := $(elibdir)

LDFLAGS := $(LDFLAGS) -fwhole-program

pre-configure:
	@touch $(WORKSRC)/*.5
	@touch $(WORKSRC)/*.8
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)
