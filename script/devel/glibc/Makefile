
GARNAME       = glibc
GARVERSION    = $(GLIBC_VERSION)
CATEGORIES    = devel
MASTER_SITES  = git://sourceware.org/git/glibc.git/
DISTFILES     = $(DISTNAME).tar.bz2
LICENSE       = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

ifeq ($(DESTIMG),build)
DEPENDS   = lang/c
BUILDDEPS = devel/binutils devel/gcc
else
DEPENDS   = lang/c kernel-headers/linux-headers devel/glibc-headers
BUILDDEPS = devel/binutils devel/gcc-minimal-shared
endif

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--enable-bind-now \
	--enable-kernel=6.0.0 \
	--enable-crypt \
	--disable-build-nscd \
	--disable-nscd \
	--enable-add-ons=nptl \
	--with-tls \
	--with-__thread \
	--without-gd \
	--without-cvs \
	--with-elf \
	--with-headers=$(DESTDIR)$(includedir) \
	--disable-werror \
	--disable-multi-arch \

INSTALL_ARGS    = \
	install_root=$(DESTDIR)

CONFIGURE_ENV = \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"

BUILD_ENV     = \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"

INSTALL_ENV   = \
	BUILD_CC="$(build_CC)" \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)"

GAR_EXTRA_CONF += devel/glibc/package-api.mk
include ../../gar.mk

git//%$(DISTNAME).tar.bz2:
	@$(call FETCH_GIT, $*, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))
	@$(MAKECOOKIE)

# glibc fails to compile with gcc link time optimization enabled.
CFLAGS  := $(filter-out -flto, $(CFLAGS))
LDFLAGS := $(filter-out -flto, $(LDFLAGS))

configure-custom:
	@mkdir -p $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

post-install:
	@cd $(DESTDIR)$(datadir)/i18n/charmaps ; gzip -df *.gz
	@mkdir -p $(build_DESTDIR)$(build_libdir)/glibc-nptl
	@cp $(WORKBLD)/nptl/libpthread.so $(build_DESTDIR)$(build_libdir)/glibc-nptl/
	@if [ ! -e $(DESTDIR)$(includedir)/gnu/stubs-32.h ] ; then \
	 touch $(DESTDIR)$(includedir)/gnu/stubs-32.h ; \
	 fi
	@#xxxx - fixme
	@if [ -e $(DESTDIR)$(elibdir64)/libcrypt.so.1        ] ; then rm -f $(DESTDIR)$(libdir)/libcrypt.so.1        ; ln -sr $(DESTDIR)$(elibdir64)/libcrypt.so.1        $(DESTDIR)$(libdir)/libcrypt.so.1        ; fi
	@if [ -e $(DESTDIR)$(elibdir64)/libdl.so.2           ] ; then rm -f $(DESTDIR)$(libdir)/libdl.so.2           ; ln -sr $(DESTDIR)$(elibdir64)/libdl.so.2           $(DESTDIR)$(libdir)/libdl.so.2           ; fi
	@if [ -e $(DESTDIR)$(elibdir64)/libm.so.6            ] ; then rm -f $(DESTDIR)$(libdir)/libm.so.6            ; ln -sr $(DESTDIR)$(elibdir64)/libm.so.6            $(DESTDIR)$(libdir)/libm.so.6            ; fi
	@if [ -e $(DESTDIR)$(elibdir64)/libpthread.so.0      ] ; then rm -f $(DESTDIR)$(libdir)/libpthread.so.0      ; ln -sr $(DESTDIR)$(elibdir64)/libpthread.so.0      $(DESTDIR)$(libdir)/libpthread.so.0      ; fi
	@if [ -e $(DESTDIR)$(elibdir64)/libresolv.so.2       ] ; then rm -f $(DESTDIR)$(libdir)/libresolv.so.2       ; ln -sr $(DESTDIR)$(elibdir64)/libresolv.so.2       $(DESTDIR)$(libdir)/libresolv.so.2       ; fi
	@if [ -e $(DESTDIR)$(elibdir64)/librt.so.1           ] ; then rm -f $(DESTDIR)$(libdir)/librt.so.1           ; ln -sr $(DESTDIR)$(elibdir64)/librt.so.1           $(DESTDIR)$(libdir)/librt.so.1           ; fi
	@$(MAKECOOKIE)
