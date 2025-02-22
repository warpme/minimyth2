
GARNAME      = fakeroot
GARVERSION   = 1.34
CATEGORIES   = devel
MASTER_SITES = https://sources.buildroot.net/fakeroot/
DISTFILES    = $(GARNAME)_$(GARVERSION).orig.tar.gz
LICENSE      = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libcap

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
