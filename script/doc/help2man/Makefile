GARNAME = help2man
GARVERSION = 1.47.3
CATEGORIES = doc
MASTER_SITES = https://ftp.gnu.org/gnu/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

include ../../gar.mk

pre-configure:
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)
