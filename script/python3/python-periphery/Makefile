
GARNAME      = python-periphery
GARVERSION   = 2.3.0
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/2e/4b/1786dd5a9f93129f9673623a8776dfe18610a39c56bd5a32c777df5eefc4/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = MIT

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

