
GARNAME      = libxml2
GARVERSION   = v2.9.14
CATEGORIES   = lib
MASTER_SITES = https://gitlab.gnome.org/GNOME/libxml2/-/archive/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = MIT/MIT_Modified

DESCRIPTION = 
define BLURB
endef

DEPENDS  = lang/c devel/zlib
ifeq ($(DESTIMG),build)
DEPENDS += python2/python
endif

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--with-gnu-ld \
	--with-zlib \
	--without-lzma
ifeq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--with-python
else
CONFIGURE_ARGS += \
	--without-python
endif

include ../../gar.mk

pre-configure:
	@mkdir -p $(WORKSRC)/m4
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libxml2.la
	@sed -i 's%-L$${libdir}%-L$(DESTDIR)$${libdir}%g'         $(DESTDIR)$(bindir)/xml2-config
	@sed -i 's%-I$${includedir}%-I$(DESTDIR)$${includedir}%g' $(DESTDIR)$(bindir)/xml2-config
	@sed -i 's%-L${libdir}%-L$(DESTDIR)${libdir}%g'           $(DESTDIR)$(libdir)/xml2Conf.sh
	@sed -i 's%-I${includedir}%-I$(DESTDIR)${includedir}%g'   $(DESTDIR)$(libdir)/xml2Conf.sh
	@rm -f $(DESTDIR)$(bindir)-config/xml2-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)xml2-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/xml2-config $(DESTDIR)$(bindir)-config/xml2-config
	@$(if $(compiler_prefix), ln -s xml2-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)xml2-config)
	@$(MAKECOOKIE)
