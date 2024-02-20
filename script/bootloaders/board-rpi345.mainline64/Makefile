
GARNAME      = bootfiles-rpi345.mainline64
GITHASH      = $(RPI_GITHASH)
GARVERSION   = $(RPI_GARVERSION)-$(RPI_GITHASH)
CATEGORIES   = bootloaders
MASTER_SITES = $(RPI_MASTER_SITES)
DISTFILES    = \
		config.txt     \
		cmdline.txt    \
		boot.txt       \
		boot-debug.scr \
		boot-debug.txt \
		boot.scr       \
		boot.scr       \
		boot.txt       \
		boot-debug.scr \
		boot-debug.txt \
		config.txt     \
		cmdline.txt    \
		bootcode.bin   \
		fixup.dat      \
		fixup4.dat     \
		fixup4cd.dat   \
		fixup4db.dat   \
		fixup4x.dat    \
		fixup_cd.dat   \
		fixup_db.dat   \
		fixup_x.dat    \
		start.elf      \
		start4.elf     \
		start4cd.elf   \
		start4db.elf   \
		start4x.elf    \
		start_cd.elf   \
		start_db.elf   \
		start_x.elf    \
		minimyth.conf  \

WORKSRC      = $(WORKDIR)

export mm_U-BOOT_BOARD_TYPE = rpi_arm64_defconfig

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom
CLEAN_SCRIPTS   = custom

GAR_EXTRA_CONF += bootloaders/board-rpi34.mainline64/package-api.mk
include ../../gar.mk

build-custom:
	@$(MAKE) clean-all install -C ../u-boot-rpi
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f $(WORKSRC)/*.scr               $(DESTDIR)/boot/
	@cp -f $(WORKSRC)/*.txt               $(DESTDIR)/boot/
	@cp -f $(WORKSRC)/*.bin               $(DESTDIR)/boot/
	@cp -f $(WORKSRC)/*.dat               $(DESTDIR)/boot/
	@cp -f $(WORKSRC)/*.elf               $(DESTDIR)/boot/
	@mkdir -p $(DESTDIR)/boot/upstream
	@cp -f $(DESTDIR)/boot/dtbs/broadcom/bcm2712-rpi-5-b.dtb                    $(DESTDIR)/boot/upstream/bcm2712-rpi-5-b.dtb
	@cp -f $(DESTDIR)/boot/dtbs/broadcom/bcm2711-rpi-4-b.dtb                    $(DESTDIR)/boot/upstream/bcm2711-rpi-4-b.dtb
	@cp -f $(DESTDIR)/boot/dtbs/broadcom/bcm2837-rpi-3-a-plus.dtb               $(DESTDIR)/boot/upstream/bcm2837-rpi-3-a-plus.dtb
	@cp -f $(DESTDIR)/boot/dtbs/broadcom/bcm2837-rpi-3-b-plus.dtb               $(DESTDIR)/boot/upstream/bcm2837-rpi-3-b-plus.dtb
	@cp -f $(DESTDIR)/boot/dtbs/broadcom/bcm2837-rpi-3-b.dtb                    $(DESTDIR)/boot/upstream/bcm2837-rpi-3-b.dtb
	@cp -f $(DESTDIR)$(libdir)/u-boot/rpi345/$(mm_U-BOOT_BOARD_TYPE)/kernel8.img $(DESTDIR)/boot/upstream/kernel8.img
	@cp -f $(WORKSRC)/minimyth.conf $(DESTDIR)/boot/minimyth.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -f $(DESTDIR)/boot/boot.*
	@rm -f $(DESTDIR)/boot/boot-debug.*
	@rm -f $(DESTDIR)/boot/bootcode.bin
	@rm -f $(DESTDIR)/boot/*.dat
	@rm -f $(DESTDIR)/boot/*.elf
	@rm -rf $(DESTDIR)/boot/upstream*
	@rm -f $(DESTDIR)/boot/minimyth.conf

clean-all: clean-custom cookieclean
