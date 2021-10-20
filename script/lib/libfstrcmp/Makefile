
GARNAME      = fstrcmp
GARVERSION   = 0.7.D001
CATEGORIES   = lib
MASTER_SITES = http://fstrcmp.sourceforge.net/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = switch-to-use-mm2-libtool.patch
LICENSE      = GPL

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

build-custom:
	@echo "Building..."
	$(MAKE) -C $(WORKSRC) all-bin
	@$(MAKECOOKIE)

install-custom:
	@echo "Installing..."
	$(MAKE) -C $(WORKSRC) install-include DESTDIR="$(DESTDIR)" install-libdir
	@$(MAKECOOKIE)

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libfstrcmp.la
	@$(MAKECOOKIE)

