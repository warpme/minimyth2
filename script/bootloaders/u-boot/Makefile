
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

GAR_EXTRA_CONF += bootloaders/u-boot/package-api.mk
include ../../gar.mk

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \

configure-custom:
	@sed -i "s%HOSTCC%CC%g" $(WORKSRC)/scripts/dtc/pylibfdt/Makefile
	@$(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(PARALLELMFLAGS)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)/boot"
ifeq ($(mm_U-BOOT_BOARD_TYPE),rpi_2_defconfig)
	@cp -f $(WORKSRC)/u-boot.bin $(DESTDIR)/boot/kernel7.img
endif
ifeq ($(mm_U-BOOT_BOARD_TYPE),rpi_3_defconfig)
	@cp -f $(WORKSRC)/u-boot.bin $(DESTDIR)/boot/kernel8.img
endif
ifeq ($(mm_U-BOOT_BOARD_TYPE),rpi_3_32b_defconfig)
	@cp -f $(WORKSRC)/u-boot.bin $(DESTDIR)/boot/kernel.img
endif
ifeq ($(mm_U-BOOT_BOARD_TYPE),p212_defconfig)
	@cp -f $(WORKSRC)/u-boot.bin $(DESTDIR)/boot/s905_u-boot
endif
ifeq ($(mm_U-BOOT_BOARD_TYPE),khadas-vim2_defconfig)
	@cp -f $(WORKSRC)/u-boot.bin $(DESTDIR)/boot/s912_u-boot
endif
ifeq ($(mm_U-BOOT_BOARD_TYPE),evb-rk3328_defconfig)
	@cp -f $(WORKSRC)/u-boot.bin $(DESTDIR)/boot/rk3328_u-boot
endif
ifeq ($(mm_U-BOOT_BOARD_TYPE),evb-rk3399_defconfig)
	@cp -f $(WORKSRC)/u-boot.bin $(DESTDIR)/boot/rk3399_u-boot
endif
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)/boot/kernel.img
	@rm -f $(DESTDIR)/boot/kernel7.img
	@rm -f $(DESTDIR)/boot/kernel8.img
	@rm -f $(DESTDIR)/boot/s905_u-boot
	@rm -f $(DESTDIR)/boot/rk3328_u-boot
	@rm -f $(DESTDIR)/boot/rk3399_u-boot
