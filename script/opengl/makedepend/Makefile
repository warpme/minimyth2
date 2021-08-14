
GARNAME      = makedepend
GARVERSION   = 1.0.6
CATEGORIES   = opengl
MASTER_SITES = https://gitlab.freedesktop.org/xorg/util/makedepend/-/archive/makedepend-1.0.6/
DISTFILES    = makedepend-$(DISTNAME).tar.bz2
WORKSRC      = $(WORKDIR)/makedepend-$(DISTNAME)
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c xorg/xorgproto

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
