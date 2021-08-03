
GARNAME      = lighttpd
GARVERSION   = 1.4.59
CATEGORIES   = net
MASTER_SITES = http://download.lighttpd.net/lighttpd/releases-1.4.x/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = BSD_3_Clause

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/pcre

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--enable-lfs \
	--disable-ipv6 \
	--disable-extra-warnings \
	--with-gnu-ld \
	--without-mysql \
	--without-ldap \
	--without-attr \
	--without-valgrind \
	--without-libunwind \
	--without-openssl \
	--without-kerberos5 \
	--with-pcre \
	--without-zlib \
	--without-bzip2 \
	--without-fam \
	--without-webdav-props \
	--without-webdav-locks \
	--without-gdbm \
	--without-memcache \
	--without-lua \
	PCRECONFIG="$(build_rootdir)/usr/bin-config/pcre-config"

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/mod_access.la
	@rm -f $(DESTDIR)$(libdir)/mod_accesslog.la
	@rm -f $(DESTDIR)$(libdir)/mod_alias.la
	@rm -f $(DESTDIR)$(libdir)/mod_auth.la
	@rm -f $(DESTDIR)$(libdir)/mod_cgi.la
	@rm -f $(DESTDIR)$(libdir)/mod_cml.la
	@rm -f $(DESTDIR)$(libdir)/mod_compress.la
	@rm -f $(DESTDIR)$(libdir)/mod_dirlisting.la
	@rm -f $(DESTDIR)$(libdir)/mod_evasive.la
	@rm -f $(DESTDIR)$(libdir)/mod_evhost.la
	@rm -f $(DESTDIR)$(libdir)/mod_expire.la
	@rm -f $(DESTDIR)$(libdir)/mod_extforward.la
	@rm -f $(DESTDIR)$(libdir)/mod_fastcgi.la
	@rm -f $(DESTDIR)$(libdir)/mod_flv_streaming.la
	@rm -f $(DESTDIR)$(libdir)/mod_indexfile.la
	@rm -f $(DESTDIR)$(libdir)/mod_magnet.la
	@rm -f $(DESTDIR)$(libdir)/mod_mysql_vhost.la
	@rm -f $(DESTDIR)$(libdir)/mod_proxy.la
	@rm -f $(DESTDIR)$(libdir)/mod_redirect.la
	@rm -f $(DESTDIR)$(libdir)/mod_rewrite.la
	@rm -f $(DESTDIR)$(libdir)/mod_rrdtool.la
	@rm -f $(DESTDIR)$(libdir)/mod_scgi.la
	@rm -f $(DESTDIR)$(libdir)/mod_secdownload.la
	@rm -f $(DESTDIR)$(libdir)/mod_setenv.la
	@rm -f $(DESTDIR)$(libdir)/mod_simple_vhost.la
	@rm -f $(DESTDIR)$(libdir)/mod_ssi.la
	@rm -f $(DESTDIR)$(libdir)/mod_staticfile.la
	@rm -f $(DESTDIR)$(libdir)/mod_status.la
	@rm -f $(DESTDIR)$(libdir)/mod_trigger_b4_dl.la
	@rm -f $(DESTDIR)$(libdir)/mod_userdir.la
	@rm -f $(DESTDIR)$(libdir)/mod_usertrack.la
	@rm -f $(DESTDIR)$(libdir)/mod_webdav.la
	@$(MAKECOOKIE)
