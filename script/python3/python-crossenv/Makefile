
GARNAME      = python-crossenv
GARVERSION   = 1.1.4
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/90/c5/18a3058ac6d607ac7444219fe0f453d26eea2652ee00d981ded5c08900a5/
DISTFILES    = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
LICENSE      =
DESCRIPTION  = 
define BLURB
endef

DEPENDS = python3/python python3/python-setuptools

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
	@cd $* && $(CONFIGURE_ENV) $(BUILD_ENV) python3 setup.py $(CONFIGURE_ARGS) build $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-%/setup.py:
	@echo " ==> Running setup.py install in $*"
	@cd $* && $(CONFIGURE_ENV) $(INSTALL_ENV) python3 setup.py $(CONFIGURE_ARGS) install --skip-build $(INSTALL_ARGS)
	@$(MAKECOOKIE)

post-install:
	@echo " ==> Creating crossenv from $(main_DESTDIR)/usr/bin/python3 in $(DESTDIR)$(bindir)/python3-crossenv"
	@cd $* && python3 -m crossenv $(main_DESTDIR)/usr/bin/python3 $(DESTDIR)$(bindir)/python3-crossenv
	@$(MAKECOOKIE)
