
GARNAME      = bootfiles-rpi3.mainline64
GITHASH      = $(RPI_GITHASH)
GARVERSION   = $(RPI_GARVERSION)-$(RPI_GITHASH)
CATEGORIES   = bootloaders
MASTER_SITES = $(RPI_MASTER_SITES)
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

export mm_U-BOOT_BOARD_TYPE = rpi_3_defconfig

WORKSRC      = $(WORKDIR)

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
	@$(MAKE) clean -C ../u-boot
	@$(MAKE) install -C ../u-boot
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
	@cp -f $(DESTDIR)$(libdir)/u-boot/rpi3/$(mm_U-BOOT_BOARD_TYPE)/kernel8.img $(DESTDIR)/boot/kernel8.img
	@cp -f $(WORKSRC)/minimyth.conf       $(DESTDIR)/boot/minimyth.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
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
	@rm -f $(DESTDIR)/boot/kernel8.img
	@rm -f $(DESTDIR)/boot/minimyth.conf

clean-all: clean-custom cookieclean
