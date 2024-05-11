
GARNAME      = kmsvnc
# master @29.02.2024
GARVERSION   = 516ecb4121a2379ae962e409f799dcf2a2e5bf52
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

export CFLAGS=-Wno-incompatible-pointer-types

include ../../gar.mk
