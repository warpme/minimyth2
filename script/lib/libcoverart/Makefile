
GARNAME      = libcoverart
GARVERSION   = 1.0.0
CATEGORIES   = lib
MASTER_SITES = https://github.com/metabrainz/libcoverart/releases/download/release-$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = 16.patch
LICENSE      = GPL

ifneq ($(DESTIMG),build)
BUILDDEPS = lib/libcoverart
endif

DEPENDS = lang/c lib/neon lib/jansson

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS_BUILD =
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DIMPORT_EXECUTABLES=../../build.d/libcoverart-$(GARVERSION)_build/ImportExecutables.cmake

include ../../gar.mk

pre-configure:
	@sed -i 's/ -Werror//' $(WORKSRC)/*/CMakeLists.txt
	@$(MAKECOOKIE)

pre-install:
	@cp -f $(WORKBLD)/include/coverart/caa_c.h $(WORKSRC)/include/coverart/
	@$(MAKECOOKIE)
