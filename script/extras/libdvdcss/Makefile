GARNAME = libdvdcss
GARVERSION = 1.2.13
CATEGORIES = extras
MASTER_SITES = http://download.videolan.org/pub/$(GARNAME)/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-doc \
	--with-gnu-ld

include ../../gar.mk
include ../extras.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(extras_libdir)/libdvdcss.la
	@$(MAKECOOKIE)
