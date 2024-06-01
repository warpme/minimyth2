
GARNAME      = libnftnl
GARVERSION   = 1.2.6
CATEGORIES   = lib
MASTER_SITES = https://netfilter.org/projects/libnftnl/files/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.xz
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/libmnl

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile


CONFIGURE_ARGS = $(DIRPATHS) \
	--build=$(GARBUILD) \
	--host=$(GARHOST) \
	--prefix="$(prefix)" \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libnftnl.la
	@$(MAKECOOKIE)
