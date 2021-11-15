
GARNAME      = python-pycurl
GARVERSION   = 7.44.1
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/47/f9/c41d6830f7bd4e70d5726d26f8564538d08ca3a7ac3db98b325f94cdcb7f/
DISTFILES    = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
LICENSE      = 

DEPENDS   = lang/c lib/openssl net/curl

WORKSRC = $(WORKDIR)/$(patsubst python-%,%,$(GARNAME))-$(GARVERSION)

CONFIGURE_ARGS =
BUILD_ARGS     = \
	--openssl-dir=$(DESTDIR)$(prefix) \
	--curl-config=$(DESTDIR)$(bindir)-config/curl-config
INSTALL_ARGS   = \
	--prefix=$(DESTDIR)$(prefix)
CONFIGURE_ENV  =
BUILD_ENV      =
INSTALL_ENV    = \
	PYTHONPATH=$(DESTDIR)$(PYTHON_libdir)/site-packages

include ../../python3/python/python3-module.mk
