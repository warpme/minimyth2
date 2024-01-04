
GARNAME      = libmusicbrainz
GARVERSION   = 5.1.0
CATEGORIES   = lib
MASTER_SITES = https://github.com/metabrainz/libmusicbrainz/releases/download/release-$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = 16.patch
LICENSE      = GPL2

DEPENDS = lang/c lib/neon lib/libxml2

ifneq ($(DESTIMG),build)
BUILDDEPS = lib/libmusicbrainz5
endif

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS_BUILD =
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DIMPORT_EXECUTABLES=../../build.d/libmusicbrainz-$(GARVERSION)_build/ImportExecutables.cmake

include ../../gar.mk
