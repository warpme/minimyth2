
GARNAME      = python-certifi
GARVERSION   = 2026.06.17
CATEGORIES   = python
MASTER_SITES = https://github.com/certifi/python-certifi/archive/refs/tags/
DISTFILES    = $(GARVERSION).tar.gz
LICENSE      = 

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

