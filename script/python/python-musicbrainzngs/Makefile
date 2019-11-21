GARNAME = python-musicbrainzngs
GARVERSION = 0.6
CATEGORIES = python
MASTER_SITES = https://github.com/alastair/python-musicbrainzngs/archive/
DISTFILES = $(patsubst python-%,%,v$(GARVERSION)).tar.gz
LICENSE =
DESCRIPTION = 
define BLURB
endef

DEPENDS = python/python python/python-distribute python/python-distutilscross

BUILDDEPS = python/python-pytz

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
