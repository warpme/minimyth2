
GARNAME      = u-boot-rk3399-rockchip-21052021
# https://github.com/radxa/u-boot/archive/
GARVERSION   = f18abd08ab7b374d3c9e3865cfa193d6113463b5
# https://github.com/radxa/rkbin/commits/master
RKBINVERSION = e8e5d791093d7d229d29a54e23c7d541ff076d17
# https://github.com/radxa/build/commits/debian
BUILDSCRVERSION = 763eec0c7c29af9f60cca5e98eb1db6031b11976
CATEGORIES   = kernel
MASTER_SITES = \
		https://github.com/radxa/u-boot/archive/ \
		https://github.com/radxa/rkbin/archive/ \
		https://github.com/radxa/build/archive/
DISTFILES    = $(GARVERSION).zip $(RKBINVERSION).zip $(BUILDSCRVERSION).zip
PATCHFILES   = 01-scripts-dtc-Remove-redundant-YYLOC-global-declaration.patch
PATCHFILES  += 02-fix-building-gcc9.patch
PATCHFILES  += 03-arm-dts-remove-unused-rk-boards.patch
PATCHFILES  += 04-fix-building-gcc13.patch
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

mm_U-BOOT_BOARD_TYPE = rockpi4b

pre-configure:
	@mkdir -p $(WORKDIR)/u-boot
	@mkdir -p $(WORKDIR)/rkbin
	@mkdir -p $(WORKDIR)/build
	@mv -f $(WORKDIR)/u-boot-$(GARVERSION)/* $(WORKDIR)/u-boot/
	@mv -f $(WORKDIR)/rkbin-$(RKBINVERSION)/* $(WORKDIR)/rkbin/
	@mv -f $(WORKDIR)/build-$(BUILDSCRVERSION)/* $(WORKDIR)/build/
	@# dealing with hardcoded toolchain paths in Rockchip's mk-uboot.sh
	@sed -i "s|CROSS_COMPILE=.*|CROSS_COMPILE=$(compiler_prefix)|" $(WORKDIR)/build/mk-uboot.sh
	@sed -i "s|ARCH=.*|ARCH=aarch64|" $(WORKDIR)/build/mk-uboot.sh
	@sed -i "s|^make |CROSS_COMPILE=$(compiler_prefix) make |" $(WORKDIR)/build/mk-uboot.sh
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
