
GARNAME      = wayland
GARVERSION   = 1.21.0
CATEGORIES   = $(CATEGORY)
MASTER_SITES = https://gitlab.freedesktop.org/wayland/wayland/-/releases/$(GARVERSION)/downloads/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DEPENDS = lang/c    \
	lib/expat   \
	lib/libxml2 \
	lib/libxslt \
	lib/libffi  \

ifneq ($(DESTIMG),build)
BUILDDEPS += wayland/wayland-core
endif

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS_BUILD = \
	-D documentation="false" \
	-D scanner="true" \

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D documentation="false" \
	-D scanner="false" \

include ../../gar.mk

pre-configure:
ifneq ($(DESTIMG),build)
	@cp -f $(build_DESTDIR)$(build_libdir)/pkgconfig/wayland-scanner.pc $(DESTDIR)$(libdir)/pkgconfig/wayland-scanner.pc
endif
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libwayland-client.la
	@rm -f $(DESTDIR)$(libdir)/libwayland-cursor.la
	@rm -f $(DESTDIR)$(libdir)/libwayland-egl.la
	@rm -f $(DESTDIR)$(libdir)/libwayland-server.la
	@$(MAKECOOKIE)
