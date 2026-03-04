
GARNAME      = pacman
GARVERSION   = 7.1.0
CATEGORIES   = miniarch
MASTER_SITES = https://gitlab.archlinux.org/pacman/pacman/-/archive/v$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.bz2
WORKSRC      = $(WORKDIR)/$(GARNAME)-v$(GARVERSION)-5683f8477a0afcc6b331766175a83445b2dcfe89
LICENSE      = GPL

DEPENDS = lib/libarchive

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \

include ../../gar.mk
