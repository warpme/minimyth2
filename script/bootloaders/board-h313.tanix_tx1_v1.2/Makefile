
GARNAME      = bootfiles-h313-tanix-tx1
GARVERSION   = 2024-04-18
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               minimyth.conf \
               extlinux.conf \
               boot-kernel-via-usb.sh \
               load-kernel.txt \
               load-kernel.scr \
               install-howto.txt \

export mm_U-BOOT_BOARD_TYPE = tanix_tx1_v1.2_defconfig

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

BUILDDEPS = utils/sunxi-tools

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom
CLEAN_SCRIPTS   = custom

include ../../gar.mk

build-custom:
	@$(MAKE) clean-all install -C ../u-boot-h616
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@mkdir -p $(DESTDIR)/boot/extlinux
	@cp -f    $(WORKSRC)/minimyth.conf $(DESTDIR)/boot/minimyth.conf
	@cp -f    $(WORKSRC)/extlinux.conf $(DESTDIR)/boot/extlinux/extlinux.conf
	@cp -f    $(WORKSRC)/boot-kernel-via-usb.sh $(DESTDIR)/boot/
	@cp -f    $(WORKSRC)/install-howto.txt $(DESTDIR)/boot/
	@cp -f    $(WORKSRC)/load-kernel.txt $(DESTDIR)/boot/load-kernel.txt
	@cp -f    $(WORKSRC)/load-kernel.scr $(DESTDIR)/boot/load-kernel.scr
	@cp -f    $(build_DESTDIR)$(build_bindir)/sunxi-fel $(DESTDIR)/boot/
	@mkdir -p $(DESTDIR)/boot/h313loaderfiles
	@cp -f    $(DESTDIR)$(libdir)/u-boot/h616/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin \
		  $(DESTDIR)/boot/h313loaderfiles/u-boot-sunxi-with-spl.bin
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -rf $(DESTDIR)/boot/extlinux*
	@rm -rf $(DESTDIR)/boot/h313loaderfiles*
	@rm -f  $(DESTDIR)/boot/minimyth.conf
	@rm -f  $(DESTDIR)/boot/boot-kernel-via-usb.sh
	@rm -f  $(DESTDIR)/boot/load-kernel.txt
	@rm -f  $(DESTDIR)/boot/load-kernel.scr
	@rm -f  $(DESTDIR)/boot/sunxi-fel
	@rm -f  $(DESTDIR)/boot/install-howto.txt

clean-all: clean-custom cookieclean
