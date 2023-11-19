
GARNAME      = python-prctl
GARVERSION   = 1.8.1
CATEGORIES   = python
MASTER_SITES = https://github.com/seveas/python-prctl/archive/
DISTFILES    = v$(GARVERSION).tar.gz
LICENSE      = GPL

DEPENDS = python3/python lib/libcap

WORKSRC = $(WORKDIR)/$(GARNAME)-$(GARVERSION)

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
