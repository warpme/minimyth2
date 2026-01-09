
GARNAME      = bootfiles-qcs6490.dragon_q6a
GARVERSION   = 2025-11-06
CATEGORIES   = bootloaders
MASTER_SITES = 
DISTFILES    = \
               minimyth.conf \
               BOOTAA64.EFI  \
               systemd-bootaa64.efi \
               mm2.conf \
               entries.srel \
               loader.conf \
               random-seed \

BUILD_SCRIPTS   = 
CLEAN_SCRIPTS   = bootloader
INSTALL_SCRIPTS = extra

include ../../gar.mk

install-extra:
	@mkdir -p $(DESTDIR)/boot/EFI/boot
	@cp -f    $(WORKDIR)/minimyth.conf $(DESTDIR)/boot/
	@cp -f    $(WORKDIR)/BOOTAA64.EFI $(DESTDIR)/boot/EFI/boot/
	@mkdir -p $(DESTDIR)/boot/EFI/systemd
	@cp -f    $(WORKDIR)/systemd-bootaa64.efi $(DESTDIR)/boot/EFI/systemd/
	@mkdir -p $(DESTDIR)/boot/loader/entries/
	@cp -f    $(WORKDIR)/mm2.conf $(DESTDIR)/boot/loader/entries/
	@cp -f    $(WORKDIR)/{entries.srel,loader.conf,random-seed} $(DESTDIR)/boot/loader/

clean-bootloader:
	@rm -f  $(DESTDIR)/boot/minimyth.conf
	@rm -rf $(DESTDIR)/boot/EFI*
	@rm -rf $(DESTDIR)/boot/loader*

clean-all: clean-bootloader cookieclean downloadclean
