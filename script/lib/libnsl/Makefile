
GARNAME      = libnsl
GARVERSION   = 1.2.0
CATEGORIES   = lib
MASTER_SITES = https://github.com/thkukuk/libnsl/archive/
PATCHFILES   = $(DISTNAME)-disable-building-po.patch
DISTFILES    = v$(GARVERSION).tar.gz
SOURCEFILES  = $(GARNAME)-$(GARVERSION)

LICENSE      = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c devel/libtirpc

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libnsl.la
	@$(MAKECOOKIE)

include ../../gar.mk
