
GARNAME      = iputils
GARVERSION   = 20210722
CATEGORIES   = net
MASTER_SITES = https://github.com/iputils/iputils/archive/refs/tags/
DISTFILES    = $(GARVERSION).tar.gz
PATCHFILES   = $(DISTNAME)-remove-ping-tests.patch
LICENSE      = BSD_4_Clause

DEPENDS = lang/c lib/libcap net/iproute2

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D BUILD_MANS=false \
	-D BUILD_HTML_MANS=false \

include ../../gar.mk
