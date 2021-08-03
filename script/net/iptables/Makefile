
GARNAME      = iptables
GARVERSION   = 1.8.7
CATEGORIES   = new
MASTER_SITES = https://www.netfilter.org/projects/iptables/files/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.bz2
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/readline

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile


CONFIGURE_ARGS = $(DIRPATHS) \
	--build=$(GARBUILD) \
	--host=$(GARHOST) \
	--prefix="$(prefix)" \
	--disable-nftables \

include ../../gar.mk

post-install:
	@cp -rf $(WORKSRC)/etc/ethertypes $(DESTDIR)$(sysconfdir)/
	@mkdir -p $(DESTDIR)$(sysconfdir)/iptables
	@cp -rf $(WORKSRC)/etc/xtables.conf $(DESTDIR)$(sysconfdir)/iptables/
	@rm -f $(DESTDIR)$(libdir)/libip4tc.la
	@rm -f $(DESTDIR)$(libdir)/libip6tc.la
	@rm -f $(DESTDIR)$(libdir)/libxtables.la
	@$(MAKECOOKIE)
