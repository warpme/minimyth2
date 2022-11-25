GARNAME = font-cursor-misc
GARVERSION = 1.0.3
CATEGORIES = $(CATEGORY)
MASTER_SITES = $(XORG_MASTER_SITES)
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c \
	$(CATEGORY)/font-util \
	$(CATEGORY)/util-macros
BUILDDEPS = \
	$(CATEGORY)/bdftopcf \
	$(CATEGORY)/mkfontdir \
	$(CATEGORY)/mkfontscale


CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(MAKECOOKIE)
