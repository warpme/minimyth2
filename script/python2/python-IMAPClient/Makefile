
GARNAME      = python-IMAPClient
GARVERSION   = 1.1.0
CATEGORIES   = python
MASTER_SITES = https://github.com/mjs/imapclient/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/imapclient-$(GARVERSION)
# PATCHFILES = $(DISTNAME)-use-distutils.patch
LICENSE =
DESCRIPTION = 
define BLURB
endef

DEPENDS = python2/python python2/python-distribute python2/python-distutilscross \
          python2/python-pyOpenSSL python2/python-backports.ssl

BUILDDEPS = python2/python-Sphinx python2/python-pyOpenSSL python2/python-backports.ssl

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

GAR_EXTRA_CONF += python2/python/package-api.mk
include ../../gar.mk

build-%/setup.py:
	@echo " ==> Running setup.py build in $*"
	@cd $* && $(CONFIGURE_ENV) $(BUILD_ENV) python2 setup.py $(CONFIGURE_ARGS) build $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-%/setup.py: 
	@echo " ==> Running setup.py install in $*"
	@cd $* && $(CONFIGURE_ENV) $(INSTALL_ENV) python2 setup.py $(CONFIGURE_ARGS) install --skip-build $(INSTALL_ARGS)
	@$(MAKECOOKIE)
