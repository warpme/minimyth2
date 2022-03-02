
GARNAME      = python-gpiod
GARVERSION   = 1.5.3
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/c9/71/3c0d6a3744a80624324f9572b2b224fc7225fd050cef5df4440b238bcd1e/
DISTFILES    = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
LICENSE      = MIT

DEPENDS = system/libgpiod

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
