GARNAME = ethtool
GARVERSION = 4.0
CATEGORIES = utils
MASTER_SITES = https://www.kernel.org/pub/software/network/ethtool/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(MAKECOOKIE)
