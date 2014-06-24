GARNAME = llvm
GARVERSION = 3.0
CATEGORIES = devel
MASTER_SITES = http://www.llvm.org/releases/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-cross.patch
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE.TXT

DESCRIPTION = 
define BLURB
endef

DEPENDS    = lang/c lang/cxx
BUILDDEPS  = perl/perl python/python utils/tcl
ifneq ($(DESTIMG),build)
BUILDDEPS += devel/llvm
endif

WORKSRC = $(WORKDIR)/$(DISTNAME).src

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-polly \
	--enable-optimized \
	--disable-profiling \
	--disable-assertions \
	--disable-expensive-checks \
	--enable-debug-runtime \
	--enable-debug-symbols \
	--enable-jit \
	--disable-docs \
	--disable-doxygen \
	--enable-threads \
	--enable-pthreads \
	--enable-pic \
	--enable-shared \
	--disable-embed-stdcxx \
	--enable-timestamps \
	$(if $(filter i386,$(GARCH_FAMILY)),--enable-targets=x86) \
	$(if $(filter x86_64,$(GARCH_FAMILY)),--enable-targets=x86_64)
BUILD_ARGS     =
INSTALL_ARGS   =
ifneq ($(DESTIMG),build)
BUILD_ARGS    += \
	LLVM_TBLGEN="$(build_DESTDIR)$(build_bindir)/llvm-tblgen"
INSTALL_ARGS  += \
	LLVM_TBLGEN="$(build_DESTDIR)$(build_bindir)/llvm-tblgen"
endif

CONFIGURE_ENV = \
	BUILD_CPPFLAGS="$(build_CPPFLAGS)" \
	BUILD_CFLAGS="$(build_CFLAGS)" \
	BUILD_CXXFLAGS="$(build_CXXFLAGS)" \
	BUILD_LDFLAGS="$(build_LDFLAGS)" \
	TCLSH="$(build_DESTDIR)/$(build_bindir)/tclsh"


include ../../gar.mk

# llvm 3.0 fails to compile with gcc 4.7.1's link time optimization enabled.
CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

CFLAGS   := $(filter-out -pipe, $(CFLAGS))
CXXFLAGS := $(filter-out -pipe, $(CXXFLAGS))
LDFLAGS  := $(filter-out -pipe, $(LDFLAGS))

pre-configure:
	@cd $(WORKSRC)/autoconf ; aclocal  --force --verbose -I m4
	@cd $(WORKSRC)/autoconf ; autoconf --force --verbose -I m4 -o ../configure
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(bindir)-config/llvm-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)llvm-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/llvm-config $(DESTDIR)$(bindir)-config/llvm-config
	@$(if $(compiler_prefix), ln -s llvm-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)llvm-config)
	@$(MAKECOOKIE)
