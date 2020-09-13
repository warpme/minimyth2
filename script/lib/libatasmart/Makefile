
GARNAME      = libatasmart
# Ver 0.19 has problems with cross-building 
GARVERSION   = 0.18
CATEGORIES   = lib
MASTER_SITES = http://0pointer.de/public/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.gz
PATCHFILES   = add_aarch64_detection.patch

LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

include ../../gar.mk

post-configure:
	@# hack to fix failed build due double pipe in nm commnds
	@sed -e 's%| \\$$global_symbol_pipe%\\$$global_symbol_pipe%g' -i $(WORKSRC)/libtool
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@$(MAKECOOKIE)
