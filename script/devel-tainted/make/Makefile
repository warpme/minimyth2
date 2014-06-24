GARNAME = make
GARVERSION = $(MAKE_VERSION)
CATEGORIES = devel-tainted
SOURCEPKG = devel/make
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-rpath

GAR_EXTRA_CONF += devel/make/package-api.mk
include ../../gar.mk

CPPFLAGS :=
CFLAGS   :=
CXXFLAGS :=
LDFLAGS  :=
