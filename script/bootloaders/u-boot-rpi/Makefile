# Mainline U-boot v2022.10-rc3
GARNAME      = u-boot-202210rc3-rpi
GARVERSION   = 2022.10-rc3
CATEGORIES   = kernel
MASTER_SITES = https://github.com/u-boot/u-boot/archive/
DISTFILES    = v$(GARVERSION).zip
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

include ../../gar.mk
include ../../python3/python/package-api.mk

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \

configure-custom:
	@echo "Configuring u-boot rpi with $(CONFIGURE_ARGS) ..."
	@$(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot rpi with $(CONFIGURE_ARGS) ..."
	@$(call PYTHON3_SET_BUILD_SYSCONF)
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(PARALLELMFLAGS)
	@$(call PYTHON3_SET_MAIN_SYSCONF)
	@$(MAKECOOKIE)

install-custom:
ifeq ($(mm_U-BOOT_BOARD_TYPE),rpi_2_defconfig)
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/rpi2/$(mm_U-BOOT_BOARD_TYPE)"
	@cp -f $(WORKSRC)/u-boot.bin $(DESTDIR)$(libdir)/u-boot/rpi2/$(mm_U-BOOT_BOARD_TYPE)/kernel7.img
endif
ifeq ($(mm_U-BOOT_BOARD_TYPE),rpi_3_defconfig)
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/rpi3/$(mm_U-BOOT_BOARD_TYPE)"
	@cp -f $(WORKSRC)/u-boot.bin $(DESTDIR)$(libdir)/u-boot/rpi3/$(mm_U-BOOT_BOARD_TYPE)/kernel8.img
endif
ifeq ($(mm_U-BOOT_BOARD_TYPE),rpi_4_defconfig)
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/rpi4/$(mm_U-BOOT_BOARD_TYPE)"
	@cp -f $(WORKSRC)/u-boot.bin $(DESTDIR)$(libdir)/u-boot/rpi4/$(mm_U-BOOT_BOARD_TYPE)/kernel8.img
endif
ifeq ($(mm_U-BOOT_BOARD_TYPE),rpi_3_32b_defconfig)
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/rpi3/$(mm_U-BOOT_BOARD_TYPE)"
	@cp -f $(WORKSRC)/u-boot.bin $(DESTDIR)$(libdir)/u-boot/rpi3/$(mm_U-BOOT_BOARD_TYPE)/kernel.img
endif
ifeq ($(mm_U-BOOT_BOARD_TYPE),rpi_arm64_defconfig)
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/rpi34/$(mm_U-BOOT_BOARD_TYPE)"
	@cp -f $(WORKSRC)/u-boot.bin $(DESTDIR)$(libdir)/u-boot/rpi34/$(mm_U-BOOT_BOARD_TYPE)/kernel8.img
endif
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
