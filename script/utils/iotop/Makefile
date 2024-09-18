
GARNAME      = iotop
GARVERSION   = 0.6
CATEGORIES   = utils
MASTER_SITES = http://guichaz.free.fr/iotop/files/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = remove-install-in-sbin-hack.patch
LICENSE      = GPL
DESCRIPTION = 
define BLURB
endef

BUILDDEPS = python3/python python3/python-setuptools

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
	@sed 's|.*/usr/bin/python3|#!/usr/bin/python3|g' -i $(DESTDIR)$(bindir)/iotop
	@$(MAKECOOKIE)
