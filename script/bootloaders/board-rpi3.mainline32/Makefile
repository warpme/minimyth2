
GARNAME      = bootfiles-rpi3.mainline32
GITHASH      = 20081d8e86119e95e516526700be62049850c01a
GARVERSION   = 2021-03-26-$(GITHASH)
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
               minimyth.conf       \

export mm_U-BOOT_BOARD_TYPE = rpi_3_32b_defconfig

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
	@cp -f $(WORKSRC)/fixup.dat           $(DESTDIR)/boot/fixup.dat
	@cp -f $(WORKSRC)/fixup_db.dat        $(DESTDIR)/boot/fixup_db.dat
	@cp -f $(WORKSRC)/fixup_x.dat         $(DESTDIR)/boot/fixup_x.dat
	@cp -f $(WORKSRC)/rpi3-boot.scr       $(DESTDIR)/boot/rpi3-boot.scr
	@cp -f $(WORKSRC)/rpi3-boot-debug.scr $(DESTDIR)/boot/rpi3-boot-debug.scr
	@cp -f $(WORKSRC)/rpi3-boot.scr       $(DESTDIR)/boot/boot.scr
	@cp -f $(WORKSRC)/rpi3-boot-debug.scr $(DESTDIR)/boot/boot-debug.scr
	@cp -f $(WORKSRC)/start.elf           $(DESTDIR)/boot/start.elf
	@cp -f $(WORKSRC)/start_cd.elf        $(DESTDIR)/boot/start_cd.elf
	@cp -f $(WORKSRC)/start_x.elf         $(DESTDIR)/boot/start_x.elf
	@cp -f $(DESTDIR)$(libdir)/u-boot/rpi3/$(mm_U-BOOT_BOARD_TYPE)/kernel.img $(DESTDIR)/boot/kernel7.img
	@cp -f $(WORKSRC)/minimyth.conf       $(DESTDIR)/boot/minimyth.conf

clean-all:
	@rm -f $(DESTDIR)/boot/bootcode.bin
	@rm -f $(DESTDIR)/boot/fixup.dat
	@rm -f $(DESTDIR)/boot/fixup_db.dat
	@rm -f $(DESTDIR)/boot/fixup_x.dat
	@rm -f $(DESTDIR)/boot/rpi3-boot.scr
	@rm -f $(DESTDIR)/boot/rpi3-boot-debug.scr
	@rm -f $(DESTDIR)/boot/boot.scr
	@rm -f $(DESTDIR)/boot/boot-debug.scr
	@rm -f $(DESTDIR)/boot/start.elf
	@rm -f $(DESTDIR)/boot/start_cd.elf
	@rm -f $(DESTDIR)/boot/start_x.elf
	@rm -f $(DESTDIR)/boot/kernel7.img
	@rm -f $(DESTDIR)/boot/minimyth.conf
