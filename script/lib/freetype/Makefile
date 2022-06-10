
GARNAME      = freetype
GARVERSION   = 2.12.1
CATEGORIES   = lib
MASTER_SITES = https://download-mirror.savannah.gnu.org/releases/freetype/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL

DEPENDS = lang/c devel/zlib utils/bzip2

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \

include ../../gar.mk
