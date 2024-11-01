
GARNAME      = kmsvnc
# master @25.06.2024
GARVERSION   = 190db24b727e556e234497c1ce38b88cd6668544
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
	-DCMAKE_C_FLAGS='-I$(DESTDIR)$(includedir)/libdrm -Wno-incompatible-pointer-types'

include ../../gar.mk
