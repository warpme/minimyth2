
GARNAME      = zstd
GARVERSION   = 1.5.0
CATEGORIES   = lib
MASTER_SITES = https://github.com/facebook/zstd/releases/download/v$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
WORKSRC      = $(WORKDIR)/$(GARNAME)-$(GARVERSION)/build/meson
LICENSE      = GPL2

DEPENDS = devel/zlib utils/xz

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

CONFIGURE_ARGS = $(DIRPATHS_MESON) \
	--buildtype=release \
	-D bin_programs=true \
	-D bin_contrib=true \

include ../../gar.mk
