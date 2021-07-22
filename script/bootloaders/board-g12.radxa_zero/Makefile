
GARNAME       = bootfiles-g12.radxa_zero
GARVERSION    = e91f790dd6b3728af8e8fcb0c064ac4f0f5cfe3f
CATEGORIES    = bootloaders
MASTER_SITES  = https://github.com/radxa/amlogic-boot-fip/archive/
MASTER_SITES += https://gitlab.com/baylibre/amlogic/atv/u-boot/-/wikis/uploads/2103b12fe2d91bdb543447783e20ef53/
DISTFILES     = $(GARVERSION).zip \
		g12a-boot-debug.scr \
		g12a-boot-debug.txt \
		g12a-boot.scr \
		g12a-boot.txt \
		minimyth.conf \
		generate-bins-new.sh \

export mm_U-BOOT_BOARD_TYPE = radxa-zero_defconfig
# export mm_U-BOOT_BOARD_TYPE = u200_defconfig

WORKSRC      = $(WORKDIR)/amlogic-boot-fip-$(GARVERSION)/radxa-zero

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

build-custom:
	@$(MAKE) clean install -C ../u-boot-g12a
	@echo "export SOCFAMILY=g12a" > $(WORKSRC)/soc-var.sh
	@chmod +x $(WORKSRC)/aml_encrypt_g12a
	@chmod +x $(WORKDIR)/generate-bins-new.sh
	@cp -f $(WORKSRC)/aml_encrypt_g12a $(WORKSRC)/aml_encrypt
	@$(WORKDIR)/generate-bins-new.sh $(WORKSRC) $(DESTDIR)$(libdir)/u-boot/g12a/$(mm_U-BOOT_BOARD_TYPE)/bl33.bin
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/boot
	@cp -f    $(WORKDIR)/g12a-boot-debug.scr $(DESTDIR)/boot/boot-debug.scr
	@cp -f    $(WORKDIR)/g12a-boot.scr       $(DESTDIR)/boot/boot.scr
	@cp -f    $(WORKDIR)/minimyth.conf       $(DESTDIR)/boot/minimyth.conf
	@mkdir -p $(DESTDIR)/boot/g12aloaderfiles
	@cp -f    $(WORKDIR)/../../uboot-bins/u-boot.bin.sd.bin $(DESTDIR)/boot/g12aloaderfiles/radxa-zero-uboot.bin
	@rm -rf   uboot-bins*
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)/boot/boot.scr
	@rm -f $(DESTDIR)/boot/boot-debug.scr
	@rm -f $(DESTDIR)/boot/minimyth.conf
	@rm -f $(DESTDIR)/boot/g12aloaderfiles/radxa-zero-uboot.bin
