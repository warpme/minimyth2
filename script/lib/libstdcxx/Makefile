GARNAME = libstdcxx
GARVERSION = $(GCC_VERSION)
CATEGORIES = lib
LICENSE = LGPL2_1

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/cxx

BUILD_SCRIPTS = custom

GAR_EXTRA_CONF += devel/gcc/package-api.mk
include ../../gar.mk

build-custom:
	@$(MAKE) -C $(GARDIR)/devel/gcc DESTIMG=build install
	@$(MAKECOOKIE)

CROSSIMG = $(DESTIMG)
export CROSSIMG
