
# for testing purpouses
# mm_U-BOOT_BOARD_TYPE = test-h6
# mm_U-BOOT_BOARD_TYPE = test-h313
# mm_U-BOOT_BOARD_TYPE = test-h616
# mm_U-BOOT_BOARD_TYPE = test-a523
# mm_U-BOOT_BOARD_TYPE = test-rk3328
# mm_U-BOOT_BOARD_TYPE = test-rk3399
# mm_U-BOOT_BOARD_TYPE = test-rk3528
# mm_U-BOOT_BOARD_TYPE = test-rk3566
# mm_U-BOOT_BOARD_TYPE = test-rk3568
# mm_U-BOOT_BOARD_TYPE = test-rk3576
# mm_U-BOOT_BOARD_TYPE = test-rk3588

ifeq (0,1)
# collabora https://gitlab.collabora.com/hardware-enablement/rockchip-3588/trusted-firmware-a/
# git@28.02.2025
GARNAME      = arm-trusted-firmware-collabora
GARVERSION   = ed0a82a67572db4ad2e0d8fa6651944d501e941f
MASTER_SITES = https://gitlab.collabora.com/hardware-enablement/rockchip-3588/trusted-firmware-a/-/archive/$(GARVERSION)/
DISTFILES    = trusted-firmware-a-$(GARVERSION).tar.bz2
PATCHFILES   = 01-fix-building-under-gcc15.patch
WORKSRC      = $(WORKDIR)/trusted-firmware-a-$(GARVERSION)
endif

ifeq (1,1)
# mainline atf
GARNAME      = arm-trusted-firmware
GARVERSION   = 2.13.0
MASTER_SITES = https://github.com/ARM-software/arm-trusted-firmware/archive/refs/tags/
DISTFILES    = v$(GARVERSION).tar.gz
PATCHFILES   = 01-fix-building-under-gcc15.patch
WORKSRC      = $(WORKDIR)/arm-trusted-firmware-$(GARVERSION)
endif

CATEGORIES   = bootloaders
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c
BUILDDEPS = devel/gcc-arm-linux

CONFIGURE_SCRIPTS   = 
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = 

include ../../gar.mk

# set to default value when packahe is build without any defined board....
mm_U-BOOT_BOARD_TYPE ?= test-rk3588

ifneq (,$(findstring h6.,$(mm_U-BOOT_BOARD_TYPE)))
PLATFORM     = sun50i_h6
BUILD_BIN    = sun50i_h6/debug/bl31.bin
INSTALL_PREF = h6
endif

ifneq (,$(findstring h313,$(mm_U-BOOT_BOARD_TYPE)))
PLATFORM     = sun50i_h616
BUILD_BIN    = sun50i_h616/debug/bl31.bin
INSTALL_PREF = h313
endif

ifneq (,$(findstring h616.,$(mm_U-BOOT_BOARD_TYPE)))
PLATFORM     = sun50i_h616
BUILD_BIN    = sun50i_h616/debug/bl31.bin
INSTALL_PREF = h616
endif

ifneq (,$(findstring h618.,$(mm_U-BOOT_BOARD_TYPE)))
PLATFORM     = sun50i_h616
BUILD_BIN    = sun50i_h616/debug/bl31.bin
INSTALL_PREF = h618
endif

ifneq (,$(findstring a523,$(mm_U-BOOT_BOARD_TYPE)))
PLATFORM     = sun50i_a523
BUILD_BIN    = sun50i_a523/debug/bl31.bin
INSTALL_PREF = a523
endif

ifneq (,$(findstring rk3328,$(mm_U-BOOT_BOARD_TYPE)))
PLATFORM     = rk3328
BUILD_BIN    = rk3328/debug/bl31/bl31.elf
INSTALL_PREF = rk3328
endif

ifneq (,$(findstring rk3399,$(mm_U-BOOT_BOARD_TYPE)))
PLATFORM     = rk3399
BUILD_BIN    = rk3399/debug/bl31/bl31.elf
INSTALL_PREF = rk3399
DDR_BIN      = ${TPL}
endif

ifneq (,$(findstring rk3528,$(mm_U-BOOT_BOARD_TYPE)))
PLATFORM     = rk3528
BUILD_BIN    = rk3528/debug/bl31/bl31.elf
INSTALL_PREF = rk3528
DDR_BIN      = ${TPL}
endif

ifneq (,$(findstring rk3566,$(mm_U-BOOT_BOARD_TYPE)))
PLATFORM     = rk3568
BUILD_BIN    = rk3568/debug/bl31/bl31.elf
INSTALL_PREF = rk3566
DDR_BIN      = ${TPL}
endif

ifneq (,$(findstring rk3568,$(mm_U-BOOT_BOARD_TYPE)))
PLATFORM     = rk3568
BUILD_BIN    = rk3568/debug/bl31/bl31.elf
INSTALL_PREF = rk3568
DDR_BIN      = ${TPL}
endif

ifneq (,$(findstring rk3576,$(mm_U-BOOT_BOARD_TYPE)))
PLATFORM     = rk3576
BUILD_BIN    = rk3576/debug/bl31/bl31.elf
INSTALL_PREF = rk3576
endif

ifneq (,$(findstring rk3588,$(mm_U-BOOT_BOARD_TYPE)))
PLATFORM     = rk3588
BUILD_BIN    = rk3588/debug/bl31/bl31.elf
ifneq (,$(findstring rk3588s,$(mm_U-BOOT_BOARD_TYPE)))
INSTALL_PREF = rk3588s
else
INSTALL_PREF = rk3588
endif
endif

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \
	CROSS_COMPILE_M0=arm-none-eabi- \

build-custom:
	@echo " "
	@echo "---------------------------------------------------------------"
	@echo "Building BL31 ..."
	@echo " "
	@echo "  -mm_U-BOOT_BOARD_TYPE : $(mm_U-BOOT_BOARD_TYPE)"
	@echo "  -BL31 for plat.       : $(PLATFORM)"
	@echo "  -Build atrefact       : $(WORKSRC)/build/$(BUILD_BIN)"
	@echo "  -Install              : $(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/bl31.bin"
	@echo "---------------------------------------------------------------"
	@echo " "
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) PLAT=$(PLATFORM) DEBUG=1 bl31
	@echo "Instaling bl31 trusted firmware for $(PLATFORM) ..."
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)"
	@cp $(WORKSRC)/build/$(BUILD_BIN) $(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/bl31.bin
	@$(MAKECOOKIE)

clean-all: clean
	@rm -f $(DESTDIR)$(libdir)/u-boot/$(PLATFORM)/bl31.bin
