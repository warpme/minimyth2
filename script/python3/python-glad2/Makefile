
GARNAME      = python-glad2
GARVERSION   = 2.0.5
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/21/95/228380a07a2d4a50a82e3fe6f8e04759b103f680fefdee4fcf08b3937cbf/
DISTFILES    = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
LICENSE      = GPL

DEPENDS = python3/python python3/python-lxml python3/python-setuptools python3/python-Jinja2

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

