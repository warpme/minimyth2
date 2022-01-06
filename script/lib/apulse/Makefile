
GARNAME      = apulse
# v30.12.2020
GARVERSION   = 6c4ce36bd02189fe4fadd09ac074a4d0d1045d32
CATEGORIES   = lib
MASTER_SITES = https://github.com/i-rinat/apulse/archive/
DISTFILES    = $(DISTNAME).zip
DISTFILES    = $(GARVERSION).zip
LICENSE      = MIT

DEPENDS = lib/alsa-lib gtk/glib

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

include ../../gar.mk
