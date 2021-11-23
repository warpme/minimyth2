
GARNAME      = kodi-jsonschemabuilder
GARVERSION   = $(KODI_VERSION)
MASTER_SITES = $(KODI_MASTER_SITES)
CATEGORIES   = mediaplayers
DISTFILES    = $(GARVERSION).tar.gz
WORKSRC      = $(WORKDIR)/xbmc-$(GARVERSION)/tools/depends/native/JsonSchemaBuilder/src

DEPENDS = 

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

GAR_EXTRA_CONF += mediaplayers/kodi/package-api.mk
include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
