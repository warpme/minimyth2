
# master page with radxa uboot for rk3399 boards:
# https://github.com/radxa/rockchip-bsp

GARNAME      = u-boot-rk3399-rockchip-20221107
# https://github.com/radxa/u-boot/archive/
GARVERSION   = 8e67d581610eb7abd97885e1069b94dcf15b592c
# https://github.com/radxa/rkbin/commits/master
RKBINVERSION = 9840e87723eef7c41235b89af8c049c1bcd3d133
# https://github.com/radxa/build/commits/debian
BUILDSCRVERSION = 1ba389f4468a93dca5906d0ea50e28d042a85c00
CATEGORIES   = kernel
MASTER_SITES = \
		https://github.com/radxa/u-boot/archive/ \
		https://github.com/radxa/rkbin/archive/ \
		https://github.com/radxa/build/archive/
DISTFILES    = $(GARVERSION).zip $(RKBINVERSION).zip $(BUILDSCRVERSION).zip
PATCHFILES   = 01-scripts-dtc-Remove-redundant-YYLOC-global-declaration.patch
PATCHFILES  += 02-fix-building-gcc9.patch
PATCHFILES  += 03-arm-dts-remove-unused-rk-boards.patch
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c
BUILDDEPS = devel/swig utils/dtc python2/python-pyelftools

CONFIGURE_SCRIPTS   = 
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

include ../../gar.mk
include ../../python2/python/package-api.mk

# mm_U-BOOT_BOARD_TYPE = rk3399-rock-pi-4a
# mm_U-BOOT_BOARD_TYPE = rk3399-rock-pi-4b
# mm_U-BOOT_BOARD_TYPE = rk3399-rock-pi-4c
# mm_U-BOOT_BOARD_TYPE = rk3399-rock-4c-plus

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

pre-configure:
	@mkdir -p $(WORKDIR)/u-boot
	@mkdir -p $(WORKDIR)/rkbin
	@mkdir -p $(WORKDIR)/build
	@mv -f $(WORKDIR)/u-boot-$(GARVERSION)/* $(WORKDIR)/u-boot/
	@mv -f $(WORKDIR)/rkbin-$(RKBINVERSION)/* $(WORKDIR)/rkbin/
	@mv -f $(WORKDIR)/build-$(BUILDSCRVERSION)/* $(WORKDIR)/build/
	@# dealing with hardcoded toolchain paths in Rockchip's boards-config.sh
	@sed -i "s|CROSS_COMPILE=.*|CROSS_COMPILE=$(compiler_prefix)|" $(WORKDIR)/build/board_configs.sh
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot rk3399 with $(mm_U-BOOT_BOARD_TYPE) ..."
	@cd $(WORKDIR); pwd; ./build/mk-uboot.sh $(mm_U-BOOT_BOARD_TYPE)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/rk3399/$(mm_U-BOOT_BOARD_TYPE)"
	@echo "Instaling idbloader.img ..."
	@cp -f  $(WORKDIR)/out/u-boot/idbloader.img \
		$(DESTDIR)$(libdir)/u-boot/rk3399/$(mm_U-BOOT_BOARD_TYPE)/idbloader.img
	@echo "Instaling u-boot.img ..."
	@cp -f  $(WORKDIR)/out//u-boot/uboot.img \
		$(DESTDIR)$(libdir)/u-boot/rk3399/$(mm_U-BOOT_BOARD_TYPE)/uboot.img
	@echo "Instaling trust.img ..."
	@cp -f  $(WORKDIR)/out/u-boot/trust.img \
		$(DESTDIR)$(libdir)/u-boot/rk3399/$(mm_U-BOOT_BOARD_TYPE)/trust.img
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
