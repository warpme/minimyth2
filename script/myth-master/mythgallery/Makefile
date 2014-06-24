GARNAME = mythgallery
GARVERSION = $(MYTHTV_GARVERSION)
CATEGORIES = $(CATEGORY)
SOURCEPKG = $(CATEGORY)/mythtv
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	lang/cxx \
	$(CATEGORY)/mythtv \
	lib/libexif \
	lib/libtiff

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

WORKSRC = $(WORKDIR)/mythtv-$(MYTHTV_GARVERSION)

CONFIGURE_SCRIPTS = $(WORKSRC)/mythplugins/configure
BUILD_SCRIPTS     = $(WORKSRC)/mythplugins/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/mythplugins/Makefile

CONFIGURE_ARGS = \
	$(MYTHTV_PLUGINS_CONFIGURE_ARGS) \
	--enable-mythgallery \
		--enable-exif \
		--enable-new-exif \
		--disable-dcraw

CONFIGURE_ENV = $(MYTHTV_CONFIGURE_ENV)
BUILD_ENV     = $(MYTHTV_BUILD_ENV)
INSTALL_ENV   = $(MYTHTV_INSTALL_ENV)

GAR_EXTRA_CONF += $(CATEGORY)/mythtv/package-api.mk
include ../../gar.mk

post-install: post-install-mythtv-version
	@$(MAKECOOKIE)
