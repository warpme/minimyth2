
GARNAME       = openssh
GARVERSION    = 8.6p1
CATEGORIES    = net
MASTER_SITES  = https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/
DISTFILES     = $(DISTNAME).tar.gz
LICENSE       = $(GARNAME)

$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENCE

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/openssl devel/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--disable-strip \
	--disable-lastlog \
	--disable-utmp \
	--disable-utmpx \
	--disable-wtmp \
	--disable-wtmpx \
	--enable-libutil \
	--disable-pututline \
	--disable-pututxline \
	--with-openssl \
	--without-ssh1 \
	--with-stackprotect \
	--with-hardening \
	--without-rpath \
	--with-cflags="$(CFLAGS)" \
	--with-cppflags="$(CPPFLAGS)" \
	--with-ldflags="$(LDFLAGS)" \
	--without-libs \
	--without-Werror \
	--without-solaris-contracts \
	--without-solaris-projects \
	--without-osfsia \
	--without-zlib-version-check \
	--without-ldns \
	--without-libedit \
	--with-pie \
	--with-ssl-engine \
	--without-pam \
	--without-selinux \
	--without-kerberos5 \
	--with-privsep-path=$(localstatedir)/empty

include ../../gar.mk

sysconfdir := $(sysconfdir)/ssh

LD         := $(CC)
LDFLAGS    := $(CFLAGS) $(LDFLAGS)

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@rm -f $(WORKSRC)/config.cache
	@echo "ac_cv_have_space_for_dirent_d_name=yes" >> $(WORKSRC)/config.cache
	@$(MAKECOOKIE)
