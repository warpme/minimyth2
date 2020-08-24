GARNAME = popt
GARVERSION = 1.16
CATEGORIES = lib
MASTER_SITES = https://ftp.osuosl.org/pub/rpm/popt/releases/popt-1.x/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = \
	$(DISTNAME)-automake_1.12.patch \
	$(DISTNAME)-disable_tests.patch
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--disable-rpath \
	--with-gnu-ld

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libpopt.la
	@$(MAKECOOKIE)
