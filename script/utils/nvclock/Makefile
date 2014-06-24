GARNAME = nvclock
GARVERSION = 0.8b4
CATEGORIES = utils
MASTER_SITES = http://www.linuxhardware.org/nvclock
DISTFILES = $(GARNAME)$(GARVERSION).tar.gz
PATCHFILES = \
	$(DISTNAME)-buildfix.patch \
	$(DISTNAME)-linkfix.patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

WORKSRC = $(WORKDIR)/$(GARNAME)$(GARVERSION)

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) \
        --build=$(GARBUILD) \
        --host=$(GARHOST) \
        --prefix="$(prefix)" \
        --sysconfdir="$(sysconfdir)" \
        --libexecdir="$(libexecdir)" \
        --disable-gtk \
        --disable-qt \
        --disable-nvcontrol

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	# @$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
