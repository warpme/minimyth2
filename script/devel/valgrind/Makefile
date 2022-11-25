
GARNAME      = valgrind
GARVERSION   = 3.17.0
CATEGORIES   = devel
MASTER_SITES = https://sourceware.org/pub/valgrind/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = GPL

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c 

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	$(if $(filter x86_64,$(GARCH_FAMILY)),--enable-only64bit) \

include ../../gar.mk
