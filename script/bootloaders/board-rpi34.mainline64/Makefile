
GARNAME      = bootfiles-rpi34.mainline64
GITHASH      = fb956866207031fcd83af4ece2b636d81be4482a
GARVERSION   = 2022-07-13-$(GITHASH)
CATEGORIES   = bootloaders
MASTER_SITES = https://github.com/raspberrypi/firmware/raw/$(GITHASH)/boot/
DISTFILES    = config.txt             \
               cmdline.txt            \
               bootcode.bin           \
               boot.txt               \
               boot-debug.scr         \
               boot-debug.txt         \
               boot.scr               \
               fixup_db.dat           \
               fixup.dat              \
               fixup_x.dat            \
               start_cd.elf           \
               start.elf              \
               start_x.elf            \
               fixup4cd.dat           \
               fixup4.dat             \
               fixup4x.dat            \
               start4cd.elf           \
               start4.elf             \
               start4x.elf            \
               minimyth.conf          \

WORKSRC      = $(WORKDIR)

export mm_U-BOOT_BOARD_TYPE = rpi_arm64_defconfig

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom
CLEAN_SCRIPTS   = custom

include ../../gar.mk

build-custom:
	@$(MAKE) clean-all install -C ../u-boot-rpi
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f $(WORKSRC)/boot.scr            $(DESTDIR)/boot/boot.scr
	@cp -f $(WORKSRC)/boot.txt            $(DESTDIR)/boot/boot.txt
	@cp -f $(WORKSRC)/boot-debug.scr      $(DESTDIR)/boot/boot-debug.scr
	@cp -f $(WORKSRC)/boot-debug.txt      $(DESTDIR)/boot/boot-debug.txt
	@cp -f $(WORKSRC)/config.txt          $(DESTDIR)/boot/config.txt
	@cp -f $(WORKSRC)/cmdline.txt         $(DESTDIR)/boot/cmdline.txt
	@cp -f $(WORKSRC)/bootcode.bin        $(DESTDIR)/boot/bootcode.bin
	@cp -f $(WORKSRC)/fixup.dat           $(DESTDIR)/boot/fixup.dat
	@cp -f $(WORKSRC)/fixup_db.dat        $(DESTDIR)/boot/fixup_db.dat
	@cp -f $(WORKSRC)/fixup_x.dat         $(DESTDIR)/boot/fixup_x.dat
	@cp -f $(WORKSRC)/start.elf           $(DESTDIR)/boot/start.elf
	@cp -f $(WORKSRC)/start_cd.elf        $(DESTDIR)/boot/start_cd.elf
	@cp -f $(WORKSRC)/start_x.elf         $(DESTDIR)/boot/start_x.elf
	@cp -f $(WORKSRC)/fixup4.dat          $(DESTDIR)/boot/fixup4.dat
	@cp -f $(WORKSRC)/fixup4cd.dat        $(DESTDIR)/boot/fixup4cd.dat
	@cp -f $(WORKSRC)/fixup4x.dat         $(DESTDIR)/boot/fixup4x.dat
	@cp -f $(WORKSRC)/start4.elf          $(DESTDIR)/boot/start4.elf
	@cp -f $(WORKSRC)/start4cd.elf        $(DESTDIR)/boot/start4cd.elf
	@cp -f $(WORKSRC)/start4x.elf         $(DESTDIR)/boot/start4x.elf
	@mkdir -p $(DESTDIR)/boot/upstream
	@cp -f $(DESTDIR)/boot/dtbs/broadcom/bcm2711-rpi-4-b.dtb                    $(DESTDIR)/boot/upstream/bcm2711-rpi-4-b.dtb
	@cp -f $(DESTDIR)/boot/dtbs/broadcom/bcm2837-rpi-3-a-plus.dtb               $(DESTDIR)/boot/upstream/bcm2837-rpi-3-a-plus.dtb
	@cp -f $(DESTDIR)/boot/dtbs/broadcom/bcm2837-rpi-3-b-plus.dtb               $(DESTDIR)/boot/upstream/bcm2837-rpi-3-b-plus.dtb
	@cp -f $(DESTDIR)/boot/dtbs/broadcom/bcm2837-rpi-3-b.dtb                    $(DESTDIR)/boot/upstream/bcm2837-rpi-3-b.dtb
	@cp -f $(DESTDIR)$(libdir)/u-boot/rpi34/$(mm_U-BOOT_BOARD_TYPE)/kernel8.img $(DESTDIR)/boot/upstream/kernel8.img
	@cp -f $(WORKSRC)/minimyth.conf       $(DESTDIR)/boot/minimyth.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -f $(DESTDIR)/boot/boot.scr
	@rm -f $(DESTDIR)/boot/boot.txt
	@rm -f $(DESTDIR)/boot/boot-debug.scr
	@rm -f $(DESTDIR)/boot/boot-debug.txt
	@rm -f $(DESTDIR)/boot/config.txt
	@rm -f $(DESTDIR)/boot/cmdline.txt
	@rm -f $(DESTDIR)/boot/bootcode.bin
	@rm -f $(DESTDIR)/boot/fixup.dat
	@rm -f $(DESTDIR)/boot/fixup_db.dat
	@rm -f $(DESTDIR)/boot/fixup_x.dat
	@rm -f $(DESTDIR)/boot/start.elf
	@rm -f $(DESTDIR)/boot/start_cd.elf
	@rm -f $(DESTDIR)/boot/start_x.elf
	@rm -f $(DESTDIR)/boot/fixup4.dat
	@rm -f $(DESTDIR)/boot/fixup4db.dat
	@rm -f $(DESTDIR)/boot/fixup4cd.dat
	@rm -f $(DESTDIR)/boot/fixup4x.dat
	@rm -f $(DESTDIR)/boot/start4.elf
	@rm -f $(DESTDIR)/boot/start4cd.elf
	@rm -f $(DESTDIR)/boot/start4x.elf
	@rm -rf $(DESTDIR)/boot/upstream*
	@rm -f $(DESTDIR)/boot/minimyth.conf

clean-all: clean-custom cookieclean
