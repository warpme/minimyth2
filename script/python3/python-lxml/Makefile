
GARNAME      = python-lxml
GARVERSION   = 5.2.1
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/ea/e2/3834472e7f18801e67a3cd6f3c203a5456d6f7f903cfb9a990e62098a2f3/
DISTFILES    = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz
LICENSE      = BSD_3_Clause

WORKSRC = $(WORKDIR)/$(patsubst python-%,%,$(GARNAME))-$(GARVERSION)

CONFIGURE_ARGS =
BUILD_ARGS     = \
	--with-xslt-config=$(DESTDIR)$(bindir)/xslt-config \
	--with-xml2-config=$(DESTDIR)$(bindir)/xml2-config \
	--without-cython \

INSTALL_ARGS   = \
	--prefix=$(DESTDIR)$(prefix)
CONFIGURE_ENV  =
BUILD_ENV      =
INSTALL_ENV    = \
	PYTHONPATH=$(DESTDIR)$(PYTHON_libdir)/site-packages

include ../../python3/python/python3-module.mk
include ../python/package-api.mk

CFLAGS  += -Wno-incompatible-pointer-types
