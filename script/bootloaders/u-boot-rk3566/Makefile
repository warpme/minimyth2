
GARNAME      = u-boot-rk3566-rockchip-16022022
# git@16.02.2022
GARVERSION   = 6336d2324985831ed766031f91d410d0e587dbc8
# git@7.01.2022
RKBINVERSION = 104659686b734ab041ef958c0abece1a250f48a4
CATEGORIES   = kernel
MASTER_SITES = \
		https://github.com/JeffyCN/rockchip_mirrors/archive/ \
		https://gitlab.com/pgwipeout/u-boot-rockchip/-/archive/$(GARVERSION)/
DISTFILES    = $(RKBINVERSION).zip $(GARVERSION).tar.bz2 
PATCHFILES   = 01-add-x96_x6-tvbox.patch
PATCHFILES  += 02-fix-compilation.patch
PATCHFILES  += 03-swap-gmac0-gmac1-in-aliases.patch
PATCHFILES  += 04-net.h-make-random-mac-constant.patch
PATCHFILES  += 05-drivers-mmc-rockchip_dw_mmc-fix-eval-always-true.patch
PATCHFILES  += 06-fix-building-gcc13.patch
WORKSRC      = $(WORKDIR)/u-boot-rockchip-$(GARVERSION)

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

# mm_U-BOOT_BOARD_TYPE = rk3566-x96_x6_defconfig

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \

pre-configure:
	@mkdir -p $(WORKDIR)/rkbin
	@mv -f $(WORKDIR)/rockchip_mirrors-$(RKBINVERSION)/* $(WORKDIR)/rkbin/
	@sed -i "s|python |$(build_bindir)/python3 |g" $(WORKSRC)/make.sh
	@# dealing with hardcoded toolchain paths in Rockchip's make.sh
	@sed -i "s|arm-linux-gnueabihf|$(compiler_prefix)|g" $(WORKSRC)/make.sh
	@sed -i "s|aarch64-linux-gnu-|$(compiler_prefix)|g" $(WORKSRC)/make.sh
	@sed -i "s|#TOOLCHAIN_ARM32=.*|TOOLCHAIN_ARM32=$(build_DESTDIR)$(build_bindir)|g" $(WORKSRC)/make.sh
	@sed -i "s|#TOOLCHAIN_ARM64=.*|TOOLCHAIN_ARM64=$(build_DESTDIR)$(build_bindir)|g" $(WORKSRC)/make.sh
	@# enabling commented-out toolchain setup in Rockchip's make.sh
	@sed -i "s|#select_toolchain|select_toolchain|g" $(WORKSRC)/make.sh
	@$(MAKECOOKIE)

configure-custom:
	@echo "Configuring u-boot rk3566 with $(CONFIGURE_ARGS) ..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot rk3566 with $(CONFIGURE_ARGS) ..."
	@$(call PYTHON3_SET_BUILD_SYSCONF)
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) $(PARALLELMFLAGS)
	@echo "Running Rockchip make.sh to pack images ..."
	@cd ./$(WORKSRC) && ./make.sh
	@$(call PYTHON3_SET_MAIN_SYSCONF)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/rk3566/$(mm_U-BOOT_BOARD_TYPE)"
	@echo "Instaling idblock.bin ..."
	@cp -f  $(WORKSRC)/idblock.bin \
		$(DESTDIR)$(libdir)/u-boot/rk3566/$(mm_U-BOOT_BOARD_TYPE)/idblock.bin
	@echo "Instaling uboot.img ..."
	@cp -f  $(WORKSRC)/uboot.img \
		$(DESTDIR)$(libdir)/u-boot/rk3566/$(mm_U-BOOT_BOARD_TYPE)/uboot.img
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
