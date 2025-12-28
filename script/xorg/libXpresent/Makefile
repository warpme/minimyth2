
GARNAME      = libXpresent
GARVERSION   = 1.0.2
CATEGORIES   = xorg
MASTER_SITES = https://xorg.freedesktop.org/archive/individual/lib/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = MIT

DEPENDS = lang/c xorg/libXfixes xorg/xrandr xorg/libXext xorg/libX11 xorg/xorgproto

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libXpresent.la
	@$(MAKECOOKIE)
