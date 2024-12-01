
GARNAME      = makemkv-bin
GARVERSION   = $(MAKEMKV_VERSION)
CATEGORIES   = utils
MASTER_SITES = $(MAKEMKV_MASTER_SITES)
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.gz
PATCHFILES   = makemkv-bin-unattended_install.patch makemkv-bin-use-env-arch-to-detect-target.patch
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c utils/makemkv-oss

INSTALL_SCRIPTS   = $(WORKSRC)/Makefile 

GAR_EXTRA_CONF += utils/makemkv-bin/package-api.mk
include ../../gar.mk

ifeq ($(GARCH),armv7)
export ARCH=armv7l
endif

ifeq ($(GARCH),armv8)
export ARCH=aarch64
endif

ifeq ($(GARCH),i386)
export ARCH=i686
endif

ifeq ($(GARCH),x86-64)
export ARCH=x86_64
endif

clean-all: clean
	@$(MAKE) clean -C ../makemkv-oss
