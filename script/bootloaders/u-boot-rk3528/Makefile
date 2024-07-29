
GARNAME      = u-boot-rk3528
# git@02.07.2024 https://github.com/radxa/u-boot/commits/next-dev-v2024.03/
GARVERSION   = 8ea7ee41671f59d5145535e45fe925f9180d23ca
# git@ 22.02.2024 https://github.com/rockchip-linux/rkbin/commits/master/
RKBINVERSION = a2a0b89b6c8c612dca5ed9ed8a68db8a07f68bc0
CATEGORIES   = kernel
MASTER_SITES = \
		https://github.com/radxa/u-boot/archive/ \
		https://github.com/rockchip-linux/rkbin/archive/
DISTFILES    = $(GARVERSION).zip $(RKBINVERSION).zip
PATCHFILES   = arch-arm-dts-rk3528-u-boot.dtsi-add-mmc-eth-aliases.patch

WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c
BUILDDEPS = devel/swig utils/dtc python3/python-pyelftools

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

include ../../gar.mk
include ../../python3/python/package-api.mk

# mm_U-BOOT_BOARD_TYPE = rk3528_defconfig

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \

pre-configure:
	@mkdir -p $(WORKDIR)/rkbin
	@mv -f $(WORKDIR)/rkbin-$(RKBINVERSION)/* $(WORKDIR)/rkbin/
	@# dealing with hardcoded toolchain paths in Rockchip's make.sh
	@sed -i "s|CROSS_COMPILE_ARM32=.*|CROSS_COMPILE_ARM32=$(build_DESTDIR)$(build_bindir)/$(compiler_prefix)|" $(WORKSRC)/make.sh
	@sed -i "s|CROSS_COMPILE_ARM64=.*|CROSS_COMPILE_ARM64=$(build_DESTDIR)$(build_bindir)/$(compiler_prefix)|" $(WORKSRC)/make.sh
	@cp $(WORKDIR)/rkbin/bin/rk35/rk3528_bl31_v1.17.elf $(WORKSRC)/bl31.elf
	@cp $(WORKDIR)/rkbin/bin/rk35/rk3528_bl32_v1.03.bin $(WORKSRC)/tee.bin
	@$(MAKECOOKIE)

configure-custom:
	@echo "Configuring u-boot rk3528 with $(CONFIGURE_ARGS) ..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot rk3528 with $(CONFIGURE_ARGS) ..."
	@$(call PYTHON3_SET_BUILD_SYSCONF)
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) $(PARALLELMFLAGS) BL31=../rkbin/bin/rk35/rk3528_bl31_v1.17.elf spl/u-boot-spl.bin u-boot.dtb u-boot.itb
	@$(call PYTHON3_SET_MAIN_SYSCONF)
	@echo "Creating idbloader.img ..."
	@cd ./$(WORKSRC) && ./tools/mkimage -n rk3528 -T rksd -d ../rkbin/bin/rk35/rk3528_ddr_1056MHz_4BIT_PCB_v1.09.bin:spl/u-boot-spl.bin idbloader.img
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/rk3528/$(mm_U-BOOT_BOARD_TYPE)"
	@echo "Instaling idbloader.img ..."
	@cp -f  $(WORKSRC)/idbloader.img \
		$(DESTDIR)$(libdir)/u-boot/rk3528/$(mm_U-BOOT_BOARD_TYPE)/idbloader.img
	@echo "Instaling u-boot.itb ..."
	@cp -f  $(WORKSRC)/u-boot.itb \
		$(DESTDIR)$(libdir)/u-boot/rk3528/$(mm_U-BOOT_BOARD_TYPE)/u-boot.itb
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
