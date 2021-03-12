
GARNAME      = bootfiles-rpi34.mainline64
GITHASH      = 0591568b29a724de406aa737fc8e13f68c423f3f
GARVERSION   = 2021-03-11-$(GITHASH)
CATEGORIES   = bootloaders
MASTER_SITES = https://github.com/raspberrypi/firmware/raw/$(GITHASH)/boot/
DISTFILES    = config.txt             \
               cmdline.txt            \
               bootcode.bin           \
               boot.txt               \
               boot.scr               \
               fixup4cd.dat           \
               fixup4.dat             \
               fixup4x.dat            \
               start4cd.elf           \
               start4.elf             \
               start4x.elf            \
               bcm2711-rpi-4-b.dtb    \
               bcm2710-rpi-3-b-plus.dtb \
               bcm2710-rpi-3-b.dtb    \

WORKSRC      = $(WORKDIR)

export mm_U-BOOT_BOARD_TYPE = rpi_arm64_defconfig

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

build-custom:
	@$(MAKE) clean-all install -C ../u-boot-rpi
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f $(WORKSRC)/boot.scr            $(DESTDIR)/boot/boot.scr
	@cp -f $(WORKSRC)/boot.txt            $(DESTDIR)/boot/boot.txt
	@cp -f $(WORKSRC)/config.txt          $(DESTDIR)/boot/config.txt
	@cp -f $(WORKSRC)/cmdline.txt         $(DESTDIR)/boot/cmdline.txt
	@cp -f $(WORKSRC)/bootcode.bin        $(DESTDIR)/boot/bootcode.bin
	@cp -f $(WORKSRC)/fixup4.dat          $(DESTDIR)/boot/fixup4.dat
	@cp -f $(WORKSRC)/fixup4cd.dat        $(DESTDIR)/boot/fixup4cd.dat
	@cp -f $(WORKSRC)/fixup4x.dat         $(DESTDIR)/boot/fixup4x.dat
	@cp -f $(WORKSRC)/start4.elf          $(DESTDIR)/boot/start4.elf
	@cp -f $(WORKSRC)/start4cd.elf        $(DESTDIR)/boot/start4cd.elf
	@cp -f $(WORKSRC)/start4x.elf         $(DESTDIR)/boot/start4x.elf
	@cp -f $(WORKSRC)/bcm2710-rpi-3-b-plus.dtb $(DESTDIR)/boot/bcm2710-rpi-3-b-plus.dtb
	@cp -f $(WORKSRC)/bcm2710-rpi-3-b.dtb $(DESTDIR)/boot/bcm2710-rpi-3-b.dtb
	@cp -f $(WORKSRC)/bcm2711-rpi-4-b.dtb $(DESTDIR)/boot/bcm2711-rpi-4-b.dtb
	@cp -f $(DESTDIR)$(libdir)/u-boot/rpi34/$(mm_U-BOOT_BOARD_TYPE)/kernel8.img $(DESTDIR)/boot/kernel8.img

clean-all:
	@rm -f $(DESTDIR)/boot/boot.scr
	@rm -f $(DESTDIR)/boot/boot.txt
	@rm -f $(DESTDIR)/boot/config.txt
	@rm -f $(DESTDIR)/boot/cmdline.txt
	@rm -f $(DESTDIR)/boot/bootcode.bin
	@rm -f $(DESTDIR)/boot/fixup4.dat
	@rm -f $(DESTDIR)/boot/fixup4db.dat
	@rm -f $(DESTDIR)/boot/fixup4cd.dat
	@rm -f $(DESTDIR)/boot/fixup4x.dat
	@rm -f $(DESTDIR)/boot/start4.elf
	@rm -f $(DESTDIR)/boot/start4cd.elf
	@rm -f $(DESTDIR)/boot/start4x.elf
	@rm -f $(DESTDIR)/boot/bcm2710-rpi-3-b.dtb
	@rm -f $(DESTDIR)/boot/bcm2710-rpi-3-b-plus.dtb
	@rm -f $(DESTDIR)/boot/bcm2711-rpi-4-b.dtb
	@rm -f $(DESTDIR)/boot/kernel8.img
