
GARNAME      = libinih
GARVERSION   = 56
CATEGORIES   = lib
MASTER_SITES = https://github.com/benhoyt/inih/archive/refs/tags/
DISTFILES    = r$(GARVERSION).tar.gz
WORKSRC      = $(WORKDIR)/inih-r$(GARVERSION)
LICENSE      = BSD

DEPENDS = lang/c

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \

include ../../gar.mk
