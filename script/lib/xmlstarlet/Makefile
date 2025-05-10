
GARNAME      = xmlstarlet
GARVERSION   = 1.6.1
CATEGORIES   = lib
MASTER_SITES = http://sourceforge.net/projects/xmlstar/files/xmlstarlet/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = xmlstarlet-0001-usage2c.awk-fix-wrong-basename-regexp.patch
PATCHFILES  += xmlstarlet-0246-fix-compile-with-libxml-2-12-0.patch
PATCHFILES  += fix-building-on-gcc15.patch
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
