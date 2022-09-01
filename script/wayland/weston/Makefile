
GARNAME      = weston
GARVERSION   = 10.0.2
CATEGORIES   = wayland
MASTER_SITES = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(GARVERSION)/downloads/
PATCHFILES  += $(DISTNAME)-terminal-add-cwd-and-command.patch
PATCHFILES  += $(DISTNAME)-ticket798-no-terminal-without-input-devs.patch
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

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D backend-drm-screencast-vaapi="false" \
	-D backend-rdp="false" \
	-D backend-x11="true" \
	-D xwayland="true" \
	-D systemd="false" \
	-D remoting="false" \
	-D pipewire="false" \
	-D shell-ivi="false" \
	-D color-management-lcms="false" \
	-D color-management-colord="false" \
	-D image-webp="false" \
	-D tools="debug,info,terminal" \
	-D demo-clients="false" \
	-D simple-clients="egl,dmabuf-egl" \
	-D launcher-logind="false" \
	-D deprecated-weston-launch="true" \
	-D deprecated-wl-shell="true" \

include ../../gar.mk

clean-all:
	@rm -rf $(DESTDIR)$(libdir)/weston*
	@rm -rf $(DESTDIR)$(libexecdir)/weston*
	@rm -rf $(DESTDIR)$(libdir)/libweston*
	@rm -rf $(DESTDIR)$(bindir)/weston*
	@rm -rf $(DESTDIR)$(datadir)/libweston-*
	@rm -rf $(DESTDIR)$(datadir)/wayland-sessions
	@rm -rf $(DESTDIR)$(datadir)/weston
