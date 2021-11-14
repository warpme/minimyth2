
GARNAME      = python-urlgrabber
GARVERSION   = 4.1.0
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/b1/23/61cb4d829138f24bfae2c77af6794ddd67240811dbb4e3e2eb22c4f57742/
DISTFILES    = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
LICENSE      = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = python3/python python3/python-setuptools
BUILDDEPS = python3/python-crossenv

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

GAR_EXTRA_CONF += python3/python/package-api.mk
include ../../gar.mk

build-%/setup.py:
	@echo " ==> Running setup.py build in $*"
	@cd $* && . $(build_DESTDIR)$(build_bindir)/python3-crossenv/bin/activate && python3 setup.py $(CONFIGURE_ARGS) build $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-%/setup.py:
	@echo " ==> Running setup.py install in $*"
	@cd $* && . $(build_DESTDIR)$(build_bindir)/python3-crossenv/bin/activate && python3 setup.py $(CONFIGURE_ARGS) install --skip-build $(INSTALL_ARGS)
	@$(MAKECOOKIE)
