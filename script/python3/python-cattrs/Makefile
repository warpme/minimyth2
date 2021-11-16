
GARNAME      = python-cattrs
GARVERSION   = 1.8.0
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/d3/6f/7f753ab5bff9c2522398437f9b08879b890a2ac4d880654029b9302a0a0b/
DISTFILES    = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
LICENSE      = 

DEPENDS = python3/python-attrs

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

