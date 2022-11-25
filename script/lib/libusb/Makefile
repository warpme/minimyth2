GARNAME = libusb
GARVERSION = 1.0.22
CATEGORIES = lib
MASTER_SITES = http://downloads.sourceforge.net/project/$(GARNAME)/$(GARNAME)-1.0/$(DISTNAME)/
DISTFILES = $(DISTNAME).tar.bz2
#PATCHFILES = \
#	$(DISTNAME)-automake_1.13.patch
LICENSE = LGPL2_1

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
	--enable-timerfd \
	--disable-log \
	--disable-debug-log \
	--disable-examples-build \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@cd $(WORKSRC) ; mkdir -p m4
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libusb-1.0.la
	@$(MAKECOOKIE)
