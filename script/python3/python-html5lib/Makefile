
GARNAME      = python-html5lib
GARVERSION   = 1.1
CATEGORIES   = python
MASTER_SITES = https://github.com/html5lib/html5lib-python/archive/
DISTFILES    = $(GARVERSION).tar.gz
LICENSE      = MIT

DEPENDS = python3/python-six python3/python-webencodings

WORKSRC = $(WORKDIR)/html5lib-python-$(GARVERSION)

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

