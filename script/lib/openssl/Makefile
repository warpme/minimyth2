
GARNAME      = openssl
GARVERSION   = 1.1.1k
CATEGORIES   = lib
MASTER_SITES = https://www.openssl.org/source/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = $(GARNAME)

$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c devel/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/Configure
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	--prefix=$(prefix) \
	--libdir=$(patsubst $(prefix)/%,%,$(libdir)) \
	--openssldir=$(sysconfdir)/pki/tls \
	shared \
	zlib \
	$(if $(filter i386,  $(GARCH_FAMILY)),no-asm 386 linux-elf)    \
	$(if $(filter x86_64,$(GARCH_FAMILY)),           linux-x86_64) \
	$(if $(filter arm,   $(GARCH_FAMILY)),           linux-armv4)  \
	$(if $(filter arm64, $(GARCH_FAMILY)),           linux-aarch64)

BUILD_ARGS = \
	CC="$(CC)" \
	AR="$(AR) r" \
	RANLIB="$(RANLIB)" \
	depend all build-shared

include ../../gar.mk

configure-%/Configure: 
	@echo " ==> Running Configure in $*"
	@cd $* && $(CONFIGURE_ENV) ./Configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC); $(MAKE) depend
	@cd $(WORKSRC); $(MAKE)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libcrypto.a
	@rm -f $(DESTDIR)$(libdir)/libssl.a
	@chmod u+w $(DESTDIR)$(libdir)/libcrypto.so.*
	@chmod u+w $(DESTDIR)$(libdir)/libssl.so.*
	@$(MAKECOOKIE)
