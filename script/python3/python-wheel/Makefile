
GARNAME      = python-wheel
GARVERSION   = 0.42.0
CATEGORIES   = python
MASTER_SITES = https://github.com/pypa/wheel/archive/
DISTFILES    = $(GARVERSION).tar.gz
LICENSE      = MIT

DEPENDS = python3/python python3/python-packaging

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
