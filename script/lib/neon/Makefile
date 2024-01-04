
GARNAME      = neon
GARVERSION   = 0.32.5
CATEGORIES   = lib
MASTER_SITES = https://notroj.github.io/neon/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL

DEPENDS = data/ca-bundle.crt lib/expat lib/openssl devel/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \
	--disable-tests-install \
	--enable-shared \
	--enable-static \
	--disable-debug \
	--with-ssl=openssl

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libneon.la
	@$(MAKECOOKIE)

clean-all: clean
