
GARNAME      = libarchive
GARVERSION   = 3.7.2
CATEGORIES   = lib
MASTER_SITES = https://github.com/$(GARNAME)/$(GARNAME)/releases/download/v$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.xz
WORKSRC      = $(WORKDIR)/$(GARNAME)-$(GARVERSION)
LICENSE      = BSD

DEPENDS = lib/libacl utils/bzip2 lib/expat lib/openssl utils/xz devel/zlib lib/libzstd lib/libiconv

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \
	--without-xml2 \
	--without-nettle \
	--disable-static

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libarchive.la
	@$(MAKECOOKIE)
