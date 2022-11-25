GARNAME = xz
GARVERSION = 5.2.3
CATEGORIES = utils
MASTER_SITES = http://tukaani.org/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = xz/Public_Domain/GPL2/LGPL2_1
xz_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-shared \
	--disable-static \
	--enable-nls \
	--disable-rpath \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_GETTEXTIZE)
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/liblzma.la
	@$(MAKECOOKIE)
