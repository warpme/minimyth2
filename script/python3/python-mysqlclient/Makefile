
GARNAME      = python-mysqlclient
GARVERSION   = 1.3.14
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/f7/a2/1230ebbb4b91f42ad6b646e59eb8855559817ad5505d81c1ca2b5a216040/
DISTFILES    = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
LICENSE      =
DESCRIPTION  = 
define BLURB
endef

DEPENDS  = db/mariadb

WORKSRC = $(WORKDIR)/$(patsubst python-%,%,$(GARNAME))-$(GARVERSION)

CONFIGURE_ARGS =
BUILD_ARGS     =
INSTALL_ARGS   = \
	--prefix=$(DESTDIR)$(prefix)
CONFIGURE_ENV  =
BUILD_ENV      =
INSTALL_ENV    = \
	PYTHONPATH=$(DESTDIR)$(PYTHON_libdir)/site-packages

include ../python/python3-module.mk
include ../python/package-api.mk
