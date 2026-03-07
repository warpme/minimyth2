
GARNAME      = elogind
GARVERSION   = 255.22
CATEGORIES   = wayland
MASTER_SITES = https://github.com/elogind/elogind/archive/refs/tags/
DISTFILES    = V$(GARVERSION).tar.gz
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
	-D tests="false" \
	-D slow-tests="false" \
	-D install-tests="false" \
	-D cpp_args="-Wno-error=override-init" \
	-D c_args="-Wno-error=override-init" \

include ../../gar.mk
