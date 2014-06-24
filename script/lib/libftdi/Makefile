GARNAME = libftdi
GARVERSION = 0.20
CATEGORIES = lib
MASTER_SITES = http://www.intra2net.com/de/produkte/opensource/ftdi/TGZ/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = \
	$(DISTNAME)-automake_1.13.patch \
	$(DISTNAME).patch.gar
LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libusb-compat

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--disable-libftdipp \
	--disable-python-binding \
	--with-gnu-ld \
	--without-examples \
	--without-boost \
	--without-docs

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libftdi.la
	@rm -f $(DESTDIR)$(bindir)-config/libftdi-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)libftdi-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/libftdi-config $(DESTDIR)$(bindir)-config/libftdi-config
	@$(if $(compiler_prefix), ln -s libftdi-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)libftdi-config)
	@$(MAKECOOKIE)
