
GARNAME      = bootfiles-h313-tanix-tx1_v1.2
GARVERSION   = 2025-06-26
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               minimyth.conf \
               extlinux.conf \
               boot-kernel-via-usb.sh \
               load-kernel.txt \
               load-kernel.scr \
               install-howto.txt \

SOC_TYPE                  = h313
mm_U-BOOT_BOARD_TYPE      = board-h313.tanix_tx1_v1.2
mm_U-BOOT_BOARD_DEFCONFIG = tanix_tx1_v1.2_defconfig

INSTALL_SCRIPTS = extra
CLEAN_SCRIPTS   = extra

include ../bootloader/install-board-bootloader-aw.mk

install-extra:
	@cp -f    $(WORKSRC)/boot-kernel-via-usb.sh $(DESTDIR)/boot/
	@cp -f    $(WORKSRC)/install-howto.txt $(DESTDIR)/boot/
	@cp -f    $(WORKSRC)/load-kernel.txt $(DESTDIR)/boot/load-kernel.txt
	@cp -f    $(WORKSRC)/load-kernel.scr $(DESTDIR)/boot/load-kernel.scr
	@cp -f    $(build_DESTDIR)$(build_bindir)/sunxi-fel $(DESTDIR)/boot/
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-extra:
	@rm -f  $(DESTDIR)/boot/boot-kernel-via-usb.sh
	@rm -f  $(DESTDIR)/boot/load-kernel.txt
	@rm -f  $(DESTDIR)/boot/load-kernel.scr
	@rm -f  $(DESTDIR)/boot/sunxi-fel
	@rm -f  $(DESTDIR)/boot/install-howto.txt
