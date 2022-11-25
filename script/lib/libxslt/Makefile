GARNAME = libxslt
GARVERSION = 1.1.28
CATEGORIES = lib
MASTER_SITES = ftp://xmlsoft.org/libxml2/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = MIT_Modified

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libxml2 devel/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-shared \
	--disable-static \
	--with-gnu-ld \
	--without-crypto \
	--without-python

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libexslt.la
	@rm -f $(DESTDIR)$(libdir)/libxslt.la
	@sed -i 's%-L$(DESTDIR)$(libdir)%-L$${libdir}%g' $(DESTDIR)$(libdir)/pkgconfig/libexslt.pc
	@sed -i 's%-L$(DESTDIR)$(libdir)%-L$${libdir}%g' $(DESTDIR)$(libdir)/pkgconfig/libxslt.pc
	@sed -i 's%-L$${libdir}%-L$(DESTDIR)$${libdir}%g'         $(DESTDIR)$(bindir)/xslt-config
	@sed -i 's%-I$${includedir}%-I$(DESTDIR)$${includedir}%g' $(DESTDIR)$(bindir)/xslt-config
	@sed -i 's%-L${libdir}%-L$(DESTDIR)${libdir}%g'           $(DESTDIR)$(libdir)/xsltConf.sh
	@sed -i 's%-I${includedir}%-I$(DESTDIR)${includedir}%g'   $(DESTDIR)$(libdir)/xsltConf.sh
	@rm -f $(DESTDIR)$(bindir)-config/xslt-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)xslt-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/xslt-config $(DESTDIR)$(bindir)-config/xslt-config
	@$(if $(compiler_prefix), ln -s xslt-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)xslt-config)
	@$(MAKECOOKIE)
