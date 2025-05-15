
GARNAME      = llvm
GARVERSION   = $(LLVM_VERSION)
CATEGORIES   = devel
MASTER_SITES = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(GARVERSION)/
DISTFILES    = $(DISTNAME).src.tar.xz clang-$(GARVERSION).src.tar.xz libclc-$(GARVERSION).src.tar.xz cmake-$(GARVERSION).src.tar.xz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKDIR)/$(DISTNAME)/LICENSE.TXT

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lang/cxx lib/libedit
BUILDDEPS = python2/python

ifneq ($(DESTIMG),build)
BUILDDEPS += devel/llvm
endif

WORKSRC = $(WORKDIR)/$(DISTNAME).src
WORKBLD = $(WORKDIR)/$(DISTNAME)_build

CONFIGURE_SCRIPTS = llvm
BUILD_SCRIPTS     = llvm llvm_config
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS_COMMON = \
	-DCMAKE_BUILD_TYPE=MinSizeRel \
	-DCMAKE_SYSTEM_NAME="Linux" \
	-DCMAKE_VERBOSE_MAKEFILE=OFF \
	-DLLVM_INCLUDE_TOOLS=ON \
	-DLLVM_BUILD_TOOLS=OFF \
	-DLLVM_BUILD_UTILS=OFF \
	-DLLVM_BUILD_EXAMPLES=OFF \
	-DLLVM_INCLUDE_EXAMPLES=OFF \
	-DLLVM_BUILD_TESTS=OFF \
	-DLLVM_INCLUDE_TESTS=OFF \
	-DLLVM_BUILD_BENCHMARKS=OFF \
	-DLLVM_INCLUDE_BENCHMARKS=OFF \
	-DLLVM_BUILD_DOCS=OFF \
	-DLLVM_INCLUDE_DOCS=OFF \
	-DLLVM_ENABLE_DOXYGEN=OFF \
	-DLLVM_ENABLE_SPHINX=OFF \
	-DLLVM_ENABLE_OCAMLDOC=OFF \
	-DLLVM_ENABLE_BINDINGS=OFF \
	-DLLVM_ENABLE_ASSERTIONS=OFF \
	-DLLVM_ENABLE_WERROR=OFF \
	-DLLVM_ENABLE_ZLIB=OFF \
	-DLLVM_ENABLE_ZSTD=OFF \
	-DLLVM_ENABLE_LIBXML2=OFF \
	-DLLVM_BUILD_LLVM_DYLIB=ON \
	-DLLVM_LINK_LLVM_DYLIB=ON \
	-DLLVM_OPTIMIZED_TABLEGEN=ON \
	-DLLVM_APPEND_VC_REV=OFF \
	-DLLVM_ENABLE_RTTI=ON \
	-DLLVM_ENABLE_UNWIND_TABLES=OFF \
	-DLLVM_ENABLE_Z3_SOLVER=OFF \
	-DCMAKE_SKIP_RPATH=ON \

ifneq ($(DESTIMG),build)
# config for target
CONFIGURE_ARGS = \
	$(DIRPATHS_CMAKE) \
	$(CONFIGURE_ARGS_COMMON) \
	-DCMAKE_CROSSCOMPILING=ON \
	-DLLVM_DEFAULT_TARGET_TRIPLE="$(mm_GARHOST)" \
	-DLLVM_HOST_TRIPLE="$(mm_GARHOST)" \
	-DLLVM_ENABLE_PROJECTS="" \
	$(if $(filter i386 x86_64,$(mm_GARCH_FAMILY)), \
	 -DLLVM_TARGET_ARCH="X86"                 \
	 -DLLVM_TARGETS_TO_BUILD="X86;AMDGPU" )   \
	$(if $(filter arm,   $(mm_GARCH_FAMILY)), \
	 -DLLVM_TARGET_ARCH="ARM"                 \
	 -DLLVM_TARGETS_TO_BUILD="ARM" )          \
	$(if $(filter arm64, $(mm_GARCH_FAMILY)), \
	 -DLLVM_TARGET_ARCH="AArch64"             \
	 -DLLVM_TARGETS_TO_BUILD="AArch64" )      \

