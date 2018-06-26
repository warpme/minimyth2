GARNAME = glibc-localedef-static
GARVERSION = $(GLIBC_VERSION)
CATEGORIES = devel
SOURCEPKG = devel/glibc
LICENSE = GPL2/LGPL2_1

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
INSTALL_SCRIPTS   = custom

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
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
	--cache-file=config.cache
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
 
# glibc 2.27 fails to compile with gcc 7.3.0's link time optimization enabled.
CFLAGS  := $(filter-out -flto, $(CFLAGS))  -fno-lto
LDFLAGS := $(filter-out -flto, $(LDFLAGS)) -fno-lto

CFLAGS := $(filter-out -ffast-math, $(CFLAGS))
CFLAGS := $(filter-out -O%, $(CFLAGS)) -Os

configure-custom:
	@mkdir -p $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(build_DESTDIR)/$(build_bindir)
	@rm -f $(build_DESTDIR)/$(build_bindir)/localedef-static
	@cp $(WORKBLD)/locale/localedef $(build_DESTDIR)/$(build_bindir)/localedef-static
	@chmod 0755 $(build_DESTDIR)/$(build_bindir)/localedef-static
