
GARNAME      = libftdi1
GARVERSION   = 1.5
CATEGORIES   = lib
MASTER_SITES = https://www.intra2net.com/en/developer/libftdi/download/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.bz2
LICENSE      = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libusb-compat lib/libconfuse

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DCMAKE_STATICLIBS="OFF" \
	-DCMAKE_EXAMPLES="OFF" \

include ../../gar.mk
