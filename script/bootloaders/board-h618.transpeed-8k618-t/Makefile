
GARNAME      = bootfiles-h618.transpeed-8k618-t
GARVERSION   = 2025-06-06
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               minimyth.conf       \
               extlinux.conf       \

export mm_U-BOOT_BOARD_TYPE      = board-h618.transpeed-8k618-t
export mm_U-BOOT_BOARD_DEFCONFIG = transpeed-8k618-t_defconfig

WORKSRC      = $(WORKDIR)
LICENSE = GPL2
DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom
CLEAN_SCRIPTS   = custom

include ../../gar.mk

build-custom:
	@$(MAKE) clean-all install -C ../u-boot-aw
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@mkdir -p $(DESTDIR)/boot/extlinux
	@cp -f    $(WORKSRC)/minimyth.conf $(DESTDIR)/boot/minimyth.conf
	@cp -f    $(WORKSRC)/extlinux.conf $(DESTDIR)/boot/extlinux/extlinux.conf
	@mkdir -p $(DESTDIR)/boot/h618loaderfiles
	@cp -f    $(DESTDIR)$(libdir)/u-boot/h618/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin \
		  $(DESTDIR)/boot/h618loaderfiles/u-boot-sunxi-with-spl.bin
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -rf $(DESTDIR)/boot/extlinux*
	@rm -rf $(DESTDIR)/boot/h618loaderfiles*
	@rm -f  $(DESTDIR)/boot/minimyth.conf

clean-all: clean-custom cookieclean
