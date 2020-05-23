
GARNAME      = bootfiles-rpi4.mainline64
GITHASH      = 21e1fe3477ffb708a5736ed61a924fd650031136
GARVERSION   = 2020-05-22-$(GITHASH)
CATEGORIES   = bootloaders
MASTER_SITES = https://github.com/raspberrypi/firmware/raw/$(GITHASH)/boot/
DISTFILES    = rpi4-boot.scr       \
               rpi4-boot.txt       \
               rpi4-boot-debug.scr \
               rpi4-boot-debug.txt \
               bootcode.bin        \
               fixup4cd.dat        \
               fixup4.dat          \
               fixup4x.dat         \
               start4cd.elf        \
               start4.elf          \
               start4x.elf         \

export mm_U-BOOT_BOARD_TYPE = rpi_4_defconfig

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

build-custom:
	@$(MAKE) clean -C ../u-boot-rpi
	@$(MAKE) install -C ../u-boot-rpi
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f $(WORKSRC)/bootcode.bin        $(DESTDIR)/boot/bootcode.bin
	@cp -f $(WORKSRC)/fixup4.dat          $(DESTDIR)/boot/fixup4.dat
	@cp -f $(WORKSRC)/fixup4cd.dat        $(DESTDIR)/boot/fixup4cd.dat
	@cp -f $(WORKSRC)/fixup4x.dat         $(DESTDIR)/boot/fixup4x.dat
	@cp -f $(WORKSRC)/rpi4-boot.scr       $(DESTDIR)/boot/rpi4-boot.scr
	@cp -f $(WORKSRC)/rpi4-boot.txt       $(DESTDIR)/boot/rpi4-boot.txt
	@cp -f $(WORKSRC)/rpi4-boot-debug.scr $(DESTDIR)/boot/rpi4-boot-debug.scr
	@cp -f $(WORKSRC)/rpi4-boot-debug.txt $(DESTDIR)/boot/rpi4-boot-debug.txt
	@cp -f $(WORKSRC)/rpi4-boot.scr       $(DESTDIR)/boot/boot.scr
	@cp -f $(WORKSRC)/rpi4-boot.txt       $(DESTDIR)/boot/boot.txt
	@cp -f $(WORKSRC)/rpi4-boot-debug.scr $(DESTDIR)/boot/boot-debug.scr
	@cp -f $(WORKSRC)/rpi4-boot-debug.txt $(DESTDIR)/boot/boot-debug.txt
	@cp -f $(WORKSRC)/start4.elf          $(DESTDIR)/boot/start4.elf
	@cp -f $(WORKSRC)/start4cd.elf        $(DESTDIR)/boot/start4cd.elf
	@cp -f $(WORKSRC)/start4x.elf         $(DESTDIR)/boot/start4x.elf
	@cp -f $(DESTDIR)$(libdir)/u-boot/rpi4/$(mm_U-BOOT_BOARD_TYPE)/kernel8.img $(DESTDIR)/boot/kernel8.img

clean-all:
	@rm -f $(DESTDIR)/boot/bootcode.bin
	@rm -f $(DESTDIR)/boot/fixup4.dat
	@rm -f $(DESTDIR)/boot/fixup4db.dat
	@rm -f $(DESTDIR)/boot/fixup4x.dat
	@rm -f $(DESTDIR)/boot/rpi4-boot.scr
	@rm -f $(DESTDIR)/boot/rpi4-boot.txt
	@rm -f $(DESTDIR)/boot/rpi4-boot-debug.scr
	@rm -f $(DESTDIR)/boot/rpi4-boot-debug.txt
	@rm -f $(DESTDIR)/boot/boot.scr
	@rm -f $(DESTDIR)/boot/boot.txt
	@rm -f $(DESTDIR)/boot/boot-debug.scr
	@rm -f $(DESTDIR)/boot/boot-debug.txt
	@rm -f $(DESTDIR)/boot/start4.elf
	@rm -f $(DESTDIR)/boot/start4cd.elf
	@rm -f $(DESTDIR)/boot/start4x.elf
	@rm -f $(DESTDIR)/boot/kernel8.img
