
GARNAME      = neatvnc
GARVERSION   = 0.4.0
CATEGORIES   = lib
MASTER_SITES = https://github.com/any1/neatvnc/archive/
DISTFILES    = v$(GARVERSION).tar.gz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/aml xorg/pixman lib/libjpeg-turbo

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \

include ../../gar.mk
