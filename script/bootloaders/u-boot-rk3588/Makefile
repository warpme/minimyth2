
ifeq (1,1)
GARNAME      = u-boot-rk3588-kwiboo-v3
# git@05.02.2023 https://github.com/Kwiboo/u-boot-rockchip/commits/rk3588-master-v3
# https://github.com/Kwiboo/u-boot-rockchip/archive/2455fbb1e97271afd87e9c3a3967644f3da7d4a6.zip
GARVERSION   = 2455fbb1e97271afd87e9c3a3967644f3da7d4a6
# git@19.10.2022 https://github.com/radxa/rkbin/commits/master
RKBINVERSION = 9840e87723eef7c41235b89af8c049c1bcd3d133
CATEGORIES   = kernel
MASTER_SITES = \
		https://github.com/Kwiboo/u-boot-rockchip/archive/ \
		https://github.com/radxa/rkbin/archive/
DISTFILES    = $(GARVERSION).zip $(RKBINVERSION).zip 
WORKSRC      = $(WORKDIR)/u-boot-rockchip-$(GARVERSION)
endif

ifeq (0,1)
GARNAME      = u-boot-rk3588-mainline
# https://github.com/u-boot/u-boot/archive/faac9dee8e0629326dc122f4624fc4897e3f38b0.zip
# mainline 2023.04-rc2 14.02.2023
GARVERSION   = faac9dee8e0629326dc122f4624fc4897e3f38b0
# git@19.10.2022 https://github.com/radxa/rkbin/commits/master
RKBINVERSION = 9840e87723eef7c41235b89af8c049c1bcd3d133
CATEGORIES   = kernel
MASTER_SITES = \
		https://github.com/u-boot/u-boot/archive/ \
		https://github.com/radxa/rkbin/archive/
DISTFILES    = $(GARVERSION).zip $(RKBINVERSION).zip
# https://patchwork.ozlabs.org/project/uboot/list/?series=339202 
PATCHFILES   = arm-Add-Rockchip-RK3588-support.patch
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)
endif

ifeq (0,1)
GARNAME      = u-boot-rk3588-jagan
# https://github.com/edgeble/u-boot/archive/d5233c6866509a975a2b8406e94597e9e286cdee.zip
# 30.01.2023
GARVERSION   = d5233c6866509a975a2b8406e94597e9e286cdee
# git@19.10.2022 https://github.com/radxa/rkbin/commits/master
RKBINVERSION = 9840e87723eef7c41235b89af8c049c1bcd3d133
CATEGORIES   = kernel
MASTER_SITES = \
		https://github.com/edgeble/u-boot/archive/ \
		https://github.com/radxa/rkbin/archive/
DISTFILES    = $(GARVERSION).zip $(RKBINVERSION).zip
# https://patchwork.ozlabs.org/project/uboot/patch/20230127072133.852818-1-jagan@edgeble.ai/
PATCHFILES   = Revert-rockchip-Only-call-binman-when-TPL-available.patch
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)
endif

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

# mm_U-BOOT_BOARD_TYPE = neu6a-io-rk3588_defconfig
mm_U-BOOT_BOARD_TYPE = evb-rk3588_defconfig

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \

pre-configure:
	@mkdir -p $(WORKDIR)/rkbin
	@mv -f $(WORKDIR)/rkbin-$(RKBINVERSION)/* $(WORKDIR)/rkbin/
	@ln -srf $(WORKDIR)/rkbin/bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.08.bin $(WORKSRC)/ddr.bin
	@$(MAKECOOKIE)

configure-custom:
	@echo "Configuring u-boot rk3588 with $(CONFIGURE_ARGS) ..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot rk3588 with $(CONFIGURE_ARGS) ..."
	@$(call PYTHON3_SET_BUILD_SYSCONF)
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(PARALLELMFLAGS) BL31=../rkbin/bin/rk35/rk3588_bl31_v1.28.elf
	@$(call PYTHON3_SET_MAIN_SYSCONF)
	@echo "Creating idbloader.img ..."
	@cd ./$(WORKSRC) && ./tools/mkimage -n rk3588 -T rksd -d ../rkbin/bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.08.bin:spl/u-boot-spl.bin idbloader.img
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
