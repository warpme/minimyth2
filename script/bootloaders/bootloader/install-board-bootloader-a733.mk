
export mm_U-BOOT_BOARD_TYPE
export mm_U-BOOT_BOARD_DEFCONFIG
export CRUST_CONFIG

WORKSRC      = $(WORKDIR)
LICENSE      = GPL2
DESCRIPTION  =
define BLURB
endef

INSTALL_SCRIPTS += bootloader
CLEAN_SCRIPTS   += bootloader

include ../../gar.mk

BOOT0    = $(DESTDIR)$(libdir)/u-boot/$(SOC_TYPE)/$(mm_U-BOOT_BOARD_TYPE)/boot0_sdcard.bin
BOOT_FEX = $(DESTDIR)$(libdir)/u-boot/$(SOC_TYPE)/$(mm_U-BOOT_BOARD_TYPE)/boot_package.fex

$(BOOT0):
$(BOOT_FEX):
	@$(MAKE) clean install  -C ../u-boot-a733
	@$(MAKECOOKIE)

install-bootloader: $(U-BOOT-SUNXI-WITH-SPL)
	@mkdir -p $(DESTDIR)/boot/extlinux
	@mkdir -p $(DESTDIR)/boot/$(SOC_TYPE)loaderfiles
	@cp -f    $(BOOT0) $(DESTDIR)/boot/$(SOC_TYPE)loaderfiles/boot0_sdcard.bin
	@cp -f    $(BOOT_FEX) $(DESTDIR)/boot/$(SOC_TYPE)loaderfiles/boot_package.fex
	@cp -f    $(WORKSRC)/minimyth.conf $(DESTDIR)/boot/minimyth.conf
	@cp -f    $(WORKSRC)/extlinux.conf $(DESTDIR)/boot/extlinux/extlinux.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-bootloader:
	@rm -rf $(DESTDIR)/boot/$(SOC_TYPE)loaderfiles*
	@rm -f  $(DESTDIR)/boot/minimyth.conf
	@rm -rf $(DESTDIR)/boot/extlinux*

clean-all: clean-bootloader cookieclean downloadclean
	@rm -f $(BOOT0)
