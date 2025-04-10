
GARNAME      = mc
GARVERSION   = 4.8.33
CATEGORIES   = utils
MASTER_SITES = https://github.com/MidnightCommander/mc/archive/refs/tags/
DISTFILES    = $(GARVERSION).tar.gz
PATCHFILES   = stop-building-po.patch
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/slang

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \
	--enable-background \
	--disable-charset \
	--disable-nls \
	--with-screen=slang \
	--without-x \
	--without-gpm-mouse \
	--disable-dependency-tracking \
	--disable-doxygen-doc \
	--disable-doxygen-dot \
	--disable-doxygen-man \
	--disable-doxygen-rtf \
	--disable-doxygen-xml \
	--disable-doxygen-chm \
	--disable-doxygen-html \
	--disable-doxygen-ps \
	--disable-doxygen-pdf \

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
