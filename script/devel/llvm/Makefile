GARNAME = llvm
GARVERSION = 9.0.1
CATEGORIES = devel
MASTER_SITES = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(GARVERSION)/
DISTFILES = $(DISTNAME).src.tar.xz
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKDIR)/$(DISTNAME)/LICENSE.TXT

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lang/cxx
BUILDDEPS = python/python

ifneq ($(DESTIMG),build)
BUILDDEPS += devel/llvm
endif

WORKSRC = $(WORKDIR)/$(DISTNAME).src
WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile


CONFIGURE_ARGS = \
	-DCMAKE_INSTALL_PREFIX="$(prefix)" \
	-DCMAKE_FIND_ROOT_PATH="$(DESTDIR)$(prefix)" \
	-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="NEVER" \
	-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="ONLY" \
	-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="ONLY" \
	-DCMAKE_FIND_ROOT_PATH_MODE_PACKAGE="ONLY" \
	-DCMAKE_C_COMPILER="$(build_DESTDIR)$(build_bindir)/$(CC)" \
	-DCMAKE_CXX_COMPILER="$(build_DESTDIR)$(build_bindir)/$(CXX)" \
	-DCMAKE_AR="$(build_DESTDIR)$(build_bindir)/$(AR)" \
	-DCMAKE_LINKER="$(build_DESTDIR)$(build_bindir)/$(LD)" \
	-DCMAKE_NM="$(build_DESTDIR)$(build_bindir)/$(NM)" \
	-DCMAKE_OBJCOPY="$(build_DESTDIR)$(build_bindir)/$(OBJCOPY)" \
	-DCMAKE_OBJDUMP="$(build_DESTDIR)$(build_bindir)/$(OBJDUMP)" \
	-DCMAKE_RANLIB="$(build_DESTDIR)$(build_bindir)/$(RANLIB)" \
	-DCMAKE_STRIP="$(build_DESTDIR)$(build_bindir)/$(STRIP)" \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DLLVM_BUILD_LLVM_DYLIB="ON" \
	-DLLVM_LINK_LLVM_DYLIB="ON" \
	-DLLVM_BUILD_EXAMPLES="OFF" \
	-DLLVM_INCLUDE_EXAMPLES="OFF" \
	-DLLVM_BUILD_TESTS="OFF" \
	-DLLVM_INCLUDE_TESTS="OFF" \
	-DLLVM_ENABLE_LTO="OFF" \
	-DLLVM_BUILD_DOCS="OFF" \
	-DLLVM_ENABLE_DOXYGEN="OFF" \
	-DCMAKE_BUILD_TYPE=Release \
	-DLLVM_TARGETS_TO_BUILD="host;AMDGPU;BPF"

ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += -DLLVM_TABLEGEN="$(build_DESTDIR)$(build_bindir)/llvm-tblgen"
endif

include ../../gar.mk

TARGETS_i386   := "x86"
TARGETS_x86_64 := "x86"

EXTRA_OPTIONS    := $(CFLAGS)
EXTRA_LD_OPTIONS := $(LDFLAGS)

# the configure script applies the host compiler flags when checking the build compiler.
CFLAGS   :=
CXXFLAGS :=
LDFLAGS  :=

CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

configure-%/cmake: 
	@mv $(WORKDIR)/$(DISTNAME).src $(WORKDIR)/$(DISTNAME)
	@echo " ==> Running configure in $*"
	@rm -rf $*
	@mkdir -p $*
	@cd $* && $(CONFIGURE_ENV) cmake $(CONFIGURE_ARGS) ../$(DISTNAME)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libLLVM*.a
	@rm -f $(DESTDIR)$(bindir)-config/llvm-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)llvm-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@$(if $(filter build, $(DESTIMG)), \
		cp $(WORKBLD)/bin/llvm-config                         $(DESTDIR)$(bindir)-config/llvm-config, \
		ln -srf $(build_DESTDIR)$(build_bindir)-config/llvm-config $(DESTDIR)$(bindir)-config/llvm-config  )
	@$(if $(compiler_prefix), ln -s llvm-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)llvm-config)
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)$(bindir)-config/llvm-config
	@rm -f $(DESTDIR)$(bindir)/llvm*
	@rm -f $(DESTDIR)$(libdir)/libLLVM*
	@rm -f $(DESTDIR)$(libdir)/LLVMHello.so
	@rm -f $(DESTDIR)$(libdir)/libLTO*
	@rm -rf $(DESTDIR)$(includedir)/llvm*
