
GARNAME      = curl
GARVERSION   = 8.7.1
CATEGORIES   = net
MASTER_SITES = https://curl.haxx.se/download/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/openssl devel/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-debug \
	--enable-optimize \
	--enable-warnings \
	--disable-curldebug \
	--enable-symbol-hiding \
	--disable-ares \
	--enable-largefile \
	--enable-shared \
	--enable-static \
	--enable-http \
	--enable-ftp \
	--enable-file \
	--disable-ldap \
	--disable-ldaps \
	--disable-rtsp \
	--enable-proxy \
	--disable-dict \
	--enable-telnet \
	--enable-tftp \
	--disable-pop3 \
	--disable-imap \
	--disable-smtp \
	--disable-gophper \
	--disable-manual \
	--enable-libgcc \
	--disable-ipv6 \
	--enable-versioned-symbols \
	--enable-threaded-resolver \
	--enable-verbose \
	--disable-sspi \
	--enable-crypto-auth \
	--disable-ntlm-wb \
	--disable-tls-srp \
	--enable-cookies \
	--disable-soname-bump \
	--with-gnu-ld \
	--without-krb4 \
	--without-spnego \
	--without-gssapi \
	--without-winssl \
	--with-ssl \
	--with-zlib \
	--without-egd-socket \
	--with-random="$(rootdir)/dev/urandom" \
	--without-gnutls \
	--without-polarssl \
	--without-nss \
	--with-ca-bundle="$(sysconfdir)/pki/tls/certs/ca-bundle.crt" \
	--without-ca-path \
	--without-libssh2 \
	--without-librtmp \
	--without-winidn \
	--without-libidn \

ifeq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--without-nghttp2 \
	--without-brotli
endif

CONFIGURE_ENV  = \
	ac_cv_path_PKGCONFIG="pkg-config"

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libcurl.la
	@rm -f $(DESTDIR)$(bindir)-config/curl-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)curl-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/curl-config $(DESTDIR)$(bindir)-config/curl-config
	@$(if $(compiler_prefix), ln -s curl-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)curl-config)
	@$(MAKECOOKIE)
