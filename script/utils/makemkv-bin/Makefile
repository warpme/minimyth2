
GARNAME      = makemkv-bin
GARVERSION   = 1.17.6
CATEGORIES   = utils
MASTER_SITES = http://www.makemkv.com/download/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.gz
PATCHFILES   = makemkv-bin-unattended_install.patch makemkv-bin-use-env-arch-to-detect-target.patch
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS   = $(WORKSRC)/Makefile 

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
