
GARNAME      = python-pyelftools
GARVERSION   = 0.27
CATEGORIES   = python
MASTER_SITES = https://github.com/eliben/$(patsubst python-%,%,$(GARNAME))/archive/v$(GARVERSION)/
DISTFILES    = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
LICENSE      = GPL

DEPENDS = 
BUILDDEPS = 

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
