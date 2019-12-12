GARNAME = wireless-regdb
GARVERSION = 2019.06.03
CATEGORIES = kernel
MASTER_SITES = https://www.kernel.org/pub/software/network/wireless-regdb/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE
DESCRIPTION =
define BLURB
endef

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/
	@cp -Rdf $(WORKSRC)/regulatory.db     $(DESTDIR)$(elibdir)/firmware/regulatory.db
	@cp -Rdf $(WORKSRC)/regulatory.db.p7s $(DESTDIR)$(elibdir)/firmware/regulatory.db.p7s
	@mkdir -p $(DESTDIR)$(libdir)/crda/
	@cp -Rdf $(WORKSRC)/regulatory.bin $(DESTDIR)$(libdir)/crda/regulatory.bin
	@mkdir -p $(DESTDIR)$(libdir)/crda/pubkeys/
	@cp -Rdf $(WORKSRC)/sforshee.key.pub.pem $(DESTDIR)$(libdir)/crda/pubkeys/sforshee.key.pub.pem
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(elibdir)/firmware/regulatory.db
	@rm -rf $(DESTDIR)$(elibdir)/firmware/regulatory.db.p7s
	@rm -rf $(DESTDIR)$(libdir)/crda*
