
GARNAME      = python-exceptiongroup
GARVERSION   = 1.1.1
CATEGORIES   = python
MASTER_SITES = https://files.pythonhosted.org/packages/cc/38/57f14ddc8e8baeddd8993a36fe57ce7b4ba174c35048b9a6d270bb01e833/
DISTFILES    = $(patsubst python-%,%,$(GARNAME))-$(GARVERSION).tar.gz METADATA
LICENSE      = MIT

WORKSRC = $(WORKDIR)/$(patsubst python-%,%,$(GARNAME))-$(GARVERSION)

CONFIGURE_SCRIPTS   = 
BUILD_SCRIPTS   = 
INSTALL_SCRIPTS = custom

include ../../gar.mk
include ../python/package-api.mk

install-custom:
	@mkdir -p $(DESTDIR)$(PYTHON_libdir)/site-packages/exceptiongroup-1.1.1.dist-info
	@cp -f $(WORKDIR)/METADATA $(DESTDIR)$(PYTHON_libdir)/site-packages/exceptiongroup-1.1.1.dist-info/
	@mkdir -p $(DESTDIR)$(PYTHON_libdir)/site-packages/exceptiongroup
	@cp -rf $(WORKSRC)/src/exceptiongroup/* $(DESTDIR)$(PYTHON_libdir)/site-packages/exceptiongroup/
	@$(MAKECOOKIE)
