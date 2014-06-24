GARNAME = unifdef
GARVERSION = 1.0
CATEGORIES = utils
MASTER_SITES = http://www.cs.cmu.edu/~ajw/public/dist/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME).patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

include ../../gar.mk

pre-build:
	@make -C $(WORKSRC) clean
	@$(MAKECOOKIE)
