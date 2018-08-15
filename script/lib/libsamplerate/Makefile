GARNAME = libsamplerate
GARVERSION = 0.1.9
CATEGORIES = lib
MASTER_SITES = http://www.mega-nerd.com/SRC/
DISTFILES = $(GARNAME)-$(GARVERSION).tar.gz
PATCHFILES = fix-aarch64-detection.patch

LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libsndfile

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@$(MAKECOOKIE)
