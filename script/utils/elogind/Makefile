
GARNAME      = elogind
GARVERSION   = 252.9
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

BUILDDEPS = python3/python-Jinja2

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
