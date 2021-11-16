
GARNAME      = python-urlgrabber
GARVERSION   = 4.1.0
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/b1/23/61cb4d829138f24bfae2c77af6794ddd67240811dbb4e3e2eb22c4f57742/
DISTFILES    = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
LICENSE      = LGPL2_1

DEPENDS = python3/python-pycurl

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
