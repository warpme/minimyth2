GARNAME = gtk-doc
GARVERSION = 1.18
CATEGORIES = gtk
MASTER_SITES = http://ftp.gnome.org/pub/GNOME/sources/gtk-doc/1.18/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = GPL3

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = gtk-doc.m4

include ../../gar.mk

install-gtk-doc.m4:
	@mkdir -p $(DESTDIR)$(datadir)/aclocal
	@rm -f $(DESTDIR)$(datadir)/aclocal/gtk-doc.m4
	@cp $(WORKSRC)/gtk-doc.m4 $(DESTDIR)$(datadir)/aclocal/gtk-doc.m4
	@$(MAKECOOKIE)
