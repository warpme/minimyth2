
GARNAME      = kmsvnc
# master @13.09.2023
GARVERSION   = 843d79cb643234b9ea3c4f758edd355d76c9d3d8
CATEGORIES   = utils
MASTER_SITES = https://github.com/isjerryxiao/kmsvnc/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      = GPL2

DEPENDS = xorg/libvncserver xorg/libxkbcommon xorg/libdrm X11/libva

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

include ../../gar.mk
