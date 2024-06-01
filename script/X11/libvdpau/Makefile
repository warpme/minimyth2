
GARNAME      = libvdpau
GARVERSION   = 1.5
CATEGORIES   = $(CATEGORY)
MASTER_SITES = https://gitlab.freedesktop.org/vdpau/libvdpau/-/archive/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx xorg/xorgproto xorg/libX11 xorg/libXext

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D documentation="false" \
	-D dri2="true" \
	-D moduledir="$(libdir)/vdpau" \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@rm -f $(DESTDIR)$(libdir)/vdpau/$(GARNAME)_trace.la
	@$(MAKECOOKIE)
