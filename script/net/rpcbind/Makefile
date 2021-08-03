
GARNAME      = rpcbind
GARVERSION   = 1.2.6
CATEGORIES   = net
MASTER_SITES = http://downloads.sourceforge.net/project/$(GARNAME)/$(GARNAME)/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = BSD_3_Clause

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c devel/glibc-rpcsvc net/libtirpc

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-debug \
	--disable-warmstarts \
	--disable-libwrap \
	--with-rpcuser=rpc \
	--without-systemdsystemunitdir

include ../../gar.mk

LDFLAGS := $(LDFLAGS) -fwhole-program

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
