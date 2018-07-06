GARNAME = python-pycurl
GARVERSION = 7.19.0
CATEGORIES = python
MASTER_SITES = http://pycurl.sourceforge.net/download/
DISTFILES = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
PATCHFILES  = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION)-setuptools.patch
PATCHFILES += $(patsubst python-%,%,$(GARNAME))-$(GARVERSION)-no_static_libcurl.patch
LICENSE = LGPL2_1/$(GARNAME)
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING2

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lib/openssl net/curl
BUILDDEPS = python/python-distutilscross

WORKSRC = $(WORKDIR)/$(patsubst python-%,%,$(GARNAME))-$(GARVERSION)

BUILD_SCRIPTS   = $(WORKSRC)/setup.py
INSTALL_SCRIPTS = $(WORKSRC)/setup.py

CONFIGURE_ARGS =
BUILD_ARGS     = \
	--openssl-dir=$(DESTDIR)$(prefix) \
	--curl-config=$(DESTDIR)$(bindir)-config/curl-config
INSTALL_ARGS   = \
	--prefix=$(DESTDIR)$(prefix)
CONFIGURE_ENV  =
BUILD_ENV      =
INSTALL_ENV    = \
	PYTHONPATH=$(DESTDIR)$(PYTHON_libdir)/site-packages

ifneq ($(DESTIMG),build)
BUILD_ARGS += --cross-compile
BUILD_ENV  += PYTHONXCPREFIX=$(DESTDIR)$(prefix)
BUILD_ENV  += CC=$(GARHOST)-gcc
BUILD_ENV  += LDSHARED="$(GARHOST)-gcc -shared"
endif

GAR_EXTRA_CONF += python/python/package-api.mk
include ../../gar.mk

CFLAGS  := $(CFLAGS)  -fPIC
LDFLAGS := $(LDFLAGS) -fPIC

CFLAGS  += -I$(DESTDIR)$(PYTHON_includedir)
CFLAGS  += -L$(DESTDIR)$(libdir)
LDFLAGS += -I$(DESTDIR)$(PYTHON_includedir)
LDFLAGS += -L$(DESTDIR)$(libdir)

pre-configure:
ifeq ($(DESTIMG),build)
	@# This is required as python-mysql-python can be asked to build still for host when python is
	@# switched already for building for target (_sysconfigdata.py=_sysconfigdata.py.main)
	@echo "Setting _sysconfigdata.py to host config as DESTIMG=build"
	@cp -v $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py.build \
	 $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py
endif
	@$(MAKECOOKIE)

post-install:
ifeq ($(DESTIMG),build)
	@echo "Restoring _sysconfigdata.py to target config as DESTIMG=main"
	@cp -v $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py.main \
	 $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py
endif
	@$(MAKECOOKIE)

build-%/setup.py:
	@echo " ==> Running setup.py build in $*"
	@cd $* && $(CONFIGURE_ENV) $(BUILD_ENV) python setup.py $(CONFIGURE_ARGS) build -x $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-%/setup.py: 
	@echo " ==> Running setup.py install in $*"
	@cd $* && $(CONFIGURE_ENV) $(INSTALL_ENV) python setup.py $(CONFIGURE_ARGS) install --skip-build $(INSTALL_ARGS)
	@$(MAKECOOKIE)