else
# config for build
CONFIGURE_ARGS = \
	$(DIRPATHS_CMAKE) \
	$(CONFIGURE_ARGS_COMMON) \
	-DLLVM_ENABLE_PROJECTS="clang;libclc" \
	$(if $(filter i386 x86_64,$(mm_GARCH_FAMILY)), \
	 -DLLVM_TARGET_ARCH="X86"                 \
	 -DLLVM_TARGETS_TO_BUILD="X86;AMDGPU" )   \
	$(if $(filter arm,   $(mm_GARCH_FAMILY)), \
	 -DLLVM_TARGET_ARCH="ARM"                 \
	 -DLLVM_TARGETS_TO_BUILD="ARM" )          \
	$(if $(filter arm64, $(mm_GARCH_FAMILY)), \
	 -DLLVM_TARGET_ARCH="AArch64"             \
	 -DLLVM_TARGETS_TO_BUILD="AArch64" )      \

endif

GAR_EXTRA_CONF += devel/llvm/package-api.mk
include ../../gar.mk

# the configure script applies the host compiler flags when checking the build compiler.
CFLAGS   :=
CXXFLAGS :=
LDFLAGS  :=

pre-configure: 
	$(warning CMAKE configure will be invoked with: $(CONFIGURE_ARGS))
	@mv $(WORKDIR)/$(DISTNAME).src $(WORKDIR)/$(DISTNAME)
	@cp $(WORKDIR)/cmake-$(GARVERSION).src/Modules/* $(WORKDIR)/$(DISTNAME)/cmake/modules/
	@mkdir -p $(WORKDIR)/cmake
	@mv $(WORKDIR)/cmake-$(GARVERSION).src/* $(WORKDIR)/cmake/
	@mkdir -p $(WORKDIR)/clang
	@mv $(WORKDIR)/clang-$(GARVERSION).src/* $(WORKDIR)/clang/
	@mkdir -p $(WORKDIR)/libclc
	@mv $(WORKDIR)/libclc-$(GARVERSION).src/* $(WORKDIR)/libclc/
	@$(MAKECOOKIE)

configure-llvm:
	@echo " ==> Running configure in $(WORKBLD)"
	@rm -rf $(WORKBLD)
	@mkdir -p $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) $(CMAKE) $(DIRPATHS_CMAKE) $(CONFIGURE_ARGS) ../$(DISTNAME)
	@$(MAKECOOKIE)

build-llvm:
	@echo " ==> Running build in $(WORKBLD)"
	@cd $(WORKBLD) && $(CMAKE) --build . --parallel $(PARALLELMFLAGS)
	@$(MAKECOOKIE)

build-llvm_config:
	@$(MAKE) -C $(WORKBLD) llvm-config
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(bindir)-config/llvm-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)llvm-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@$(if $(filter build, $(DESTIMG)), \
	 cp $(WORKBLD)/bin/llvm-config                         $(DESTDIR)$(bindir)-config/llvm-config, \
	 cp $(build_DESTDIR)$(build_bindir)-config/llvm-config $(DESTDIR)$(bindir)-config/llvm-config  )
	@$(if $(compiler_prefix), ln -sf llvm-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)llvm-config)
	@$(MAKECOOKIE)

clean-all:
	@rm -f  $(DESTDIR)$(bindir)-config/llvm-config
	@rm -f  $(DESTDIR)$(bindir)/llvm*
	@rm -f  $(DESTDIR)$(bindir)/clang*
	@rm -f  $(DESTDIR)$(libdir)/libLLVM*
	@rm -f  $(DESTDIR)$(libdir)/libclang*
	@rm -rf $(DESTDIR)$(libdir)/clang*
	@rm -f  $(DESTDIR)$(libdir)/LLVMHello.so
	@rm -f  $(DESTDIR)$(libdir)/libLTO*
	@rm -rf $(DESTDIR)$(includedir)/llvm*
	@rm -rf $(DESTDIR)$(libdir)/cmake/clang*
	@rm -rf $(DESTDIR)$(libdir)/cmake/llvm*
