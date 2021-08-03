
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

DEPENDS    = lang/c lib/ncurses lib/openssl lib/readline devel/zlib lib/libffi
BUILDDEPS  = devel/autoconf devel/automake
ifneq ($(DESTIMG),build)
DEPENDS   += lib/bluez
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
	CPPFLAGS="-I$(DESTDIR)$(includedir)" \
	ac_cv_enable_implicit_function_declaration_error=no \

ifneq ($(DESTIMG),build)
BUILD_ARGS     = \
	HOSTPYTHON=$(build_DESTDIR)$(build_bindir)/python3 \
	HOSTPGEN=$(build_DESTDIR)$(build_bindir)/python-pgen \
	BLDSHARED="$(CC) -shared -I$(DESTDIR)$(includedir) -L$(DESTDIR)$(libdir) -Wno-all" \
	CROSS_COMPILE=$(compiler_prefix) \
	CROSS_COMPILE_TARGET=yes
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

# Disabling LTO on armv7 target as LTO causing segmentation fault on Gcc10.2 ar
ifeq ($(GARCH),armv7)
CONFIGURE_ARGS += --without-lto
CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))
else
CONFIGURE_ARGS += --with-lto
endif

pre-configure:
	@cd $(WORKSRC) ; autoreconf --verbose --install --force
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.pyc
	@rm -f $(DESTDIR)$(libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config/libpython$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR).a
	@rm -f $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@rm -f $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR)-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR)-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@mv $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR)-config $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR)-config
	@$(if $(compiler_prefix), ln -s python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config)
	@$(if $(compiler_prefix), ln -s python$(PYTHON_VERSION_MAJOR)-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR)-config)
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
