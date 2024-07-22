
# Mainline U-boot v2024.07
GARNAME      = u-boot-h6
GARVERSION   = 2024.07
CATEGORIES   = kernel
MASTER_SITES = https://github.com/u-boot/u-boot/archive/
DISTFILES    = v$(GARVERSION).tar.gz
PATCHFILES  += 0005-sunxi-psci-Avoid-hanging-when-CPU-0-is-hot-unplugged.patch
PATCHFILES  += 0007-remoteproc-Add-a-driver-for-the-Allwinner-AR100.patch
PATCHFILES  += 0008-arm-dts-sunxi-h3-Add-nodes-for-AR100-remoteproc.patch
PATCHFILES  += 0010-arm-psci-Add-definitions-for-PSCI-v1.1.patch
PATCHFILES  += 0011-DO-NOT-MERGE-sunxi-Enable-remoteproc-on-some-H3-boar.patch
PATCHFILES  += 0014-sunxi-Add-OrangePi-3-LTS-board.patch
PATCHFILES  += 0015-sunxi-mmc-increase-stabilization-delay-from-1ms-to-20ms.patch
PATCHFILES  += 0016-sunxi-dram-Fix-incorrect-ram-size-detection-for-some-H6-boards.patch
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
