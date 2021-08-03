
GARNAME      = swig
GARVERSION   = 4.0.2
CATEGORIES   = lib
MASTER_SITES = https://downloads.sourceforge.net/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.gz
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \

include ../../gar.mk