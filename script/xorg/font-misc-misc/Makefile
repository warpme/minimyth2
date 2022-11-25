GARNAME = font-misc-misc
GARVERSION = 1.1.2
CATEGORIES = $(CATEGORY)
MASTER_SITES = $(XORG_MASTER_SITES)
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = $(DISTNAME)-destdir.patch
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c \
	$(CATEGORY)/font-util \
	$(CATEGORY)/util-macros
BUILDDEPS = \
	$(CATEGORY)/bdftopcf \
	$(CATEGORY)/font-util \
	$(CATEGORY)/mkfontdir \
	$(CATEGORY)/mkfontscale


CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-iso8859-1 \
	--disable-iso8859-2 \
	--disable-iso8859-3 \
	--disable-iso8859-4 \
	--disable-iso8859-5 \
	--disable-iso8859-7 \
	--disable-iso8859-8 \
	--disable-iso8859-9 \
	--disable-iso8859-10 \
	--disable-iso8859-11 \
	--disable-iso8859-13 \
	--disable-iso8859-14 \
	--disable-iso8859-15 \
	--disable-iso8859-16 \
	--disable-koi8-r \
	--disable-jisx0201

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(MAKECOOKIE)
