
GARNAME      = aic8800_sdio-firmware
GARVERSION   = 20231212
CATEGORIES   = firmware
MASTER_SITES = 
DISTFILES    = aic_userconfig_8800d80.txt \
               fmacfw_8800d80_u02.bin \
               fw_adid_8800d80_u02.bin \
               fw_patch_8800d80_u02.bin \
               fw_patch_table_8800d80_u02.bin \
               lmacfw_rf_8800d80_u02.bin \

LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)

DEPENDS = 

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/aic8800_sdio
	@cp -Rdf $(WORKSRC)/* $(DESTDIR)$(elibdir)/firmware/aic8800_sdio/
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/aic8800_sdio
