
GARNAME      = usbutils
GARVERSION   = 018
CATEGORIES   = utils
MASTER_SITES = https://www.kernel.org/pub/linux/utils/usb/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL2

DEPENDS = lang/c data/hwdata


CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D c_link_args="-liconv" \

include ../../gar.mk
