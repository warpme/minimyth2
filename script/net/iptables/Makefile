
GARNAME      = iptables
GARVERSION   = 1.8.10
CATEGORIES   = new
MASTER_SITES = https://www.netfilter.org/projects/iptables/files/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.xz
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/readline lib/libmnl lib/libnftnl

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile


CONFIGURE_ARGS = $(DIRPATHS) \
	--build=$(GARBUILD) \
	--host=$(GARHOST) \
	--prefix="$(prefix)" \

include ../../gar.mk

post-install:
	@mkdir -p $(DESTDIR)$(sysconfdir)/ethertypes
	@cp -rf $(WORKSRC)/etc/ethertypes $(DESTDIR)$(sysconfdir)/ethertypes/
	@mkdir -p $(DESTDIR)$(sysconfdir)/iptables
	@# cp -rf $(WORKSRC)/etc/xtables.conf $(DESTDIR)$(sysconfdir)/iptables/
	@rm -f $(DESTDIR)$(libdir)/libip4tc.la
	@rm -f $(DESTDIR)$(libdir)/libip6tc.la
	@rm -f $(DESTDIR)$(libdir)/libxtables.la
	@$(MAKECOOKIE)
