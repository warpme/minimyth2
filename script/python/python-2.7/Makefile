GARNAME = Python
GARVERSION =  $(PYTHON_VERSION)
CATEGORIES = python
MASTER_SITES = http://www.python.org/ftp/python/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.xz
#PATCHFILES = Python-2.7.10-parallel.patch
ifneq ($(DESTIMG),build)
PATCHFILES = Python-2.7.10-cross.patch
endif
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE

DESCRIPTION = 
define BLURB
endef

DEPENDS    = lang/c lib/ncurses lib/openssl lib/readline lib/zlib
BUILDDEPS  = devel/autoconf devel/automake
ifneq ($(DESTIMG),build)
# DEPENDS   += lib/bluez
BUILDDEPS += python/python
endif

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile
ifeq ($(DESTIMG),build)
INSTALL_SCRIPTS   += cross
endif

PWD := $(shell pwd)

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--enable-shared \
	--disable-ipv6
ifneq ($(DESTIMG),build)
BUILD_ARGS     = \
	HOSTPYTHON=$(build_DESTDIR)$(build_bindir)/python \
	HOSTPGEN=$(build_DESTDIR)$(build_bindir)/python-pgen \
	BLDSHARED="$(CC) -shared" \
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
	ac_cv_file__dev_ptmx=yes \
	ac_cv_func_lchflags_works=no \
	ac_cv_func_chflags_works=no \
	ac_cv_func_printf_zd=yes
endif

include ../../gar.mk

# Needed so that Python can find the correct libpython shared library.
LDFLAGS := $(LDFLAGS) -L$(PWD)/$(WORKSRC)

pre-configure:
	@cd $(WORKSRC) ; autoreconf --verbose --install --force
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

install-cross:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp -f $(WORKSRC)/Parser/pgen $(DESTDIR)$(bindir)/python-pgen
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/config/libpython$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR).a
	@rm -f $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@rm -f $(DESTDIR)$(bindir)-config/python-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)python-config
	@mkdir -p $(DESTDIR)$(bindir)-config
	@mv $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@mv $(DESTDIR)$(bindir)/python-config $(DESTDIR)$(bindir)-config/python-config
	@$(if $(compiler_prefix), ln -s python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config)
	@$(if $(compiler_prefix), ln -s python-config $(DESTDIR)$(bindir)-config/$(compiler_prefix)python-config)
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(PYTHON_includedir)
	@rm -rf $(DESTDIR)$(PYTHON_libdir)
	@rm -f $(DESTDIR)$(bindir)/python
	@rm -f $(DESTDIR)$(bindir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)
	@rm -f $(DESTDIR)$(bindir)/pydoc
	@rm -f $(DESTDIR)$(bindir)/python-pgen
	@rm -f $(DESTDIR)$(bindir)-config/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config
	@rm -f $(DESTDIR)$(bindir)-config/python-config
	@$(if $(compiler_prefix), rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)-config)
	@$(if $(compiler_prefix), rm -f $(DESTDIR)$(bindir)-config/$(compiler_prefix)python-config)
	@$(MAKE) clean-image
