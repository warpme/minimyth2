
GARNAME      = weston
GARVERSION   = 9.0.0
CATEGORIES   = wayland
MASTER_SITES = https://wayland.freedesktop.org/releases/
PATCHFILES   = weston-terminal-add-cwd-and-command.patch
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

CONFIGURE_ARGS = $(DIRPATHS_MESON) \
	--buildtype=release \
	-D backend-drm-screencast-vaapi="false" \
	-D backend-rdp="false" \
	-D backend-x11="true" \
	-D backend-fbdev="false" \
	-D weston-launch="true" \
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

include ../../gar.mk
