
GARNAME      = pcre
GARVERSION   = 8.42
CATEGORIES   = lib
MASTER_SITES = https://sourceforge.net/projects/pcre/files/pcre/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.bz2
PATCHFILES   = $(DISTNAME).patch.gar
ifneq ($(DESTIMG),build)
PATCHFILES  += $(DISTNAME)-cross.patch
endif
LICENSE = BSD_3_Clause

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lang/cxx
ifneq ($(DESTIMG),build)
BUILDDEPS = lib/pcre
endif

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile
ifeq ($(DESTIMG),build)
INSTALL_SCRIPTS   += cross
endif

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-shared \
	--disable-static \
	--enable-utf8 \
	--enable-unicode-properties \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@mkdir -p $(WORKSRC)/m4
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

install-cross:
	@if test -e $(WORKSRC)/dftables ; then cp -f $(WORKSRC)/dftables $(DESTDIR)$(bindir)/pcre-dftables ; fi
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libpcre.la
	@rm -f $(DESTDIR)$(libdir)/libpcrecpp.la
	@rm -f $(DESTDIR)$(libdir)/libpcreposix.la
	@rm -f $(DESTDIR)$(bindir)-config/pcre-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)pcre-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/pcre-config $(DESTDIR)$(bindir)-config/pcre-config
	@$(if $(compiler_prefix), ln -s pcre-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)pcre-config)
	@$(MAKECOOKIE)
