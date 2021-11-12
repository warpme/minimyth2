
GARNAME      = python-IMAPClient
GARVERSION   = 2.2.0
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/25/24/5142a1df57cf39fd758d0d80c73e179126229878d51d3f7d33928858001a/
DISTFILES    = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).zip
WORKSRC      = $(WORKDIR)/$(patsubst python-%,%,$(GARNAME))-$(GARVERSION)
LICENSE      =
DESCRIPTION = 
define BLURB
endef

DEPENDS = python3/python python3/python-setuptools

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
