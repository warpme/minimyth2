GARNAME = libirman
GARVERSION = 0.5.2
CATEGORIES = lib
MASTER_SITES = https://downloads.sourceforge.net/libirman/
DISTFILES = $(DISTNAME).tar.gz
#PATCHFILES = \
#	$(DISTNAME)-automake_1.13.patch
LICENSE = GPL2/LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--disable-swtest \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@cp $(WORKSRC)/test_io   $(DESTDIR)/$(bindir)
	@cp $(WORKSRC)/test_name $(DESTDIR)/$(bindir)
	@cp $(WORKSRC)/test_func $(DESTDIR)/$(bindir)
	@rm -f $(DESTDIR)$(libdir)/libirman.la
	@$(MAKECOOKIE)
