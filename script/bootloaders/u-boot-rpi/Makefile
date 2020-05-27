# Mainline U-boot
ifeq (0,1)
GARNAME      = u-boot-20200523-rpi
GARVERSION   = f53c2dc162d0c62debd0ebb88383e3b6fee95c10
CATEGORIES   = kernel
MASTER_SITES = https://github.com/u-boot/u-boot/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)
endif

ifeq (1,1)
GARNAME      = u-boot-agherzan-20200523-rpi
GARVERSION   = 62b6e39a53c56a9085aeab1b47b5cc6020fcdb6f
CATEGORIES   = kernel
# https://github.com/agherzan/u-boot/commits/ag/rpi4 15.06.2020
MASTER_SITES = https://github.com/agherzan/u-boot/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)
endif

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

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
	@$(MAKECOOKIE)

clean-all:
