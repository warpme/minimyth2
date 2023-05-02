
GARNAME      = python-requests_cache
GARVERSION   = 0.9.8
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/c6/63/76613d73fb4ec23cc2451c1be30974a373c7258274db2e4f79530bda505d/
DISTFILES    = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
LICENSE      =

DEPENDS = \
	python3/python-requests \
	python3/python-url-normalize \
	python3/python-cattrs \
	python3/python-appdirs \

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
