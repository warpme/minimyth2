GARNAME = cups
GARVERSION = 2.2.1
CATEGORIES = lib
MASTER_SITES = https://github.com/apple/cups/releases/download/v$(GARVERSION)/
DISTFILES = $(DISTNAME)-source.tar.gz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lang/cxx

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static

include ../../gar.mk

CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

post-install:
	@$(MAKECOOKIE)
