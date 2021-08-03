
GARNAME      = llvm
GARVERSION   = 12.0.1
CATEGORIES   = devel
MASTER_SITES = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(GARVERSION)/
DISTFILES    = $(DISTNAME).src.tar.xz
LICENSE      = $(GARNAME)
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
BUILD_SCRIPTS     = $(WORKBLD)/Makefile llvm_config
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS = $(DIRPATHS_CMAKE) \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DLLVM_BUILD_LLVM_DYLIB="ON" \
	-DLLVM_LINK_LLVM_DYLIB="ON" \
	-DLLVM_BUILD_TOOLS="OFF" \
	-DLLVM_INCLUDE_TOOLS="ON" \
	-DLLVM_BUILD_EXAMPLES="OFF" \
	-DLLVM_INCLUDE_EXAMPLES="OFF" \
	-DLLVM_BUILD_TESTS="OFF" \
	-DLLVM_INCLUDE_TESTS="OFF" \
	-DLLVM_ENABLE_LTO="OFF" \
	-DLLVM_BUILD_DOCS="OFF" \
	-DLLVM_ENABLE_DOXYGEN="OFF" \
	-DCMAKE_BUILD_TYPE=Release \
	$(if $(filter i386 x86_64,$(mm_GARCH_FAMILY)), \
	 -DLLVM_TARGET_ARCH="X86" \
	 -DLLVM_TARGETS_TO_BUILD="X86;AMDGPU" ) \
	$(if $(filter arm,   $(mm_GARCH_FAMILY)), \
	 -DLLVM_TARGET_ARCH="ARM" \
	 -DLLVM_TARGETS_TO_BUILD="ARM" ) \
	$(if $(filter arm64, $(mm_GARCH_FAMILY)), \
	 -DLLVM_TARGET_ARCH="AArch64" \
	 -DLLVM_TARGETS_TO_BUILD="AArch64" )

include ../../gar.mk

ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	-DCMAKE_CROSSCOMPILING="True" \
	-DLLVM_DEFAULT_TARGET_TRIPLE="$(mm_GARHOST)" \
	-DLLVM_HOST_TRIPLE="$(mm_GARHOST)" \
	-DLLVM_TABLEGEN="$(build_DESTDIR)$(build_bindir)/llvm-tblgen"
endif

# the configure script applies the host compiler flags when checking the build compiler.
CFLAGS   :=
CXXFLAGS :=
LDFLAGS  :=

pre-configure: 
	@mv $(WORKDIR)/$(DISTNAME).src $(WORKDIR)/$(DISTNAME)
	@$(MAKECOOKIE)

build-llvm_config:
	@$(MAKE) -C $(WORKBLD) llvm-config
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libLLVM*.a
	@mkdir -p $(DESTDIR)$(bindir)-config
	@$(if $(filter build, $(DESTIMG)), \
	 cp $(WORKBLD)/bin/llvm-config $(DESTDIR)$(bindir)-config/llvm-config, \
	 echo '#!/bin/sh'                      > $(DESTDIR)$(bindir)-config/llvm-config ; \
	 echo 'echo "$$@" >> llvm-config.log' >> $(DESTDIR)$(bindir)-config/llvm-config ; \
	 echo '$(build_DESTDIR)$(build_bindir)-config/llvm-config "$$@" | sed -e "s/build/main/g" >> llvm-config.log 2>&1' >> $(DESTDIR)$(bindir)-config/llvm-config ; \
	 echo '$(build_DESTDIR)$(build_bindir)-config/llvm-config "$$@" | sed -e "s/build/main/g"'                         >> $(DESTDIR)$(bindir)-config/llvm-config ; \
	 chmod +x $(DESTDIR)$(bindir)-config/llvm-config )
	@$(if $(compiler_prefix), ln -sf llvm-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)llvm-config)
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)$(bindir)-config/llvm-config
	@rm -f $(DESTDIR)$(bindir)/llvm*
	@rm -f $(DESTDIR)$(libdir)/libLLVM*
	@rm -f $(DESTDIR)$(libdir)/LLVMHello.so
	@rm -f $(DESTDIR)$(libdir)/libLTO*
	@rm -rf $(DESTDIR)$(includedir)/llvm*
