
export SOC_TYPE
export mm_U-BOOT_BOARD_TYPE
export mm_U-BOOT_BOARD_DEFCONFIG
export FIP_BOARD

WORKSRC      = $(WORKDIR)
LICENSE      = GPL2
DESCRIPTION  =
define BLURB
endef

INSTALL_SCRIPTS += bootloader
CLEAN_SCRIPTS   += bootloader

include ../../gar.mk

U-BOOT-AML = $(DESTDIR)$(libdir)/u-boot/$(SOC_TYPE)/$(mm_U-BOOT_BOARD_TYPE)/u-boot.uimg

$(U-BOOT-AML):
	@$(MAKE) clean install  -C ../u-boot-aml
	@$(MAKECOOKIE)

install-bootloader: $(U-BOOT-AML)
	@$(MAKE) clean-all install -C ../aml-bootscipts-vendor-uboot
	@mkdir -p $(DESTDIR)/boot
	@cp -f $(WORKSRC)/boot.config $(DESTDIR)/boot/boot.config
	@cp -f $(U-BOOT-AML) $(DESTDIR)/boot/u-boot.uimg
	@mkdir -p $(DESTDIR)/boot/board-config
	@cp -rf   $(WORKSRC)/$(mm_U-BOOT_BOARD_TYPE).config $(DESTDIR)/boot/board-config/
	@cp -f $(WORKSRC)/minimyth.conf $(DESTDIR)/boot/minimyth.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-bootloader:
	@rm -rf $(DESTDIR)/boot/board-config/$(mm_U-BOOT_BOARD_TYPE).config
	@rm -f  $(DESTDIR)/boot/boot.config
	@rm -f  $(DESTDIR)/boot/minimyth.conf
	@rm -f  $(DESTDIR)/boot/u-boot.uimg

clean-all: clean-bootloader cookieclean downloadclean
	@$(MAKE) clean-all -C ../aml-bootscipts-vendor-uboot
