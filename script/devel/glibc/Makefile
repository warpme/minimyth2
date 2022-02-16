
GARNAME       = glibc
GARVERSION    = $(GLIBC_VERSION)
CATEGORIES    = devel
MASTER_SITES  = http://ftp.gnu.org/gnu/$(GARNAME)/
DISTFILES     = $(DISTNAME).tar.xz
PATCHFILES    = $(DISTNAME)-fix-building-arm-thumb.patch
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

# If this is the build image and the system is using linuxthreads, then we need to use linux threads.
# Otherwise, the build packages will not compile and run correctly.
use_linuxthreads = no
ifeq ($(DESTIMG),build)
ifeq ($(shell getconf GNU_LIBPTHREAD_VERSION | sed 's%[- ].*%%'),linuxthreads)
use_linuxthreads = yes
endif
endif

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--enable-bind-now \
	--enable-kernel=3.18.0 \
	--disable-build-nscd \
	--disable-nscd \
	--without-gd \
	--without-cvs \
	--with-elf \
	--with-headers=$(DESTDIR)$(includedir) \
	--disable-werror \
	--disable-multi-arch

ifeq ($(use_linuxthreads),yes)
CONFIGURE_ARGS += \
	--enable-add-ons=linuxthreads \
	--without-tls \
	--without-__thread
else
CONFIGURE_ARGS += \
	--enable-add-ons=nptl \
	--with-tls \
	--with-__thread
endif
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

# glibc fails to compile with gcc 7.3.0's link time optimization enabled.
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
