
GARNAME      = htop
GARVERSION   = 3.4.1
CATEGORIES   = utils
MASTER_SITES = https://github.com/htop-dev/htop/archive/
DISTFILES    = $(GARVERSION).tar.gz
PATCHFILES   = 01-show-core-temperatures-a523.patch 02-read-current-cpu-freq-from-cpuinfo-sysfs.patch
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/ncursesw

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
