
GARNAME      = elogind
GARVERSION   = 246.9.2
CATEGORIES   = wayland
MASTER_SITES = https://github.com/elogind/elogind/archive/
DISTFILES    = v$(GARVERSION).tar.gz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE.LGPL2.1

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c \
	lib/libcap \
	lib/pam \

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D man="false" \
	-D html="false" \
	-D tests="false" \
	-D slow-tests="false" \
	-D fuzz-tests="false" \
	-D install-tests="false" \

include ../../gar.mk
