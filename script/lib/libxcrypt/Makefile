
GARNAME      = libxcrypt
GARVERSION   = 4.4.36
CATEGORIES   = lib
MASTER_SITES = https://github.com/besser82/libxcrypt/archive/refs/tags/
DISTFILES    = v$(GARVERSION).tar.gz
LICENSE      = GPL2

DEPENDS = 

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libcrypt.la
ifeq ($(DESTIMG),build)
	@cp -f $(build_DESTDIR)$(build_includedir)/crypt.h $(main_DESTDIR)$(main_includedir)/crypt.h
endif
	@$(MAKECOOKIE)
