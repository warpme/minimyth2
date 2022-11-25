GARNAME = libcdio
GARVERSION = $(LIBCDIO_VERSION)
CATEGORIES = lib
MASTER_SITES = https://ftp.gnu.org/gnu/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = \
	$(DISTNAME)-automake_1.13.patch
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-cxx \
	--disable-cpp-progs \
	--enable-shared \
	--disable-static \
	--enable-joliet \
	--disable-rpath \
	--enable-rock \
	--disable-cddb \
	--disable-vcd-info \
	--without-cd-drive \
	--without-cd-info \
	--without-cdda-player \
	--without-cd-read \
	--without-iso-info \
	--without-iso-read \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libcdio.la
	@rm -f $(DESTDIR)$(libdir)/libcdio++.la
	@rm -f $(DESTDIR)$(libdir)/libiso9660.la
	@rm -f $(DESTDIR)$(libdir)/libiso9660++.la
	@rm -f $(DESTDIR)$(libdir)/libudf.la
	@$(MAKECOOKIE)
