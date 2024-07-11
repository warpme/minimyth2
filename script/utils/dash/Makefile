
GARNAME       = dash
GARVERSION    = 0.5.12
CATEGORIES    = utils
MASTER_SITES  = http://gondor.apana.org.au/~herbert/dash/files/
DISTFILES     = $(DISTNAME).tar.gz
LICENSE       = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

PATCHDIRLEVEL = 0

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--bindir=/bin \
	--with-gnu-ld

include ../../gar.mk
