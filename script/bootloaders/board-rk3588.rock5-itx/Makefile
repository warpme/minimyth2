
GARNAME      = bootfiles-rk3588.rock5-itx
GARVERSION   = 2025-10-03
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               minimyth.conf \
               extlinux.conf \

SOC_TYPE                  = rk3588
mm_U-BOOT_BOARD_TYPE      = board-rk3588.rock5-itx
mm_U-BOOT_BOARD_DEFCONFIG = rock-5-itx-rk3588_defconfig

export mm_U-BOOT_BOARD_TYPE
export mm_U-BOOT_BOARD_DEFCONFIG

WORKSRC      = $(WORKDIR)
LICENSE      = GPL2
DESCRIPTION  =
define BLURB
endef

INSTALL_SCRIPTS += bootloader
CLEAN_SCRIPTS   += bootloader

include ../../gar.mk

IDBLOADER = $(DESTDIR)$(libdir)/u-boot/$(SOC_TYPE)/$(mm_U-BOOT_BOARD_TYPE)/idbloader.img
U-BOOT    = $(DESTDIR)$(libdir)/u-boot/$(SOC_TYPE)/$(mm_U-BOOT_BOARD_TYPE)/u-boot.itb

$(IDBLOADER):
	@$(MAKE) clean install  -C ../u-boot-nanopi-m6
	@$(MAKECOOKIE)

$(U-BOOT):
	@$(MAKE) clean install  -C ../u-boot-nanopi-m6
	@$(MAKECOOKIE)

install-bootloader: $(IDBLOADER) $(U-BOOT)
	@mkdir -p $(DESTDIR)/boot/extlinux
	@mkdir -p $(DESTDIR)/boot/$(SOC_TYPE)loaderfiles
	@cp -f    $(IDBLOADER) $(DESTDIR)/boot/$(SOC_TYPE)loaderfiles/idbloader.img
	@cp -f    $(U-BOOT)    $(DESTDIR)/boot/$(SOC_TYPE)loaderfiles/u-boot.itb
	@cp -f    $(WORKSRC)/minimyth.conf $(DESTDIR)/boot/minimyth.conf
	@cp -f    $(WORKSRC)/extlinux.conf $(DESTDIR)/boot/extlinux/extlinux.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-bootloader:
	@rm -rf $(DESTDIR)/boot/$(SOC_TYPE)loaderfiles*
	@rm -f  $(DESTDIR)/boot/minimyth.conf
	@rm -rf $(DESTDIR)/boot/extlinux*

clean-all: clean-bootloader cookieclean downloadclean
	@rm -f $(IDBLOADER)
	@rm -f $(U-BOOT)
