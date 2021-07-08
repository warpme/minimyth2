
GARNAME      = bootfiles-g12.radxa_zero
GARVERSION   = 2021-07-08
CATEGORIES   = bootloaders
MASTER_SITES = https://dl.radxa.com/zero/images/loader/
DISTFILES    = \
		g12a-boot-debug.scr \
		g12a-boot-debug.txt \
		g12a-boot.scr \
		g12a-boot.txt \
		minimyth.conf \
		u-boot.bin.sd.bin \

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS   = 
INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f    $(WORKDIR)/g12a-boot-debug.scr $(DESTDIR)/boot/boot-debug.scr
	@#cp -f    $(WORKDIR)/g12a-boot.scr       $(DESTDIR)/boot/boot.scr
	@cp -f    $(WORKDIR)/g12a-boot-debug.scr $(DESTDIR)/boot/boot.scr
	@cp -f    $(WORKDIR)/minimyth.conf       $(DESTDIR)/boot/minimyth.conf
	@mkdir -p $(DESTDIR)/boot/g12aloaderfiles
	@cp -f    $(WORKDIR)/u-boot.bin.sd.bin $(DESTDIR)/boot/g12aloaderfiles/radxa-zero-uboot.bin
	@$(MAKECOOKIE)

clean-all: clean
	@rm -f $(DESTDIR)/boot/boot.scr
	@rm -f $(DESTDIR)/boot/boot-debug.scr
	@rm -f $(DESTDIR)/boot/minimyth.conf
	@rm -f $(DESTDIR)/boot/g12aloaderfiles/radxa-zero-uboot.bin
