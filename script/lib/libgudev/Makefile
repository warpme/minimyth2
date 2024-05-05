
GARNAME      = libgudev
GARVERSION   = 231
CATEGORIES   = lib
MASTER_SITES = https://download.gnome.org/sources/$(GARNAME)/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT=$(WORKSRC)/COPYING

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c system/eudev gtk/glib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--with-gnu-ld \
	--disable-gtk-doc \
	--disable-gtk-doc-html \
	--disable-gtk-doc-pdf \
	--disable-umockdev

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libgudev-1.0.la
	@$(MAKECOOKIE)
