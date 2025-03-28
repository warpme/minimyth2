
GARNAME      = python-urlgrabber
GARVERSION   = 4.1.0
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/b1/23/61cb4d829138f24bfae2c77af6794ddd67240811dbb4e3e2eb22c4f57742/
DISTFILES    = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
LICENSE      = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c python2/python python2/python-pycurl
BUILDDEPS = python2/python-distutilscross

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
BUILD_ENV  += CC=x86_64-minimyth-linux-gnu-gcc
BUILD_ENV  += LDSHARED="x86_64-minimyth-linux-gnu-gcc -shared"
endif

GAR_EXTRA_CONF += python2/python/package-api.mk
include ../../gar.mk

pre-configure:
ifeq ($(DESTIMG),build)
	@$(call PYTHON2_SET_BUILD_SYSCONF)
endif
	@$(MAKECOOKIE)

post-install:
ifeq ($(DESTIMG),build)
	@$(call PYTHON2_SET_MAIN_SYSCONF)
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
