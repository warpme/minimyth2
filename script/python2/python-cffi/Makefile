GARNAME = python-cffi
GARVERSION = 1.11.5
CATEGORIES = python
MASTER_SITES = https://pypi.python.org/packages/source/c/cffi/
DISTFILES = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
LICENSE =
DESCRIPTION = 
define BLURB
endef

DEPENDS = python2/python python2/python-distribute python2/python-pycparser
ifneq ($(DESTIMG),build)
BUILDDEPS += python2/python-distutilscross python2/python-cffi
endif


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
	@# Switch python setup.py to use host _sysconfigdata.py for
	@# compiltion of C modules
	@$(call PYTHON2_SET_BUILD_SYSCONF)
endif
	@$(MAKECOOKIE)

post-install:
ifeq ($(DESTIMG),build)
	@# Restore python setup.py to use targer _sysconfigdata.py for
	@# compiltion of C modules
	@$(call PYTHON2_SET_MAIN_SYSCONF)
endif
# FIXME XXXXX
ifneq ($(DESTIMG),build)
	@cd $(DESTDIR)$(libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/site-packages/cffi-$(GARVERSION)-*.egg/ ; cp _cffi_backend.so _cffi_backend.so.target
	@cp -v $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/site-packages/cffi-$(GARVERSION)-*.egg/_cffi_backend.so \
	 "$(DESTDIR)$(libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/site-packages/cffi-$(GARVERSION)"*
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
