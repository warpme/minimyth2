
# Mainline U-boot v2023.01
GARNAME      = u-boot-2023.01
GARVERSION   = 2023.01
CATEGORIES   = kernel
MASTER_SITES = https://github.com/u-boot/u-boot/archive/
DISTFILES    = v$(GARVERSION).zip
PATCHFILES   = 0001-Kconfig-Remove-an-impossible-condition.patch
PATCHFILES  += 0002-binman-Prevent-entries-in-a-section-from-overlapping.patch
#PATCHFILES  += 0003-sunxi-binman-Enable-SPL-FIT-loading-for-32-bit-SoCs.patch
PATCHFILES  += 0005-sunxi-psci-Avoid-hanging-when-CPU-0-is-hot-unplugged.patch
PATCHFILES  += 0008-remoteproc-Add-a-driver-for-the-Allwinner-AR100.patch
PATCHFILES  += 0009-arm-dts-sunxi-h3-Add-nodes-for-AR100-remoteproc.patch
PATCHFILES  += 0010-sunxi-Add-OrangePi-3-LTS-board.patch
PATCHFILES  += 0011-arm-psci-Add-definitions-for-PSCI-v1.1.patch
PATCHFILES  += 0012-sunxi-H6-Add-basic-Eachlink-H6-Mini-support.patch
PATCHFILES  += 0013-sunxi-mmc-increase-stabilization-delay-from-1ms-to-20ms.patch
PATCHFILES  += 0014-unreliable-dram.patch
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c bootloaders/arm-trusted-firmware-h6
BUILDDEPS = devel/swig utils/dtc

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

include ../../gar.mk
include ../../python3/python/package-api.mk

# mm_U-BOOT_BOARD_TYPE = orangepi_3_lts_defconfig
# mm_U-BOOT_BOARD_TYPE = tanix_tx6_defconfig

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \
	BL31=$(DESTDIR)$(libdir)/u-boot/h6/bl31.bin \

configure-custom:
	@if [ -e $(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/scp.bin ] ; then \
		echo "Copying [$(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/scp.bin] to u-boot tree ..." ; \
		cp -pd $(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/scp.bin \
		$(WORKSRC)/scp.bin ; \
	 fi
	@echo "Configuring u-boot for SunXi H6 with $(CONFIGURE_ARGS) ..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot for SunXi H6 with $(CONFIGURE_ARGS) ..."
	@$(call PYTHON3_SET_BUILD_SYSCONF)
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) $(PARALLELMFLAGS)
	@$(call PYTHON3_SET_MAIN_SYSCONF)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)"
	@cp -f $(WORKSRC)/u-boot-sunxi-with-spl.bin \
	       $(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
