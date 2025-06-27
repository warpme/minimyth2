
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

U-BOOT-SUNXI-WITH-SPL = $(DESTDIR)$(libdir)/u-boot/$(SOC_TYPE)/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin

$(U-BOOT-SUNXI-WITH-SPL):
	@$(MAKE) clean install  -C ../u-boot-a523
	@$(MAKECOOKIE)

install-bootloader: $(U-BOOT-SUNXI-WITH-SPL)
	@mkdir -p $(DESTDIR)/boot/extlinux
	@mkdir -p $(DESTDIR)/boot/$(SOC_TYPE)loaderfiles
	@cp -f    $(U-BOOT-SUNXI-WITH-SPL) $(DESTDIR)/boot/$(SOC_TYPE)loaderfiles/u-boot-sunxi-with-spl.bin
	@cp -f    $(WORKSRC)/minimyth.conf $(DESTDIR)/boot/minimyth.conf
	@cp -f    $(WORKSRC)/extlinux.conf $(DESTDIR)/boot/extlinux/extlinux.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-bootloader:
	@rm -rf $(DESTDIR)/boot/$(SOC_TYPE)loaderfiles*
	@rm -f  $(DESTDIR)/boot/minimyth.conf
	@rm -rf $(DESTDIR)/boot/extlinux*

clean-all: clean-bootloader cookieclean downloadclean
	@rm -f $(U-BOOT-SUNXI-WITH-SPL)
