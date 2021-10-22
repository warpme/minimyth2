
# Current GA release
ifeq (1,1)
GARNAME      = weston
GARVERSION   = 9.0.0
CATEGORIES   = wayland
MASTER_SITES = https://wayland.freedesktop.org/releases/
PATCHFILES   = $(DISTNAME)-drm-allow-to-continue-without-input-dev.patch
PATCHFILES  += $(DISTNAME)-terminal-add-cwd-and-command.patch
PATCHFILES  += $(DISTNAME)-hack-wayland1.19.patch
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING
endif

# Current master
ifeq (0,1)
GARNAME      = weston
GARVERSION   = 557dea566075f1840562529fd5aa4971d7e76e0d
CATEGORIES   = wayland
MASTER_SITES = https://gitlab.freedesktop.org/wayland/weston/-/archive/$(GARVERSION)/
PATCHFILES  += weston-9.0.0-terminal-add-cwd-and-command.patch
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING
endif

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

clean-all:
	@rm -rf $(DESTDIR)$(libdir)/weston*
	@rm -rf $(DESTDIR)$(libdir)/libweston*
	@rm -rf $(DESTDIR)$(bindir)/weston*
