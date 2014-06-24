GARNAME = jzintv
GARVERSION = 1.0-beta3
CATEGORIES = emulators
MASTER_SITES = http://spatula-city.org/~im14u2c/intv/dl/
DISTFILES = $(DISTNAME)-src.zip
PATCHFILES  = $(DISTNAME)-debug_printf.patch $(DISTNAME).patch.gar
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx lib/SDL

BUILD_SCRIPTS   = $(WORKSRC)/src/Makefile
INSTALL_SCRIPTS = custom

BUILD_ENV = \
	EXTRA="$(CFLAGS)" \
	CC_FOR_BUILD="$(build_CC)" \
	CXX_FOR_BUILD="$(build_CXX)" \
	CFLAGS_FOR_BUILD="$(build_CXXFLAGS)"

include ../../gar.mk

CFLAGS   := $(CFLAGS) -lm
CXXFLAGS := $(CXXFLAGS) -lm

LDFLAGS := $(LDFLAGS) -fwhole-program

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp -f $(WORKSRC)/bin/jzintv $(DESTDIR)$(bindir)/jzintv
	@$(MAKECOOKIE)
