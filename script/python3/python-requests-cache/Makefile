
GARNAME      = python-requests-cache
GARVERSION   = 0.8.1
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/12/c2/cbdf169cb621aeb8b0f1097e357b65e018a30079501fc88c9f889ad61b00/
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
