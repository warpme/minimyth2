GARNAME = minizip
GARVERSION = 1.2.11
CATEGORIES = lib
MASTER_SITES = http://zlib.net/
DISTFILES  = zlib-$(GARVERSION).tar.xz

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c devel/zlib

WORKSRC = $(WORKDIR)/zlib-$(GARVERSION)/contrib/minizip

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	--prefix=$(prefix) \
	--host=$(GARHOST)

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libminizip.la
	@$(MAKECOOKIE)
