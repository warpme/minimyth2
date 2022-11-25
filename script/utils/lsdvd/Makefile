GARNAME = lsdvd
GARVERSION = 0.17
CATEGORIES = utils
MASTER_SITES = http://downloads.sourceforge.net/project/$(GARNAME)/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/libdvdread

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
