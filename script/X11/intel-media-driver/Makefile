
GARNAME      = media-driver-intel-media
GARVERSION   = 22.6.5
CATEGORIES   = X11
MASTER_SITES = https://github.com/intel/media-driver/archive/refs/tags/
DISTFILES    = intel-media-$(GARVERSION).tar.gz
LICENSE      = GPL

DEPENDS = X11/libva X11/intel-gmmlib

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DBYPASS_MEDIA_ULT=yes \
	-DBUILD_KERNELS="ON" \
	-DBUILD_CMRTLIB="OFF" \
	-DENABLE_NONFREE_KERNELS="ON" \
	-DRUN_TEST_SUITE="OFF" \

include ../../gar.mk
