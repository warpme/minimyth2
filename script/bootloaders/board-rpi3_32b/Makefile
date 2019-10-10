
GARNAME      = bootfiles-rpi3_32b
GITHASH      = c3f9eee6fefb0ea7292e6a49c726637f0c22bd07
GARVERSION   = 2019-09-22-$(GITHASH)
CATEGORIES   = bootloaders
MASTER_SITES = https://github.com/raspberrypi/firmware/raw/$(GITHASH)/boot/
DISTFILES    = rpi3-boot.scr       \
               rpi3-boot.txt       \
               rpi3-boot-debug.scr \
               rpi3-boot-debug.txt \
               bootcode.bin        \
               fixup_db.dat        \
               fixup.dat           \
               fixup_x.dat         \
               start_cd.elf        \
               start.elf           \
               start_x.elf         \
               config.txt          \

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = bootloaders/u-boot

BUILD_SCRIPTS   = 
INSTALL_SCRIPTS = custom

include ../../gar.mk

export mm_U-BOOT_BOARD_TYPE = rpi_3_32b_defconfig

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f $(WORKSRC)/bootcode.bin        $(DESTDIR)/boot/bootcode.bin
	@cp -f $(WORKSRC)/fixup.dat           $(DESTDIR)/boot/fixup.dat
	@cp -f $(WORKSRC)/fixup_db.dat        $(DESTDIR)/boot/fixup_db.dat
	@cp -f $(WORKSRC)/fixup_x.dat         $(DESTDIR)/boot/fixup_x.dat
	@cp -f $(WORKSRC)/rpi3-boot.scr       $(DESTDIR)/boot/rpi3-boot.scr
	@cp -f $(WORKSRC)/rpi3-boot.txt       $(DESTDIR)/boot/rpi3-boot.txt
	@cp -f $(WORKSRC)/rpi3-boot-debug.scr $(DESTDIR)/boot/rpi3-boot-debug.scr
	@cp -f $(WORKSRC)/rpi3-boot-debug.txt $(DESTDIR)/boot/rpi3-boot-debug.txt
	@cp -f $(WORKSRC)/rpi3-boot.scr       $(DESTDIR)/boot/boot.scr
	@cp -f $(WORKSRC)/rpi3-boot.txt       $(DESTDIR)/boot/boot.txt
	@cp -f $(WORKSRC)/rpi3-boot-debug.scr $(DESTDIR)/boot/boot-debug.scr
	@cp -f $(WORKSRC)/rpi3-boot-debug.txt $(DESTDIR)/boot/boot-debug.txt
	@cp -f $(WORKSRC)/start.elf           $(DESTDIR)/boot/start.elf
	@cp -f $(WORKSRC)/start_cd.elf        $(DESTDIR)/boot/start_cd.elf
	@cp -f $(WORKSRC)/start_x.elf         $(DESTDIR)/boot/start_x.elf
	@cp -f $(WORKSRC)/config.txt          $(DESTDIR)/boot/config.txt
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)/boot/bootcode.bin
	@rm -f $(DESTDIR)/boot/fixup.dat
	@rm -f $(DESTDIR)/boot/fixup_db.dat
	@rm -f $(DESTDIR)/boot/fixup_x.dat
	@rm -f $(DESTDIR)/boot/rpi3-boot.scr
	@rm -f $(DESTDIR)/boot/rpi3-boot.txt
	@rm -f $(DESTDIR)/boot/rpi3-boot-debug.scr
	@rm -f $(DESTDIR)/boot/rpi3-boot-debug.txt
	@rm -f $(DESTDIR)/boot/boot.scr
	@rm -f $(DESTDIR)/boot/boot.txt
	@rm -f $(DESTDIR)/boot/boot-debug.scr
	@rm -f $(DESTDIR)/boot/boot-debug.txt
	@rm -f $(DESTDIR)/boot/start.elf
	@rm -f $(DESTDIR)/boot/start_cd.elf
	@rm -f $(DESTDIR)/boot/start_x.elf
	@rm -f $(DESTDIR)/boot/u-boot.bin
	@rm -f $(DESTDIR)/boot/kernel.img
	@rm -f $(DESTDIR)/boot/config.txt
	$(MAKE) clean clean-all -C ../u-boot
