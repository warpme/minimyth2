
GARNAME      = python-url-normalize
GARVERSION   = 1.4.3
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/ec/ea/780a38c99fef750897158c0afb83b979def3b379aaac28b31538d24c4e8f/
DISTFILES    = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
LICENSE      = 

DEPENDS = python3/python-six

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

