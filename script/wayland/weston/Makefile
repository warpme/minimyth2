
GARNAME      = weston
GARVERSION   = 13.0.0
CATEGORIES   = wayland
MASTER_SITES = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(GARVERSION)/downloads/
PATCHFILES  += $(DISTNAME)-terminal-add-cwd-and-command.patch
# PATCHFILES  += $(DISTNAME)-ticket798-no-terminal-without-input-devs.patch
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c \
	wayland/wayland-core \
	xorg/libxkbcommon \
	lib/libinput \
	xorg/pixman \
	xorg/libdrm \
	lib/pam \
	gtk/cairo \
	lib/libpng \
	lib/libjpeg-turbo \
	opengl/opengl \
	gtk/pango \
	xorg/libX11 \
	xorg/libxcb \
	lib/dbus \
	xorg/libXcursor \
	utils/seatd \

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D backend-drm="true" \
	-D backend-drm-screencast-vaapi="false" \
	-D backend-headless="false" \
	-D backend-rdp="false" \
	-D backend-vnc="true" \
	-D backend-x11="true" \
	-D backend-pipewire="false" \
	-D backend-default="drm" \
	-D xwayland="true" \
	-D systemd="false" \
	-D remoting="false" \
	-D pipewire="false" \
	-D shell-desktop="true" \
	-D shell-fullscreen="true" \
	-D shell-ivi="false" \
	-D shell-kiosk="true" \
	-D color-management-lcms="false" \
	-D image-webp="false" \
	-D tools="debug,info,terminal" \
	-D demo-clients="false" \
	-D simple-clients="egl,dmabuf-egl" \
	-D wcap-decode="false" \
	-D test-junit-xml="false" \
	-D doc="false" \

include ../../gar.mk

post-install:
	@mv $(DESTDIR)$(datadir)/pkgconfig/libweston-13-protocols.pc $(DESTDIR)$(libdir)/pkgconfig/libweston-13-protocols.pc
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(libdir)/weston*
	@rm -rf $(DESTDIR)$(libexecdir)/weston*
	@rm -rf $(DESTDIR)$(libdir)/libweston*
	@rm -rf $(DESTDIR)$(bindir)/weston*
	@rm -rf $(DESTDIR)$(datadir)/libweston-*
	@rm -rf $(DESTDIR)$(datadir)/wayland-sessions
	@rm -rf $(DESTDIR)$(datadir)/weston
