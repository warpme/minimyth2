
GARNAME      = waylandpp
GARVERSION   = 1.0.0
CATEGORIES   = wayland
MASTER_SITES = https://github.com/NilsBrause/waylandpp/archive/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = fix-building-under-gcc13.patch
LICENSE      = MIT

DEPENDS = wayland/wayland-core lib/pugixml
ifneq ($(DESTIMG),build)
BUILDDEPS += lib/pugixml wayland/waylandpp
endif

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DCMAKE_SYSTEM_NAME="Linux" \
	-DCMAKE_CROSSCOMPILING="ON" \
	-DBUILD_SCANNER="OFF" \
	-DWAYLAND_SCANNERPP="$(build_DESTDIR)$(build_bindir)/wayland-scanner++" \
	-DBUILD_LIBRARIES="ON" \
	-DBUILD_DOCUMENTATION="OFF" \
	-DBUILD_EXAMPLES="OFF"

CMAKE_CONFIGURE_ARGS_BUILD =  \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DBUILD_SCANNER="ON" \
	-DBUILD_LIBRARIES="ON" \
	-DBUILD_DOCUMENTATION="OFF" \
	-DBUILD_EXAMPLES="OFF"

include ../../gar.mk
