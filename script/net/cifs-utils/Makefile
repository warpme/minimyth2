
GARNAME      = cifs-utils
GARVERSION   = 6.13
CATEGORIES   = net
MASTER_SITES = https://download.samba.org/pub/linux-cifs/cifs-utils/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libcap-ng

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-pie \
	--disable-relro \
	--disable-cifsupcall \
	--disable-cifscreds \
	--disable-cifsidmap \
	--disable-cifsacl \
	--disable-systemd \
	--with-libcap-ng \
	--without-libcap

CONFIGURE_ENV = \
	ac_cv_func_malloc_0_nonnull=yes \
	ac_cv_func_realloc_0_nonnull=yes

include ../../gar.mk

CFLAGS  := $(CFLAGS) -fPIC
LDFLAGS := $(LDFLAGS) -fPIC

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
