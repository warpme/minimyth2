
GARNAME      = nettle
GARVERSION   = 3.10
CATEGORIES   = lib
MASTER_SITES = https://ftp.gnu.org/gnu/nettle/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c devel/gmp

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@$(MAKECOOKIE)
