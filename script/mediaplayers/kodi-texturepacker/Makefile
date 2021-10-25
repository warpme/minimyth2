
GARNAME      = kodi-texturepacker
GARVERSION   = 19.2-Matrix
CATEGORIES   = mediaplayers
MASTER_SITES = https://github.com/xbmc/xbmc/archive/refs/tags/
DISTFILES    = $(GARVERSION).tar.gz
WORKSRC      = $(WORKDIR)/xbmc-$(GARVERSION)/tools/depends/native/TexturePacker/src

DEPENDS = lib/lzo lib/libpng lib/giflib lib/libjpeg-turbo

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
