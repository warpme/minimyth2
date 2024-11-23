
GARNAME      = wayland-protocols
GARVERSION   = 1.38
CATEGORIES   = $(CATEGORY)
MASTER_SITES = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(GARVERSION)/downloads/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DEPENDS = wayland/wayland-core

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS_BUILD =

MESON_CONFIGURE_ARGS = \
	--buildtype=release \

include ../../gar.mk

post-install:
	@mv $(DESTDIR)$(datadir)/pkgconfig/wayland-protocols.pc $(DESTDIR)$(libdir)/pkgconfig/wayland-protocols.pc
	@$(MAKECOOKIE)
