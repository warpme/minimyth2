
GARNAME      = python-setuptools
GARVERSION   = 59.0.1
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/cd/9a/6fff2cee92de1d34c0e8d48bb2ccedb0899eebb2cfe7955584b53bdaded7/
DISTFILES    = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
LICENSE      =

BUILDDEPS    = python3/python

WORKSRC = $(WORKDIR)/$(patsubst python-%,%,$(GARNAME))-$(GARVERSION)

CONFIGURE_ARGS =
BUILD_ARGS     =
INSTALL_ARGS   = \
	--prefix=$(DESTDIR)$(prefix)
CONFIGURE_ENV  =
BUILD_ENV      =
INSTALL_ENV    = \
	PYTHONPATH=$(DESTDIR)$(PYTHON_libdir)/site-packages

BUILD_SCRIPTS   = $(WORKSRC)/setup.py
INSTALL_SCRIPTS = $(WORKSRC)/setup.py

include ../../gar.mk
include ../python/package-api.mk

pre-configure:
ifeq ($(DESTIMG),build)
	echo "Setting _sysconfigdata__linux_x86_64-linux-gnu.py to host config as DESTIMG=build"; \
	cp -v $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata__linux_x86_64-linux-gnu.py.build \
	      $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata__linux_x86_64-linux-gnu.py; \
	rm -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/__pycache__/_sysconfigdata__*.pyc
endif
	@$(MAKECOOKIE)

post-install:
ifeq ($(DESTIMG),build)
	echo "Restoring _sysconfigdata__linux_x86_64-linux-gnu.py to target config"; \
	cp -v $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata__linux_x86_64-linux-gnu.py.main \
	      $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata__linux_x86_64-linux-gnu.py; \
	rm -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/__pycache__/_sysconfigdata__*.pyc
endif
	@$(MAKECOOKIE)

build-%/setup.py:
	@echo " ==> Running setup.py build in $*"
	@cd $* && $(CONFIGURE_ENV) $(BUILD_ENV) python3 setup.py $(CONFIGURE_ARGS) build $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-%/setup.py:
	@echo " ==> Running setup.py install in $*"
	@cd $* && $(CONFIGURE_ENV) $(INSTALL_ENV) python3 setup.py $(CONFIGURE_ARGS) install --skip-build $(INSTALL_ARGS)
	@$(MAKECOOKIE)
