GARNAME = python-Imaging
GARVERSION = 1.1.7
CATEGORIES = python
MASTER_SITES = http://effbot.org/downloads/
DISTFILES = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
PATCHFILES  = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION)-setuptools.patch
PATCHFILES += $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).patch.gar
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lib/freetype lib/libjpeg lib/libtiff devel/zlib python2/python
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
endif

GAR_EXTRA_CONF += python2/python/package-api.mk
include ../../gar.mk

CFLAGS  := $(CFLAGS)  -fPIC
LDFLAGS := $(LDFLAGS) -fPIC

CFLAGS  += -I$(DESTDIR)$(PYTHON_includedir)
CFLAGS  += -L$(DESTDIR)$(libdir)
LDFLAGS += -I$(DESTDIR)$(PYTHON_includedir)
LDFLAGS += -L$(DESTDIR)$(libdir)

build-%/setup.py:
	@echo " ==> Running setup.py build in $*"
	@cd $* && $(CONFIGURE_ENV) $(BUILD_ENV) python2 setup.py $(CONFIGURE_ARGS) build $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-%/setup.py: 
	@echo " ==> Running setup.py install in $*"
	@cd $* && $(CONFIGURE_ENV) $(INSTALL_ENV) python2 setup.py $(CONFIGURE_ARGS) install --skip-build $(INSTALL_ARGS)
	@$(MAKECOOKIE)
