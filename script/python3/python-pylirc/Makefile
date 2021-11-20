
GARNAME      = python-pylirc2
GARVERSION   = 0.1
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/a9/e1/a19ed9cac5353ec07294be7b1aefc8f89985987b356e916e2c39b5b03d9a/
DISTFILES    = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
PATCHFILES   = pylirc2-0.1-fix-loading-pylirc-on-python3.patch
LICENSE      =
DESCRIPTION  =

DEPENDS   = system/lirc
BUILDDEPS =

WORKSRC = $(WORKDIR)/$(patsubst python-%,%,$(GARNAME))-$(GARVERSION)

CONFIGURE_ARGS =
BUILD_ARGS     =
INSTALL_ARGS   = \
	--prefix=$(DESTDIR)$(prefix)
CONFIGURE_ENV  =
BUILD_ENV      =
INSTALL_ENV    = \
	PYTHONPATH=$(DESTDIR)$(PYTHON_libdir)/site-packages

include ../../python3/python/python3-module.mk
include ../python/package-api.mk
