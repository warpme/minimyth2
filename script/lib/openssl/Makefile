GARNAME = openssl
GARVERSION = 1.0.1c
CATEGORIES = lib
MASTER_SITES = http://www.openssl.org/source/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME).patch.gar
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/Configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	--prefix=$(prefix) \
	--libdir=$(patsubst $(prefix)/%,%,$(libdir)) \
	--install_prefix=$(DESTDIR) \
	--openssldir=$(sysconfdir)/pki/tls \
	shared \
	no-krb5 \
	zlib \
	no-idea \
	no-mdc2 \
	no-rc5 \
	no-ec \
	no-ecdh \
	no-ecdsa \
	$(if $(filter i386,  $(GARCH_FAMILY)),no-asm 386 linux-elf) \
	$(if $(filter x86_64,$(GARCH_FAMILY)),           linux-x86_64)

BUILD_ARGS = \
	CC="$(CC)" \
	AR="$(AR) r" \
	RANLIB="$(RANLIB)" \
	depend all build-shared

include ../../gar.mk

PARALLELMFLAGS := -j1

configure-%/Configure: 
	@echo " ==> Running Configure in $*"
	@cd $* && $(CONFIGURE_ENV) ./Configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libcrypto.a
	@rm -f $(DESTDIR)$(libdir)/libssl.a
	@chmod u+w $(DESTDIR)$(libdir)/libcrypto.so.*
	@chmod u+w $(DESTDIR)$(libdir)/libssl.so.*
	@$(MAKECOOKIE)
