
GARNAME      = xmlstarlet
GARVERSION   = 1.6.1
CATEGORIES   = lib
MASTER_SITES = http://sourceforge.net/projects/xmlstar/files/xmlstarlet/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = MIT

DEPENDS = lib/libxslt

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \
	--with-libxslt-prefix=$(DESTDIR)$(prefix) \
	--with-libxml-prefix=$(DESTDIR)$(prefix) \
	--disable-build-docs \

include ../../gar.mk

