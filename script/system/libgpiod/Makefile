
GARNAME      = libgpiod
GARVERSION   = 2.3.2
CATEGORIES   = system
MASTER_SITES = https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/snapshot/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = 01-stop-building-man.patch
LICENSE      = GPL

DEPENDS = lang/c

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-Ddefault_library=shared \
	-Dtools=enabled \
	-Dgpioset-interactive=disabled \
	-Dtests=disabled \
	-Dexamples=disabled \
	-Dbindings-cxx=enabled \
	-Dbindings-python=enabled \
	-Dbindings-rust=disabled \
	-Dbindings-glib=disabled \
	-Ddbus=disabled \
	-Dintrospection=disabled \
	-Dsystemd=disabled \

include ../../gar.mk
