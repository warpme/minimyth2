GARNAME = flex
GARVERSION = 2.5.35
CATEGORIES = lib
MASTER_SITES = http://downloads.sourceforge.net/project/$(GARNAME)/$(GARNAME)/$(DISTNAME)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = $(DISTNAME)-perl.patch.gar
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT=$(WORKSRC)/COPYING

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-rpath \
	--with-gnu-ld \
        --cache-file=config.cache
        
include ../../gar.mk
        
post-configure:
	@sed -i 's/#define malloc rpl_malloc/\/\/#define malloc rpl_malloc/' $(WORKSRC)/config.h
	@sed -i 's/#define realloc rpl_realloc/\/\/#define realloc rpl_realloc/' $(WORKSRC)/config.h
	@$(MAKECOOKIE)
