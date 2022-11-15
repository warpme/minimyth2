GARNAME      = zram-swap
GARVERSION   = 205ea1ec5b169f566e5e98ead794e9daf90cf245
CATEGORIES   = firmware
MASTER_SITES = https://github.com/foundObjects/zram-swap/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      = MIT
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)/zram-swap-$(GARVERSION)

DEPENDS = utils/util-linux

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp -Rdf $(WORKSRC)/zram-swap.sh $(DESTDIR)$(bindir)/zram-swap
	@mkdir -p $(DESTDIR)$(sysconfdir)/default
	@cp -Rdf $(WORKSRC)/service/zram-swap.config $(DESTDIR)$(sysconfdir)/default/zram-swap
	@# change default compression algo to lzo
	@sed -i "s|_zram_algorithm=.*|_zram_algorithm=\"lzo\"|" $(DESTDIR)$(sysconfdir)/default/zram-swap
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(bindir)/zram-swap
	@rm -rf $(DESTDIR)$(sysconfdir)/default/zram-swap
