GARNAME = libmad
GARVERSION = 0.15.1b
CATEGORIES = lib
MASTER_SITES = http://downloads.sourceforge.net/project/mad/$(GARNAME)/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = \
	$(DISTNAME)-automake_1.13.patch \
	$(DISTNAME)-gcc_4.5.0.patch \
	$(DISTNAME)-mad_pc.patch
LICENSE = GPL2

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
	--disable-debugging \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@cd $(WORKSRC) ; touch AUTHORS
	@cd $(WORKSRC) ; touch ChangeLog
	@cd $(WORKSRC) ; touch NEWS
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libmad.la
	@$(MAKECOOKIE)
