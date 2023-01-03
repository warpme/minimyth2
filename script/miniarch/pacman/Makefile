
GARNAME      = pacman
GARVERSION   = 6.0.2
CATEGORIES   = miniarch
MASTER_SITES = https://gitlab.archlinux.org/pacman/pacman/-/archive/v$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.bz2
WORKSRC      = $(WORKDIR)/$(GARNAME)-v$(GARVERSION)-c2d4568d35173f92c17b6b93222bc101a63c9928
LICENSE      = GPL

DEPENDS = lib/libarchive

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \

include ../../gar.mk
