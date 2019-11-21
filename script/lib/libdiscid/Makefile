GARNAME = libdiscid
GARVERSION = 0.6.2
CATEGORIES = lib
MASTER_SITES = http://ftp.musicbrainz.org/pub/musicbrainz/libdiscid/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lang/cxx lib/expat devel/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libdiscid.la
	@$(MAKECOOKIE)
