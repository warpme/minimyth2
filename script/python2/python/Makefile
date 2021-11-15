
GARNAME      = Python
GARVERSION   = $(PYTHON_VERSION)
CATEGORIES   = python
MASTER_SITES = http://www.python.org/ftp/python/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.xz
ifneq ($(DESTIMG),build)
PATCHFILES   = Python-$(PYTHON_VERSION)-cross.patch 
PATCHFILES  += Python-$(PYTHON_VERSION)-fix-crosscompile-glibc-2.27.patch
PATCHFILES  += Python-$(PYTHON_VERSION)-unblacklist-ctypes-in-crosscompile.patch
endif
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION = 
define BLURB
endef

DEPENDS    = lang/c lib/ncurses lib/openssl lib/readline devel/zlib lib/expat utils/bzip2
BUILDDEPS  = devel/autoconf devel/automake
ifneq ($(DESTIMG),build)
DEPENDS   += devel/glibc-rpcsvc db/berkeley-db db/sqlite lib/bluez lib/gdbm lib/libnsl net/libtirpc
BUILDDEPS += python2/python
endif

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile

PWD := $(shell pwd)

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--enable-shared \
	--disable-ipv6 \
	--with-system-expat \
	--with-dbmliborder=gdbm:ndbm \
	--without-ensurepip \
	--with-system-ffi \
	--with-lto \
	ac_cv_working_tzset=yes \
	CPPFLAGS="-I$(DESTDIR)$(includedir) -L$(DESTDIR)$(libdir)" \

ifneq ($(DESTIMG),build)
BUILD_ARGS     = \
	HOSTPYTHON=$(build_DESTDIR)$(build_bindir)/python \
	HOSTPGEN=$(build_DESTDIR)$(build_bindir)/python-pgen \
	BLDSHARED="$(CC) -shared -I$(DESTDIR)$(includedir) -L$(DESTDIR)$(libdir) -Wno-all" \
	CROSS_COMPILE=$(compiler_prefix) \
	CROSS_COMPILE_TARGET=yes
INSTALL_ARGS   = \
	HOSTPYTHON=$(build_DESTDIR)$(build_bindir)/python \
	HOSTPGEN=$(build_DESTDIR)$(build_bindir)/python-pgen \
	BLDSHARED="$(CC) -shared" \
	CROSS_COMPILE=$(compiler_prefix) \
	CROSS_COMPILE_TARGET=yes
endif

ifneq ($(DESTIMG),build)
CONFIGURE_ENV = \
	ac_cv_file__dev_ptc=no \
	ac_cv_file__dev_ptmx=yes
endif

include ../../gar.mk

# Needed so that Python can find the correct libpython shared library.
LDFLAGS := $(LDFLAGS) -L$(PWD)/$(WORKSRC)

pre-configure:
	@cd $(WORKSRC) ; autoreconf --verbose --install --force
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-configure:
ifneq ($(DESTIMG),build)
	@# Target python shared modules are built by host python. Host python uses in this building process
	@# _sysconfdata.py from host enviroment. This is problem as to successfuly build target shared modules
	@# we need target _sysconfdata.py (with target compiler flags, etc) - which is not present as there is
	@# no yet target python. So below is workarround for this chicken-and-egg problem:
	@# After target configure stage (when we alredy have correct target Makefile), we will: 
	@# 1.switch in host python Makefile
	@# 2.call host python sysconfig.py to generate target _sysconfdata.py from Makefile from p1
	@# 3.compile target shared modules with target _sysconfdata.py;
	@# 4.restore in host python Makefile
	@echo "==> Regenerating _sysconfigdata.py with cross-compile data..."
	@if [ ! -e $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config/Makefile.build ] ; then cp -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config/Makefile $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config/Makefile.build ; fi
	@echo "  Getting target Makefile as input..."
	@cp -f $(WORKSRC)/Makefile $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config/Makefile
	@echo "  Calling host sysconfig.py to generate _sysconfigdata.py with target arch..."
	@$(build_DESTDIR)$(build_bindir)/python -S -m sysconfig --generate-posix-vars
	@if [ ! -e $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py.build ] ; then cp -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py.build ; fi
	@echo "  Restoring host python Makefile..."
	@cp -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config/Makefile $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config/Makefile.main
	@if [ -e $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config/Makefile.build ] ; then cp -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config/Makefile.build $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config/Makefile ; fi
	@echo "  Copy new _sysconfigdata.py with target arch to host python..."
	@cp -v $(WORKSRC)/../../../build/lib.linux*/_sysconfigdata.py $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py
	@rm -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.pyc
	@echo "  Fixing LIB dirs in target arch _sysconfigdata.py..."
	@sed -i "s%'LIBDIR':.*%'LIBDIR': '$(DESTDIR)$(libdir)',%" $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py
	@echo "  Fixing INCLUDE dirs in target arch _sysconfigdata.py..."
	@sed -i "s%'INCLUDEDIR':.*%'INCLUDEDIR': '$(DESTDIR)$(includedir)',%" $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py
	@cp -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py.main
endif
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config/libpython$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR).a
	@rm -f $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@rm -f $(DESTDIR)$(bindir)-config/python-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)python-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@mv $(DESTDIR)$(bindir)/python2-config $(DESTDIR)$(bindir)-config/python2-config
	@mv $(DESTDIR)$(bindir)/python-config $(DESTDIR)$(bindir)-config/python-config
	@$(if $(compiler_prefix), ln -s python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config)
	@$(if $(compiler_prefix), ln -s python-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)python-config)
	@rm -f $(DESTDIR)$(bindir)/python
	@# Uncomment to make python2 as default python
	@ln -srf $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR) $(DESTDIR)$(bindir)/python
	@rm -rf $(WORKSRC)/../../../build*
	@rm -f $(WORKSRC)/../../../pybuilddir.txt
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(PYTHON_includedir)
	@rm -rf $(DESTDIR)$(PYTHON_libdir)
	@rm -f $(DESTDIR)$(bindir)/python
	@rm -f $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR)
	@rm -f $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)
	@rm -f $(DESTDIR)$(bindir)/pydoc
	@rm -f $(DESTDIR)$(bindir)/python-pgen
	@rm -f $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@rm -f $(DESTDIR)$(bindir)-config/python-config
	@rm -f $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR)-config
	@$(if $(compiler_prefix), rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config)
	@$(if $(compiler_prefix), rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)python-config)
	@$(MAKE) clean-image
