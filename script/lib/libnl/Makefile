
GARNAME      = libnl
GARVERSION   = 3.9.0
CATEGORIES   = lib
MASTER_SITES = https://github.com/thom311/libnl/releases/download/libnl3_9_0/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.gz
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) \
	--build=$(GARBUILD) \
	--host=$(GARHOST) \
	--prefix="$(prefix)" \
	--sysconfdir="$(sysconfdir)" \
	--libexecdir="$(libexecdir)" \
	--disable-static \

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libnl-3.la
	@rm -f $(DESTDIR)$(libdir)/libnl-cli-3.la
	@rm -f $(DESTDIR)$(libdir)/libnl-genl-3.la
	@rm -f $(DESTDIR)$(libdir)/libnl-idiag-3.la
	@rm -f $(DESTDIR)$(libdir)/libnl-nf-3.la
	@rm -f $(DESTDIR)$(libdir)/libnl-route-3.la
	@rm -f $(DESTDIR)$(libdir)/libnl-xfrm-3.la
