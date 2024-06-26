
GARNAME      = bootfiles-rpi5.rpi64
GITHASH      = $(RPI_GITHASH)
GARVERSION   = $(RPI_GARVERSION)-$(RPI_GITHASH)
CATEGORIES   = bootloaders
MASTER_SITES = $(RPI_MASTER_SITES)
DISTFILES    = \
	cmdline.txt  \
	config.txt   \
	bootcode.bin \
	fixup.dat    \
	fixup4.dat   \
	fixup4cd.dat \
	fixup4db.dat \
	fixup4x.dat  \
	fixup_cd.dat \
	fixup_db.dat \
	fixup_x.dat  \
	start.elf    \
	start4.elf   \
	start4cd.elf \
	start4db.elf \
	start4x.elf  \
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

GAR_EXTRA_CONF += bootloaders/board-rpi34.mainline64/package-api.mk
include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f $(WORKSRC)/cmdline.txt         $(DESTDIR)/boot/cmdline.txt
	@cp -f $(WORKSRC)/config.txt          $(DESTDIR)/boot/config.txt
	@cp -f $(WORKSRC)/bootcode.bin        $(DESTDIR)/boot/bootcode.bin
	@cp -f $(WORKSRC)/fixup.dat           $(DESTDIR)/boot/fixup.dat
	@cp -f $(WORKSRC)/fixup4.dat          $(DESTDIR)/boot/fixup4.dat
	@cp -f $(WORKSRC)/fixup4cd.dat        $(DESTDIR)/boot/fixup4cd.dat
	@cp -f $(WORKSRC)/fixup4db.dat        $(DESTDIR)/boot/fixup4db.dat
	@cp -f $(WORKSRC)/fixup4x.dat         $(DESTDIR)/boot/fixup4x.dat
	@cp -f $(WORKSRC)/fixup_cd.dat        $(DESTDIR)/boot/fixup_cd.dat
	@cp -f $(WORKSRC)/fixup_db.dat        $(DESTDIR)/boot/fixup_db.dat
	@cp -f $(WORKSRC)/fixup_x.dat         $(DESTDIR)/boot/fixup_x.dat
	@cp -f $(WORKSRC)/start.elf           $(DESTDIR)/boot/start.elf
	@cp -f $(WORKSRC)/start4.elf          $(DESTDIR)/boot/start4.elf
	@cp -f $(WORKSRC)/start4cd.elf        $(DESTDIR)/boot/start4cd.elf
	@cp -f $(WORKSRC)/start4db.elf        $(DESTDIR)/boot/start4db.elf
	@cp -f $(WORKSRC)/start4x.elf         $(DESTDIR)/boot/start4x.elf
	@cp -f $(WORKSRC)/start_cd.elf        $(DESTDIR)/boot/start_cd.elf
	@cp -f $(WORKSRC)/start_db.elf        $(DESTDIR)/boot/start_db.elf
	@cp -f $(WORKSRC)/start_x.elf         $(DESTDIR)/boot/start_x.elf
	@cp -f $(DESTDIR)/boot/Image          $(DESTDIR)/boot/kernel8.img
	@cp -f $(WORKSRC)/minimyth.conf       $(DESTDIR)/boot/minimyth.conf
	@# do not do $(MAKECOOKIE) as reinstall-board uses this install also to reinstall board files

clean-custom:
	@rm -f $(DESTDIR)/boot/bootcode.bin
	@rm -f $(DESTDIR)/boot/cmdline.txt
	@rm -f $(DESTDIR)/boot/config.txt
	@rm -f $(DESTDIR)/boot/fixup.dat
	@rm -f $(DESTDIR)/boot/fixup4.dat
	@rm -f $(DESTDIR)/boot/fixup4cd.dat
	@rm -f $(DESTDIR)/boot/fixup4db.dat
	@rm -f $(DESTDIR)/boot/fixup4x.dat
	@rm -f $(DESTDIR)/boot/fixup_cd.dat
	@rm -f $(DESTDIR)/boot/fixup_db.dat
	@rm -f $(DESTDIR)/boot/fixup_x.dat
	@rm -f $(DESTDIR)/boot/start.elf
	@rm -f $(DESTDIR)/boot/start4.elf
	@rm -f $(DESTDIR)/boot/start4cd.elf
	@rm -f $(DESTDIR)/boot/start4db.elf
	@rm -f $(DESTDIR)/boot/start4x.elf
	@rm -f $(DESTDIR)/boot/start_cd.elf
	@rm -f $(DESTDIR)/boot/start_db.elf
	@rm -f $(DESTDIR)/boot/start_x.elf
	@rm -f $(DESTDIR)/boot/kernel8.img
	@rm -f $(DESTDIR)/boot/minimyth.conf

clean-all: clean-custom cookieclean
