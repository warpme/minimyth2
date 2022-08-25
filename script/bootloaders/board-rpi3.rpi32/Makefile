
GARNAME      = bootfiles-rpi3.rpi32
GITHASH      = 8ca25048d08420eac28a97b00ab134ee3535e105
GARVERSION   = 2022-08-24-$(GITHASH)
CATEGORIES   = bootloaders
MASTER_SITES = https://github.com/raspberrypi/firmware/raw/$(GITHASH)/boot/
DISTFILES    = \
               bootcode.bin \
               cmdline.txt  \
               config.txt   \
               fixup.dat    \
               fixup_cd.dat \
               fixup_db.dat \
               fixup_x.dat  \
               start.elf    \
               start_cd.elf \
               start_db.elf \
               start_x.elf  \
               minimyth.conf \

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS   = 
INSTALL_SCRIPTS = custom
CLEAN_SCRIPTS   = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f $(WORKSRC)/bootcode.bin        $(DESTDIR)/boot/bootcode.bin
	@cp -f $(WORKSRC)/cmdline.txt         $(DESTDIR)/boot/cmdline.txt
	@cp -f $(WORKSRC)/config.txt          $(DESTDIR)/boot/config.txt
	@cp -f $(WORKSRC)/fixup.dat           $(DESTDIR)/boot/fixup.dat
	@cp -f $(WORKSRC)/fixup_cd.dat        $(DESTDIR)/boot/fixup_cd.dat
	@cp -f $(WORKSRC)/fixup_db.dat        $(DESTDIR)/boot/fixup_db.dat
	@cp -f $(WORKSRC)/fixup_x.dat         $(DESTDIR)/boot/fixup_x.dat
	@cp -f $(WORKSRC)/start.elf           $(DESTDIR)/boot/start.elf
	@cp -f $(WORKSRC)/start_cd.elf        $(DESTDIR)/boot/start_cd.elf
	@cp -f $(WORKSRC)/start_db.elf        $(DESTDIR)/boot/start_db.elf
	@cp -f $(WORKSRC)/start_x.elf         $(DESTDIR)/boot/start_x.elf
	@cp -f $(DESTDIR)/boot/zImage         $(DESTDIR)/boot/kernel7.img
	@cp -f $(WORKSRC)/minimyth.conf       $(DESTDIR)/boot/minimyth.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -f $(DESTDIR)/boot/bootcode.bin
	@rm -f $(DESTDIR)/boot/cmdline.txt
	@rm -f $(DESTDIR)/boot/config.txt
	@rm -f $(DESTDIR)/boot/fixup.dat
	@rm -f $(DESTDIR)/boot/fixup_cd.dat
	@rm -f $(DESTDIR)/boot/fixup_db.dat
	@rm -f $(DESTDIR)/boot/fixup_x.dat
	@rm -f $(DESTDIR)/boot/start.elf
	@rm -f $(DESTDIR)/boot/start_cd.elf
	@rm -f $(DESTDIR)/boot/start_db.elf
	@rm -f $(DESTDIR)/boot/start_x.elf
	@rm -f $(DESTDIR)/boot/kernel7.img
	@rm -f $(DESTDIR)/boot/minimyth.conf

clean-all: clean-custom cookieclean
