
GARNAME      = kmsvnc
# master @11.08.2023
GARVERSION   = 035ae36dad44bbd0b6a06159b30393b6c309d072
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
