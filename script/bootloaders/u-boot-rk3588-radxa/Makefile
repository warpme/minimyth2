
GARNAME      = u-boot-rk3588-rockchip-20231010
# git@ 10.10.2023 https://github.com/radxa/u-boot/commits/next-dev
GARVERSION   = b54d452d46459bc6e4cfc1a2795c9aad143aa174
# git@ 16.06.2023 https://github.com/radxa/rkbin/commits/master
RKBINVERSION = 38ab40ee2b3cc3d5a4a4f9aee56cba37392ccc9e
CATEGORIES   = kernel
MASTER_SITES = \
		https://github.com/radxa/u-boot/archive/ \
		https://github.com/radxa/rkbin/archive/
DISTFILES    = $(GARVERSION).zip $(RKBINVERSION).zip
PATCHFILES   = fix-gcc13-compile.patch dts-rk3588s-rock-5a-add-ethernet0-alias.patch 
PATCHFILES  += add-orangepi_5_plus_defconfig.patch
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

# mm_U-BOOT_BOARD_TYPE = rock-5b-rk3588_defconfig
# mm_U-BOOT_BOARD_TYPE = rock-5a-rk3588s_defconfig
# mm_U-BOOT_BOARD_TYPE = orangepi_5_plus_defconfig

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \

pre-configure:
	@mkdir -p $(WORKDIR)/rkbin
	@mv -f $(WORKDIR)/rkbin-$(RKBINVERSION)/* $(WORKDIR)/rkbin/
	@# dealing with hardcoded toolchain paths in Rockchip's make.sh
	@sed -i "s|CROSS_COMPILE_ARM32=.*|CROSS_COMPILE_ARM32=$(build_DESTDIR)$(build_bindir)/$(compiler_prefix)|" $(WORKSRC)/make.sh
	@sed -i "s|CROSS_COMPILE_ARM64=.*|CROSS_COMPILE_ARM64=$(build_DESTDIR)$(build_bindir)/$(compiler_prefix)|" $(WORKSRC)/make.sh
	@$(MAKECOOKIE)

configure-custom:
	@echo "Configuring u-boot rk3588 with $(CONFIGURE_ARGS) ..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot rk3588 with $(CONFIGURE_ARGS) ..."
	@$(call PYTHON3_SET_BUILD_SYSCONF)
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) $(PARALLELMFLAGS) BL31=../rkbin/bin/rk35/rk3588_bl31_v1.38.elf spl/u-boot-spl.bin u-boot.dtb u-boot.itb
	@$(call PYTHON3_SET_MAIN_SYSCONF)
	@echo "Creating idbloader.img ..."
	@cd ./$(WORKSRC) && ./tools/mkimage -n rk3588 -T rksd -d ../rkbin/bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin:spl/u-boot-spl.bin idbloader.img
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/rk3588/$(mm_U-BOOT_BOARD_TYPE)"
	@echo "Instaling idbloader.img ..."
	@cp -f  $(WORKSRC)/idbloader.img \
		$(DESTDIR)$(libdir)/u-boot/rk3588/$(mm_U-BOOT_BOARD_TYPE)/idbloader.img
	@echo "Instaling u-boot.itb ..."
	@cp -f  $(WORKSRC)/u-boot.itb \
		$(DESTDIR)$(libdir)/u-boot/rk3588/$(mm_U-BOOT_BOARD_TYPE)/u-boot.itb
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
