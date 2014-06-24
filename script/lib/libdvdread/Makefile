GARNAME = libdvdread
GARVERSION = 4.2.0
CATEGORIES = lib
MASTER_SITES = http://dvdnav.mplayerhq.hu/releases/
#MASTER_SITES = svn://svn.mplayerhq.hu/dvdnav/trunk/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = $(DISTNAME)-destdir.patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--with-gnu-ld

include ../../gar.mk

svn//%/$(DISTNAME).tar.bz2:
	@$(call FETCH_SVN, svn://$*, $(GARVERSION), $(DISTNAME))
	@$(MAKECOOKIE)

x-checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE)

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libdvdread.la
	@rm -f $(DESTDIR)$(bindir)-config/dvdread-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)dvdread-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/dvdread-config $(DESTDIR)$(bindir)-config/dvdread-config
	@$(if $(compiler_prefix), ln -s dvdread-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)dvdread-config)
	@$(MAKECOOKIE)
