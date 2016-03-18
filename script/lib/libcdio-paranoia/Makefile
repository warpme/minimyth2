GARNAME = libcdio-paranoia
GARVERSION = 10.2+$(LIBCDIO_VERSION)
CATEGORIES = lib
MASTER_SITES = https://ftp.gnu.org/gnu/libcdio/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = \
	$(DISTNAME)-automake_1.13.patch \
	$(DISTNAME)-include_path.patch
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx lib/libcdio

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-cxx \
	--enable-shared \
	--disable-static \
	--with-gnu-ld

GAR_EXTRA_CONF += lib/libcdio/package-api.mk
include ../../gar.mk

post-extract:
	@cd $(WORKSRC)/include/cdio; ln -sf paranoia/cdda.h cdda.h
	@$(MAKECOOKIE)

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libcdio_cdda.la
	@rm -f $(DESTDIR)$(libdir)/libcdio_paranoia.la
	@$(MAKECOOKIE)
