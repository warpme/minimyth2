GARNAME = fakeroot
GARVERSION = 1.18.4
CATEGORIES = devel
MASTER_SITES = http://ftp.debian.org/debian/pool/main/f/$(GARNAME)/
DISTFILES = $(GARNAME)_$(GARVERSION).orig.tar.bz2
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure shell
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--with-gnu-ld
BUILD_ARGS     = \
	SUBDIRS="scripts test"
INSTALL_ARGS   = \
	SUBDIRS="scripts test"

include ../../gar.mk

pre-configure:
	@cd $(WORKSRC) ; mkdir -p build-aux
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

configure-shell:
	@$(if $(filter build,$(DESTIMG)), \
		sed -i -e 's%@SHELL@%$(DESTDIR)$(ebindir)/sh%g' $(WORKSRC)/scripts/fakeroot.in , \
		sed -i -e 's%@SHELL@%$(ebindir)/sh%g' $(WORKSRC)/scripts/fakeroot.in \
	)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libfakeroot.la
	@$(MAKECOOKIE)
