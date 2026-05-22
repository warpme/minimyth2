
GARNAME      = p11-kit
GARVERSION   = 0.26.2
CATEGORIES   = security
MASTER_SITES = https://github.com/p11-glue/p11-kit/releases/download/0.26.2/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = BSD

BUILDDEPS = lang/c lib/libtasn1
DEPENDS = lang/c lib/libffi utils/coreutils lib/nss lib/libtasn1

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D gtk_doc="false" \
	-D man="false" \
	-D nls="false" \
	-D test="false" \
	-D post_install_test="false" \
	-D trust_paths=$(DESTDIR)$(datadir)/ca-certificates/trust-source \

include ../../gar.mk
