
GARNAME      = python-lxml
GARVERSION   = 4.6.4
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/fe/4c/a4dbb4e389f75e69dbfb623462dfe0d0e652107a95481d40084830d29b37/
DISTFILES    = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
LICENSE      = BSD_3_Clause

DESCRIPTION = 
define BLURB
endef

DEPENDS   = python3/python python3/python-setuptools
BUILDDEPS = python3/python-crossenv

WORKSRC = $(WORKDIR)/$(patsubst python-%,%,$(GARNAME))-$(GARVERSION)

BUILD_SCRIPTS   = $(WORKSRC)/setup.py
INSTALL_SCRIPTS = $(WORKSRC)/setup.py

CONFIGURE_ARGS =
BUILD_ARGS     = \
	--with-xslt-config=$(DESTDIR)$(bindir)/xslt-config \
	--with-xml2-config=$(DESTDIR)$(bindir)/xml2-config \
	--without-cython \

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
