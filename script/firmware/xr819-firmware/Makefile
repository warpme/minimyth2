GARNAME      = armbian-firmware
GARVERSION   = 044da7528ba6b0e96e7b67e01cd67f8d2639bcd1
CATEGORIES   = firmware
MASTER_SITES = https://github.com/armbian/firmware/archive/
DISTFILES    = $(GARVERSION).zip \
		boot_cw1x60.bin \
		sdd_cw1x60.bin \
		wsm_cw1x60.bin \

LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)/firmware-$(GARVERSION)

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/
	@cp -Rdf $(WORKSRC)/xr819 $(DESTDIR)$(elibdir)/firmware/
	@cp -f $(WORKDIR)/boot_cw1x60.bin $(DESTDIR)$(elibdir)/firmware/
	@cp -f $(WORKDIR)/sdd_cw1x60.bin  $(DESTDIR)$(elibdir)/firmware/
	@cp -f $(WORKDIR)/wsm_cw1x60.bin  $(DESTDIR)$(elibdir)/firmware/
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/xr819*
