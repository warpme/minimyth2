GARNAME = coreutils
GARVERSION = 8.32
CATEGORIES = utils
MASTER_SITES = https://ftp.gnu.org/gnu/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.xz
PATCHFILES = $(DISTNAME)-sysinfo.patch
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

xDEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-rpath \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_GETTEXTIZE)
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)
