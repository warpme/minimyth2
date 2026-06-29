
GARNAME      = libnvme
GARVERSION   = 1.16.2
CATEGORIES   = lib
MASTER_SITES = https://github.com/linux-nvme/libnvme/archive/refs/tags/
DISTFILES    = v$(GARVERSION).tar.gz
LICENSE      = GPL

DEPENDS = lang/c lib/dbus lib/libjson-c lib/keyutils lib/openssl

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D examples="false" \

include ../../gar.mk
