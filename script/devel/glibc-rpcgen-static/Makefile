GARNAME = glibc-rpcgen-static
GARVERSION = $(GLIBC_VERSION)
CATEGORIES = devel
SOURCEPKG = devel/glibc
PATCHFILES += glibc-$(GARVERSION)-rpcgen_static.patch
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
	--enable-bind-now \
	--enable-static-nss \
	--enable-kernel=2.6.9 \
	--with-binutils=$(build_DESTDIR)$(build_bindir) \
	--without-gd \
	--without-cvs \
	--with-elf \
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
BUILD_ARGS      = \
	sunrpc
INSTALL_ARGS    = \
	sunrpc

GAR_EXTRA_CONF += devel/glibc/package-api.mk
include ../../gar.mk
 
# glibc 2.15 fails to compile with gcc 4.7.0's link time optimization enabled.
CFLAGS  := $(filter-out -flto, $(CFLAGS))
LDFLAGS := $(filter-out -flto, $(LDFLAGS))

CFLAGS := $(filter-out -ffast-math, $(CFLAGS))
CFLAGS := $(filter-out -O%, $(CFLAGS)) -O3

pre-configure:
	@mkdir -p $(WORKBLD)
	@rm -rf $(WORKBLD)/configparms
	@echo "slibdir=$(elibdir)" >> $(WORKBLD)/configparms
	@rm -rf $(WORKBLD)/config.cache
	@echo "libc_cv_forced_unwind=yes" >> $(WORKBLD)/config.cache
	@echo "libc_cv_c_cleanup=yes"     >> $(WORKBLD)/config.cache
	@$(MAKECOOKIE)

configure-custom:
	@mkdir -p $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ./$(call DIRSTODOTS,$(WORKBLD))/$(WORKSRC)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(build_DESTDIR)/$(build_bindir)
	@rm -f $(build_DESTDIR)/$(build_bindir)/rpcgen-static
	@cp $(WORKBLD)/sunrpc/rpcgen $(build_DESTDIR)/$(build_bindir)/rpcgen-static
	@chmod 0755 $(build_DESTDIR)/$(build_bindir)/rpcgen-static
