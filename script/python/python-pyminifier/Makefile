GARNAME = python-pyminifier
GARVERSION = 1.3
CATEGORIES = python
MASTER_SITES = http://code.activestate.com/recipes/576704-python-code-minifier/download/1/
DISTFILES = pyminifier.py
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = python/python

DISTNAME = $(GARNAME)

INSTALL_SCRIPTS = custom

include ../../gar.mk

extract-pyminifier.py:
	@mkdir -p $(WORKSRC)
	@cp -f $(DOWNLOADDIR)/pyminifier.py $(WORKSRC)/
	@$(MAKECOOKIE)

post-patch:
	@sed -i 's%^#!/usr/bin/env python%#!$(bindir)/python%' -i $(WORKSRC)/pyminifier.py
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp -r $(WORKSRC)/pyminifier.py $(DESTDIR)$(bindir)/pyminifier.py
	@chmod 755 $(DESTDIR)$(bindir)/pyminifier.py
	@$(MAKECOOKIE)
