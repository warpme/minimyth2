
GARNAME      = Python
GARVERSION   = $(PYTHON_VERSION)
CATEGORIES   = python
MASTER_SITES = http://www.python.org/ftp/python/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = $(GARNAME)

$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION = 
define BLURB
endef

DEPENDS    = lang/c lib/ncurses lib/openssl lib/readline devel/zlib lib/libffi db/sqlite
BUILDDEPS  = devel/autoconf devel/automake
ifneq ($(DESTIMG),build)
BUILDDEPS += python3/python
endif

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile

PWD := $(shell pwd)

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--enable-shared \
	--disable-ipv6 \
	--with-system-ffi \
	--with-system-expat \
	--with-dbmliborder=gdbm:ndbm \
	--without-ensurepip \
	--with-lto="yes" \
	CPPFLAGS="-I$(DESTDIR)$(includedir)" \
	ac_cv_enable_implicit_function_declaration_error=no \
	ac_cv_working_tzset=yes \

ifneq ($(DESTIMG),build)
BUILD_ARGS     = \
	HOSTPYTHON=$(build_DESTDIR)$(build_bindir)/python3 \
	HOSTPGEN=$(build_DESTDIR)$(build_bindir)/python-pgen \
	BLDSHARED="$(CC) -shared -I$(DESTDIR)$(includedir) -L$(DESTDIR)$(libdir) -Wno-all" \
	CROSS_COMPILE=$(compiler_prefix) \
	CROSS_COMPILE_TARGET=yes
CONFIGURE_ARGS += --with-build-python
INSTALL_ARGS   = \
	HOSTPYTHON=$(build_DESTDIR)$(build_bindir)/python3 \
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

# Needed as configure fails on 'float word ordering is bigendian' detection
CFLAGS  += -ffat-lto-objects

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
	@echo "==> Saving host Makefile and _sysconfigdata.py ..."
	@-if [ ! -e $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata__linux_*-linux-gnu.py.build ] ; then \
	 cd $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR) ; \
	 cp -f _sysconfigdata__linux_i386-linux-gnu.py _sysconfigdata__linux_i386-linux-gnu.py.build 2>/dev/null ; \
	 cp -f _sysconfigdata__linux_x86_64-linux-gnu.py _sysconfigdata__linux_x86_64-linux-gnu.py.build 2>/dev/null ; \
	fi
	@if [ ! -e $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config-$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-i386-linux-gnu/Makefile.build ] ; then \
	 cd $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config-$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-i386-linux-gnu ; cp -f Makefile Makefile.build ; \
	fi
	@if [ ! -e $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config-$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-x86_64-linux-gnu/Makefile.build ] ; then \
	 cd $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config-$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-x86_64-linux-gnu ; cp -f Makefile Makefile.build ; \
	fi
	@echo "==> Regenerating _sysconfigdata.py with cross-compile data ..."
	@cp -fv $(WORKSRC)/Makefile $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/Makefile.tmp
	@if [ ! -e $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config-$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-i386-linux-gnu/Makefile.build ] ; then \
	 ln -srf $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config-$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-x86_64-linux-gnu $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config-$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-i386-linux-gnu ; \
	fi
	@cd $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config-$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-i386-linux-gnu ; mv -f ../Makefile.tmp Makefile
	@echo "  Calling host sysconfig.py to generate _sysconfigdata.py with target arch..."
	@$(build_DESTDIR)$(build_bindir)/python3 -S -m sysconfig --generate-posix-vars
	@echo "  Disabling LTO and -O3 in target arch _sysconfigdata.py..."
	@sed -i "s|-O3|-Os|g" $(WORKSRC)/../../../build/lib.linux*/_sysconfigdata__linux_*-linux-gnu.py
	@sed -i "s|-flto=auto||g" $(WORKSRC)/../../../build/lib.linux*/_sysconfigdata__linux_*-linux-gnu.py
	@echo "  Fixing LIB dirs in target arch _sysconfigdata.py..."
	@sed -i "s%'LIBDIR':.*%'LIBDIR': '$(DESTDIR)$(libdir)',%" $(WORKSRC)/../../../build/lib.linux*/_sysconfigdata__linux_*-linux-gnu.py
	@echo "  Fixing INCLUDE dirs in target arch _sysconfigdata.py..."
	@sed -i "s%'INCLUDEDIR':.*%'INCLUDEDIR': '$(DESTDIR)$(includedir)',%" $(WORKSRC)/../../../build/lib.linux*/_sysconfigdata__linux_*-linux-gnu.py
	@rm -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/__pycache__/_sysconfigdata__*.pyc
	@echo "  Restoring host python Makefile..."
	@-cd $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config-$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-i386-linux-gnu ; \
	 cp -f Makefile Makefile.main ; \
	 cp -f Makefile.build Makefile
	@-cd $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config-$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-x86_64-linux-gnu ; \
	 cp -f Makefile Makefile.main ; \
	 cp -f Makefile.build Makefile
	@echo "  Copy new _sysconfigdata.py with target arch to host python..."
	@-cp -f $(WORKSRC)/../../../build/lib.linux*/_sysconfigdata__linux_i386-linux-gnu.py $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/
	@-cp -f $(WORKSRC)/../../../build/lib.linux*/_sysconfigdata__linux_x86_64-linux-gnu.py $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/
	@-cd $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR) ; \
	 cp -f _sysconfigdata__linux_i386-linux-gnu.py _sysconfigdata__linux_i386-linux-gnu.py.main 2>/dev/null ; \
	 cp -f _sysconfigdata__linux_x86_64-linux-gnu.py _sysconfigdata__linux_x86_64-linux-gnu.py.main 2>/dev/null
endif
	@$(MAKECOOKIE)

post-install:
	@rm -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.pyc
	@rm -f $(DESTDIR)$(libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config-$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-*-linux-gnu/libpython$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR).a
	@rm -f $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@rm -f $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR)-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR)-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@mv $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR)-config $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR)-config
	@$(if $(compiler_prefix), ln -s python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config)
	@$(if $(compiler_prefix), ln -s python$(PYTHON_VERSION_MAJOR)-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR)-config)
	@# uncomment to make python3 as default python
	@#ln -srf $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR) $(DESTDIR)$(bindir)/python
	@rm -rf $(WORKSRC)/../../../build*
	@rm -f $(WORKSRC)/../../../pybuilddir.txt
	@rm -f $(WORKSRC)/../../../Makefile.build
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(PYTHON_includedir)
	@rm -rf $(DESTDIR)$(PYTHON_libdir)
	@rm -f $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR)
	@rm -f $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)
	@rm -f $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)m
	@rm -f $(DESTDIR)$(bindir)/pydoc$(PYTHON_VERSION_MAJOR)
	@rm -f $(DESTDIR)$(bindir)/pydoc$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)
	@rm -f $(DESTDIR)$(bindir)/python-pgen
	@rm -f $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@rm -f $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)m-config
	@rm -f $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR)-config
	@$(if $(compiler_prefix), rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config)
	@$(if $(compiler_prefix), rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR)-config)
	@$(MAKE) clean-image
