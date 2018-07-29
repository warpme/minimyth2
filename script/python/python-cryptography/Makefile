GARNAME = python-cryptography
GARVERSION = 1.3.1
CATEGORIES = python
MASTER_SITES = https://pypi.python.org/packages/b1/b8/f42fd854ed5b6f29a1b9c3778993753ff6ef138e4d892fdd61355d40508d/
DISTFILES = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
LICENSE =
DESCRIPTION = 
define BLURB
endef

DEPENDS = python/python python/python-distribute python/python-distutilscross python/python-setuptools \
          python/python-idna python/python-pyasn1 python/python-six \
          python/python-enum34 python/python-ipaddress python/python-cffi

BUILDDEPS = python/python-cffi python/python-pycparser

WORKSRC = $(WORKDIR)/$(patsubst python-%,%,$(GARNAME))-$(GARVERSION)

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

ifneq ($(DESTIMG),build)
BUILD_ARGS += --cross-compile
BUILD_ENV  += PYTHONXCPREFIX=$(DESTDIR)$(prefix)
BUILD_ENV  += CC=$(GARHOST)-gcc
BUILD_ENV  += LDSHARED="$(GARHOST)-gcc -shared"
endif

GAR_EXTRA_CONF += python/python/package-api.mk
include ../../gar.mk

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
	@cd $* && $(CONFIGURE_ENV) $(BUILD_ENV) python setup.py $(CONFIGURE_ARGS) build $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-%/setup.py: 
	@echo " ==> Running setup.py install in $*"
	@cd $* && $(CONFIGURE_ENV) $(INSTALL_ENV) python setup.py $(CONFIGURE_ARGS) install --skip-build $(INSTALL_ARGS)
	@$(MAKECOOKIE)
