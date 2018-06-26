GARNAME = mtdev
GARVERSION = 1.1.5
CATEGORIES = $(CATEGORY)
MASTER_SITES = http://bitmath.org/code/mtdev/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = update_config.sub_to_recognize_aarch64.patch
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --disable-static

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libmtdev.la
	@$(MAKECOOKIE)
