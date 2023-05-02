
GARNAME      = python-cattrs
GARVERSION   = 22.2.0
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/fc/da/ff3239eb4241cbc6f8b69f53d4ca27a178d51f9e5a954f1a3588c8227dc5/
DISTFILES    = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
LICENSE      = 

DEPENDS = python3/python-attrs python3/python-exceptiongroup

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

