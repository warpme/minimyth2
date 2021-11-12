
GARNAME      = python-pycurl
GARVERSION   = 7.44.1
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/47/f9/c41d6830f7bd4e70d5726d26f8564538d08ca3a7ac3db98b325f94cdcb7f/
DISTFILES    = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
LICENSE      = LGPL2_1/$(GARNAME)
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING2

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lib/openssl net/curl python3/python python3/python-setuptools

WORKSRC = $(WORKDIR)/$(patsubst python-%,%,$(GARNAME))-$(GARVERSION)

BUILD_SCRIPTS   = $(WORKSRC)/setup.py
INSTALL_SCRIPTS = $(WORKSRC)/setup.py

CONFIGURE_ARGS =
BUILD_ARGS     = \
	--openssl-dir=$(DESTDIR)$(prefix) \
	--curl-config=$(DESTDIR)$(bindir)-config/curl-config
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
