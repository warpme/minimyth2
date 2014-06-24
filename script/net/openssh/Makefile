GARNAME = openssh
GARVERSION = 6.0p1
CATEGORIES = net
MASTER_SITES  = ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/
MASTER_SITES += ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/old/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-abstract_socket.patch $(DISTNAME).patch
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENCE

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/openssl lib/zlib

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
	--without-rpath \
	--with-ssl-engine \
	--without-pam

include ../../gar.mk

LD         := $(CC)
LDFLAGS    := $(CFLAGS) $(LDFLAGS)

sysconfdir := $(sysconfdir)/ssh

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@rm -f $(WORKSRC)/config.cache
	@echo "ac_cv_have_space_for_dirent_d_name=yes" >> $(WORKSRC)/config.cache
	@$(MAKECOOKIE)
