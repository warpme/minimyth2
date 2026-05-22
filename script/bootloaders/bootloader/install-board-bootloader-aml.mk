
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

U-BOOT-AML = $(DESTDIR)$(libdir)/u-boot/$(SOC_TYPE)/$(mm_U-BOOT_BOARD_TYPE)/u-boot.bin.sd.bin

$(U-BOOT-AML):
	@$(MAKE) clean install  -C ../u-boot-aml
	@$(MAKECOOKIE)

install-bootloader: $(U-BOOT-AML)
	@mkdir -p $(DESTDIR)/boot/extlinux
	@mkdir -p $(DESTDIR)/boot/$(SOC_TYPE)loaderfiles
	@cp -f    $(U-BOOT-AML) $(DESTDIR)/boot/$(SOC_TYPE)loaderfiles/u-boot.bin.sd.bin
	@cp -f    $(WORKSRC)/minimyth.conf $(DESTDIR)/boot/minimyth.conf
	@cp -f    $(WORKSRC)/extlinux.conf $(DESTDIR)/boot/extlinux/extlinux.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-bootloader:
	@rm -rf $(DESTDIR)/boot/$(SOC_TYPE)loaderfiles*
	@rm -f  $(DESTDIR)/boot/minimyth.conf
	@rm -rf $(DESTDIR)/boot/extlinux*

clean-all: clean-bootloader cookieclean downloadclean
	@rm -f $(U-BOOT-AML)
