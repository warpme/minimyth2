
GARNAME      = u-boot-radxa-rk3568-2023.10
# git@ 4.01.2024 https://github.com/radxa/u-boot/commits/rk3568-2023.10
GARVERSION   = eed05a18e50492ec20b16f97ace8d5d9606bb9f9
# git@ 26.12.2023 https://github.com/radxa/rkbin/commits/master
RKBINVERSION = fc44f9401c127affb2a879c1e90fa89ddab505f6
CATEGORIES   = kernel
MASTER_SITES = \
		https://github.com/radxa/u-boot/archive/ \
		https://github.com/radxa/rkbin/archive/
DISTFILES    = $(GARVERSION).zip $(RKBINVERSION).zip 
PATCHFILES  += 01-radxa-zero3-rk3566-defconfig-add-missing-para.patch
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

# mm_U-BOOT_BOARD_TYPE = rock-3c-rk3566_defconfig
# mm_U-BOOT_BOARD_TYPE = rk3566-quartz64_defconfig
# mm_U-BOOT_BOARD_TYPE = rk3566-orangepi-3b_defconfig
# mm_U-BOOT_BOARD_TYPE = radxa-zero3-rk3566_defconfig

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

TPL_BL31 = \
	ROCKCHIP_TPL=../rkbin/bin/rk35/rk3566_ddr_1056MHz_v1.18.bin \
	BL31=../rkbin/bin/rk35/rk3568_bl31_v1.44.elf \

DDR_BIN = \
	../rkbin/bin/rk35/rk3566_ddr_1056MHz_v1.18.bin

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \

pre-configure:
	@mkdir -p $(WORKDIR)/rkbin
	@mv -f $(WORKDIR)/rkbin-$(RKBINVERSION)/* $(WORKDIR)/rkbin/
	@$(MAKECOOKIE)

configure-custom:
	@echo "Configuring u-boot rk3566 with $(CONFIGURE_ARGS) ..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot rk3566 with $(CONFIGURE_ARGS) ..."
	@$(call PYTHON3_SET_BUILD_SYSCONF)
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) $(PARALLELMFLAGS) $(TPL_BL31)
	@$(call PYTHON3_SET_MAIN_SYSCONF)
	@echo "Creating idbloader.img ..."
	@cd ./$(WORKSRC) && ./tools/mkimage -n rk3568 -T rksd -d $(DDR_BIN):spl/u-boot-spl.bin idbloader.img
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/rk3566/$(mm_U-BOOT_BOARD_TYPE)"
	@echo "Instaling idbloader.img ..."
	@cp -f  $(WORKSRC)/idbloader.img \
		$(DESTDIR)$(libdir)/u-boot/rk3566/$(mm_U-BOOT_BOARD_TYPE)/idbloader.img
	@echo "Instaling u-boot.itb ..."
	@cp -f  $(WORKSRC)/u-boot.itb \
		$(DESTDIR)$(libdir)/u-boot/rk3566/$(mm_U-BOOT_BOARD_TYPE)/u-boot.itb
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
