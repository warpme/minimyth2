
GARNAME      = bootfiles-rpi3
GARVERSION   = 2018-12-05
CATEGORIES   = bootloaders
MASTER_SITES = https://github.com/raspberrypi/firmware/raw/master/boot/
DISTFILES    = rpi3-boot.scr \
               rpi3-boot.txt \
               bootcode.bin \
               fixup_db.dat \
               fixup.dat \
               fixup_x.dat \
               start_cd.elf \
               start.elf \
               start_x.elf \

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef


DEPENDS   = bootloaders/u-boot

BUILD_SCRIPTS   = 
INSTALL_SCRIPTS = custom

include ../../gar.mk

export mm_U-BOOT_BOARD_TYPE = rpi_3_defconfig

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f $(WORKSRC)/bootcode.bin  $(DESTDIR)/boot/bootcode.bin
	@cp -f $(WORKSRC)/fixup.dat     $(DESTDIR)/boot/fixup.dat
	@cp -f $(WORKSRC)/fixup_db.dat  $(DESTDIR)/boot/fixup_db.dat
	@cp -f $(WORKSRC)/fixup_x.dat   $(DESTDIR)/boot/fixup_x.dat
	@cp -f $(WORKSRC)/rpi3-boot.scr $(DESTDIR)/boot/rpi3-boot.scr
	@cp -f $(WORKSRC)/rpi3-boot.txt $(DESTDIR)/boot/rpi3-boot.txt
	@cp -f $(WORKSRC)/start.elf     $(DESTDIR)/boot/start.elf
	@cp -f $(WORKSRC)/start_cd.elf  $(DESTDIR)/boot/start_cd.elf
	@cp -f $(WORKSRC)/start_x.elf   $(DESTDIR)/boot/start_x.elf
	@# Renaming u-boot.bin to kernel8.img as IPL of rpi requires such name for aarch64
	@mv $(DESTDIR)/boot/u-boot.bin  $(DESTDIR)/boot/kernel8.img
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)/boot/bootcode.bin
	@rm -f $(DESTDIR)/boot/fixup.dat
	@rm -f $(DESTDIR)/boot/fixup_db.dat
	@rm -f $(DESTDIR)/boot/fixup_x.dat
	@rm -f $(DESTDIR)/boot/rpi3-boot.scr
	@rm -f $(DESTDIR)/boot/rpi3-boot.txt
	@rm -f $(DESTDIR)/boot/start.elf
	@rm -f $(DESTDIR)/boot/start_cd.elf
	@rm -f $(DESTDIR)/boot/start_x.elf
	@rm -f $(DESTDIR)/boot/u-boot.bin
	@rm -f $(DESTDIR)/boot/kernel8.img
	$(MAKE) clean clean-all -C ../u-boot
