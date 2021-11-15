
GARNAME      = python-lxml
GARVERSION   = 4.6.4
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/fe/4c/a4dbb4e389f75e69dbfb623462dfe0d0e652107a95481d40084830d29b37/
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
