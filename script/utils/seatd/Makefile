
GARNAME      = seatd
GARVERSION   = 0.6.3
CATEGORIES   = utils
MASTER_SITES = https://git.sr.ht/~kennylevinsen/seatd/archive/
DISTFILES    = $(GARVERSION).tar.gz
LICENSE      = MIT

DEPENDS = utils/elogind

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D man-pages="disabled" \
	-D examples="disabled" \
	-D server="enabled" \
	-D libseat-logind="elogind" \

include ../../gar.mk
