GARNAME = xwiimote
GARVERSION = 0.3
CATEGORIES = utils
MASTER_SITES = https://github.com/downloads/dvdhrm/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = \
	$(DISTNAME)-am_prog_ar.patch
LICENSE = BSD_2_Clause

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/ncurses system/eudev

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-debug \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libxwiimote.la
	@$(MAKECOOKIE)
