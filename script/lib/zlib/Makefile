GARNAME = zlib
GARVERSION = 1.2.7
CATEGORIES = lib
MASTER_SITES  = http://downloads.sourceforge.net/project/libpng/$(GARNAME)/$(GARVERSION)/
MASTER_SITES += http://zlib.net/
DISTFILES  = $(DISTNAME).tar.gz
DISTFILES += license
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKDIR)/license

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	--prefix=$(prefix) \
	--eprefix=$(exec_prefix) \
     	--libdir=$(libdir) \
	--includedir=$(includedir) \
	--shared

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libz.a
	@$(MAKECOOKIE)
