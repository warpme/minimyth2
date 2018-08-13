GARNAME = harfbuzz
GARVERSION = 1.7.5
CATEGORIES = lib
MASTER_SITES = http://www.freedesktop.org/software/harfbuzz/release/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = harfbuzz
harfbuzz_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/cxx gtk/cairo gtk/glib lib/freetype

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--disable-gtk-doc \
	--disable-gtk-doc-html \
	--disable-gtk-doc-pdf \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
# I don't know why but libtool relinking on ARM needs this...
# xxxx - fixme
ifeq ($(DESTIMG),main)
ifeq ($(GARCH_FAMILY),arm)
	@echo "Hack for building on ARM..."
	@ln -sr $(DESTDIR)$(elibdir)/libgcc_s.so $(DESTDIR)$(libdir)/libgcc_s.so
	@ln -sr $(DESTDIR)$(elibdir)/libgcc_s.so.1 $(DESTDIR)$(libdir)/libgcc_s.so.1
endif
endif
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libharfbuzz.la
	@rm -f $(DESTDIR)$(libdir)/libharfbuzz-icu.la
# I don't know why but libtool relinking on ARM needs this...
# xxxx - fixme
	@echo "Deleting hack for building on ARM..."
	@rm -f $(DESTDIR)$(libdir)/libgcc_s.so
	@rm -f $(DESTDIR)$(libdir)/libgcc_s.so.1
	@$(MAKECOOKIE)
