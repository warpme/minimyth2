
GARNAME      = xr819-firmware
GARVERSION   = XR_C01.08.52.65-Jul-16-2019
CATEGORIES   = firmware
MASTER_SITES = 
DISTFILES    = \
		boot_cw1x60.bin \
		sdd_cw1x60.bin \
		wsm_cw1x60.bin \

LICENSE      =
DESCRIPTION  =
define BLURB
endef

DEPENDS = 

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/xr819
	@cp -f $(WORKDIR)/boot_cw1x60.bin $(DESTDIR)$(elibdir)/firmware/xr819/boot_xr819.bin
	@cp -f $(WORKDIR)/sdd_cw1x60.bin  $(DESTDIR)$(elibdir)/firmware/xr819/sdd_xr819.bin
	@cp -f $(WORKDIR)/wsm_cw1x60.bin  $(DESTDIR)$(elibdir)/firmware/xr819/fw_xr819.bin
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/xr819*
