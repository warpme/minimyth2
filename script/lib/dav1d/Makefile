
GARNAME      = dav1d
GARVERSION   = 1.0.0
CATEGORIES   = lib
MASTER_SITES = https://code.videolan.org/videolan/dav1d/-/archive/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = BSD

BUILDDEPS = devel/nasm

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-Denable_docs=false \
	-Denable_examples=false \
	-Denable_tests=false \
	-Denable_tools=false \
	-Dtestdata_tests=false

include ../../gar.mk
