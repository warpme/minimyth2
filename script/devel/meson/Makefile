
GARNAME      = meson
GARVERSION   = 1.3.0
CATEGORIES   = devel
MASTER_SITES = https://github.com/mesonbuild/meson/releases/download/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      =
DESCRIPTION  = 
define BLURB
endef

BUILDDEPS = python3/python python3/python-setuptools devel/ninja

BUILD_SCRIPTS   = $(WORKSRC)/setup.py
INSTALL_SCRIPTS = $(WORKSRC)/setup.py

CONFIGURE_ARGS =
BUILD_ARGS     =
INSTALL_ARGS   = \
	--prefix=$(DESTDIR)$(prefix)
CONFIGURE_ENV  =
BUILD_ENV      =
INSTALL_ENV    = \
	PYTHONPATH=$(DESTDIR)$(PYTHON_libdir)/site-packages

GAR_EXTRA_CONF += python3/python/package-api.mk
include ../../gar.mk

build-%/setup.py:
	@echo " ==> Running setup.py build in $*"
	@cd $* && $(CONFIGURE_ENV) $(BUILD_ENV) python3 setup.py $(CONFIGURE_ARGS) build $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-%/setup.py: 
	@echo " ==> Running setup.py install in $*"
	@cd $* && $(CONFIGURE_ENV) $(INSTALL_ENV) python3 setup.py $(CONFIGURE_ARGS) install --skip-build $(INSTALL_ARGS)
	@echo " ==> Generating $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf cross-compile config"
	@mkdir -p $(build_DESTDIR)$(build_datadir)/meson/cross/
	@echo "[binaries]"                                                           > $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
	@echo "c           = '$(build_DESTDIR)$(build_bindir)/$(mm_GARHOST)-gcc'"   >> $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
	@echo "cpp         = '$(build_DESTDIR)$(build_bindir)/$(mm_GARHOST)-g++'"   >> $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
	@echo "ar          = '$(build_DESTDIR)$(build_bindir)/$(mm_GARHOST)-ar'"    >> $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
	@echo "strip       = '$(build_DESTDIR)$(build_bindir)/$(mm_GARHOST)-strip'" >> $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
	@echo "pkgconfig   = '$(build_DESTDIR)$(build_bindir)/pkg-config'"          >> $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
	@echo "llvm-config = '$(main_DESTDIR)$(main_bindir)-config/llvm-config'"    >> $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
	@echo "[host_machine]"                                                      >> $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
	@echo "system     = 'linux'"                                                >> $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
	@echo "endian     = 'little'"                                               >> $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
ifeq ($(mm_GARCH),armv7)
	@echo "cpu_family = 'arm'"     >> $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
	@echo "cpu        = 'arm'"     >> $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
else
ifeq ($(mm_GARCH),armv8)
	@echo "cpu_family = 'aarch64'" >> $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
	@echo "cpu        = 'aarch64'" >> $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
else
ifeq ($(mm_GARCH),pentium-mmx)
	@echo "cpu_family = 'i686'"    >> $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
	@echo "cpu        = 'i686'"    >> $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
else
	@echo "cpu_family = 'x86_64'"  >> $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
	@echo "cpu        = 'x86_64'"  >> $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
endif
endif
endif
	@echo ""                           >> $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
	@echo "[properties]"               >> $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
	@echo "needs_exe_wrapper = false"  >> $(build_DESTDIR)$(build_datadir)/meson/cross/$(mm_GARHOST).conf
	@#
	@echo " ==> Generating $(build_DESTDIR)$(build_datadir)/meson/native/$(GARBUILD).conf native-compile config"
	@mkdir -p $(build_DESTDIR)$(build_datadir)/meson/native/
	@echo "[binaries]"                                                           > $(build_DESTDIR)$(build_datadir)/meson/native/$(GARBUILD).conf
	@echo "c           = '$(build_DESTDIR)$(build_bindir)/gcc'"                 >> $(build_DESTDIR)$(build_datadir)/meson/native/$(GARBUILD).conf
	@echo "cpp         = '$(build_DESTDIR)$(build_bindir)/g++'"                 >> $(build_DESTDIR)$(build_datadir)/meson/native/$(GARBUILD).conf
	@echo "ar          = '$(build_DESTDIR)$(build_bindir)/ar'"                  >> $(build_DESTDIR)$(build_datadir)/meson/native/$(GARBUILD).conf
	@echo "strip       = '$(build_DESTDIR)$(build_bindir)/strip'"               >> $(build_DESTDIR)$(build_datadir)/meson/native/$(GARBUILD).conf
	@echo "pkgconfig   = '$(build_DESTDIR)$(build_bindir)/pkg-config'"          >> $(build_DESTDIR)$(build_datadir)/meson/native/$(GARBUILD).conf
	@echo "llvm-config = '$(build_DESTDIR)$(build_bindir)-config/llvm-config'"  >> $(build_DESTDIR)$(build_datadir)/meson/native/$(GARBUILD).conf
	@echo "[host_machine]"                                                      >> $(build_DESTDIR)$(build_datadir)/meson/native/$(GARBUILD).conf
	@echo "system     = 'linux'"                                                >> $(build_DESTDIR)$(build_datadir)/meson/native/$(GARBUILD).conf
	@echo "endian     = 'little'"                                               >> $(build_DESTDIR)$(build_datadir)/meson/native/$(GARBUILD).conf
	@echo "cpu_family = 'x86_64'"      >> $(build_DESTDIR)$(build_datadir)/meson/native/$(GARBUILD).conf
	@echo "cpu        = 'x86_64'"      >> $(build_DESTDIR)$(build_datadir)/meson/native/$(GARBUILD).conf
	@echo ""                           >> $(build_DESTDIR)$(build_datadir)/meson/native/$(GARBUILD).conf
	@echo "[properties]"               >> $(build_DESTDIR)$(build_datadir)/meson/native/$(GARBUILD).conf
	@echo "needs_exe_wrapper = false"  >> $(build_DESTDIR)$(build_datadir)/meson/native/$(GARBUILD).conf
	@$(MAKECOOKIE)
