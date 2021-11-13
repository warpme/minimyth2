GARNAME = python-cryptography
GARVERSION = 2.9.2
CATEGORIES = python
MASTER_SITES = https://pypi.io/packages/source/c/cryptography/
DISTFILES = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
PATCHFILES = cryptography-2.9.2-hack-for-compile.patch
LICENSE =
DESCRIPTION = 
define BLURB
endef

DEPENDS = python2/python python2/python-distribute python2/python-distutilscross python2/python-setuptools \
          python2/python-idna python2/python-pyasn1 python2/python-six \
          python2/python-enum34 python2/python-ipaddress python2/python-cffi

BUILDDEPS = python2/python-cffi python2/python-pycparser

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

GAR_EXTRA_CONF += python2/python/package-api.mk
include ../../gar.mk

pre-configure:
ifeq ($(DESTIMG),build)
	@$(call PYTHON2_SET_BUILD_SYSCONF)
endif
	@$(MAKECOOKIE)

post-install:
ifeq ($(DESTIMG),build)
	@$(call PYTHON2_SET_MAIN_SYSCONF)
endif
	@$(MAKECOOKIE)

build-%/setup.py:
	@echo " ==> Running setup.py build in $*"
	@cd $* && $(CONFIGURE_ENV) $(BUILD_ENV) python2 setup.py $(CONFIGURE_ARGS) build $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-%/setup.py: 
	@echo " ==> Running setup.py install in $*"
	@cd $* && $(CONFIGURE_ENV) $(INSTALL_ENV) python2 setup.py $(CONFIGURE_ARGS) install --skip-build $(INSTALL_ARGS)
	@$(MAKECOOKIE)
