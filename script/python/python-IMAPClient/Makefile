GARNAME = python-IMAPClient
GARVERSION = 1.0.1
CATEGORIES = python
MASTER_SITES = http://freshfoo.com/projects/IMAPClient/
DISTFILES = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).zip
PATCHFILES = $(DISTNAME)-use-distutils.patch
LICENSE =
DESCRIPTION = 
define BLURB
endef

DEPENDS = python/python python/python-distribute python/python-distutilscross \
          python/python-backports.ssl python/python-pyOpenSSL python/python-six

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

GAR_EXTRA_CONF += python/python/package-api.mk
include ../../gar.mk

build-%/setup.py:
	@echo " ==> Running setup.py build in $*"
	@cd $* && $(CONFIGURE_ENV) $(BUILD_ENV) python setup.py $(CONFIGURE_ARGS) build $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-%/setup.py: 
	@echo " ==> Running setup.py install in $*"
	@cd $* && $(CONFIGURE_ENV) $(INSTALL_ENV) python setup.py $(CONFIGURE_ARGS) install --skip-build $(INSTALL_ARGS)
	@$(MAKECOOKIE)
