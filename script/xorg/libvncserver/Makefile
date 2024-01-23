
GARNAME      = libvncserver-LibVNCServer
GARVERSION   = 0.9.14
CATEGORIES   = $(CATEGORY)
MASTER_SITES = https://github.com/LibVNC/libvncserver/archive/
DISTFILES    = LibVNCServer-$(GARVERSION).tar.gz
LICENSE      = GPL2
DESCRIPTION  = 

define BLURB
endef

DEPENDS = lang/c lib/libpng lib/libjpeg lib/libgcrypt lib/libnsl

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

include ../../gar.mk
