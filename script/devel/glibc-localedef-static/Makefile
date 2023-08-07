
GARNAME    = glibc-localedef-static
GARVERSION = $(GLIBC_VERSION)
CATEGORIES = devel
SOURCEPKG  = devel/glibc
LICENSE    = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

# If this is the build image and the system is using linuxthreads, then we need to use linux threads.
# Otherwise, the build packages will not compile and run correctly.
use_linuxthreads = no
ifeq ($(DESTIMG),build)
ifeq ($(shell getconf GNU_LIBPTHREAD_VERSION | sed 's%[- ].*%%'),linuxthreads)
use_linuxthreads = yes
endif
endif

WORKSRC = $(WORKDIR)/glibc-$(GARVERSION)
WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--prefix=$(build_DESTDIR)/$(build_bindir)/glibc-localedef-static \
	--exec-prefix=$(build_DESTDIR)/$(build_bindir)/glibc-localedef-static \
	--datarootdir=$(build_DESTDIR)/$(build_bindir)/glibc-localedef-static \
	--bindir=$(build_DESTDIR)/$(build_bindir)/glibc-localedef-static \
	--sbindir=$(build_DESTDIR)/$(build_bindir)/glibc-localedef-static \
	--libexecdir=$(build_DESTDIR)/$(build_bindir)/glibc-localedef-static \
	--sysconfdir=$(build_DESTDIR)/$(build_bindir)/glibc-localedef-static \
	--sharedstatedir=$(build_DESTDIR)/$(build_bindir)/glibc-localedef-static \
	--localstatedir=$(build_DESTDIR)/$(build_bindir)/glibc-localedef-static \
	--libdir=$(build_DESTDIR)/$(build_bindir)/glibc-localedef-static \
	--includedir=$(build_DESTDIR)/$(build_bindir)/glibc-localedef-static \
	--oldincludedir=$(build_DESTDIR)/$(build_bindir)/glibc-localedef-static \
	--datarootdir=$(build_DESTDIR)/$(build_bindir)/glibc-localedef-static \
	--datadir=$(build_DESTDIR)/$(build_bindir)/glibc-localedef-static \
	--infodir=$(build_DESTDIR)/$(build_bindir)/glibc-localedef-static \
	--localedir=$(build_DESTDIR)/$(build_bindir)/glibc-localedef-static \
	--mandir=$(build_DESTDIR)/$(build_bindir)/glibc-localedef-static \
	--docdir=$(build_DESTDIR)/$(build_bindir)/glibc-localedef-static \
	--htmldir=$(build_DESTDIR)/$(build_bindir)/glibc-localedef-static \
	--disable-sanity-checks \
	--enable-bind-now \
	--enable-kernel=2.6.18 \
	--disable-build-nscd \
	--disable-nscd \
	--without-gd \
	--without-cvs \
	--with-elf \
	--disable-werror \
	--disable-multi-arch \
	$(if $(filter arm arm64,$(GARCH_FAMILY)),--disable-mathvec) \

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
 
# glibc fails to compile with gcc link time optimization enabled.
CFLAGS  := $(filter-out -flto, $(CFLAGS))  -fno-lto
LDFLAGS := $(filter-out -flto, $(LDFLAGS)) -fno-lto

CFLAGS := $(filter-out -ffast-math, $(CFLAGS))
CFLAGS := $(filter-out -O%, $(CFLAGS)) -Os

configure-custom:
	@mkdir -p $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(build_DESTDIR)/$(build_bindir)/glibc-localedef-static*
