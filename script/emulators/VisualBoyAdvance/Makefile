
GARNAME      = visualboyadvance-m
GARVERSION   = 2.1.4
CATEGORIES   = emulators
MASTER_SITES = https://github.com/visualboyadvance-m/visualboyadvance-m/archive/
DISTFILES    = v$(GARVERSION).tar.gz
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lang/cxx lib/libpng lib/SDL2 devel/zlib xorg/xorg
BUILDDEPS = devel/nasm

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DENABLE_SDL="TRUE" \
	-DENABLE_WX="FALSE" \
	-DCMAKE_ENABLE_DEBUGGER="OFF" \

include ../../gar.mk
