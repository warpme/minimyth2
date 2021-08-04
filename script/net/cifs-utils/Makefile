
GARNAME      = cifs-utils
GARVERSION   = 6.13
CATEGORIES   = net
MASTER_SITES = https://download.samba.org/pub/linux-cifs/cifs-utils/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libcap

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

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
