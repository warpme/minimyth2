
GARNAME      = crust-v0.6
# v0.6 2.09.2023
GARVERSION   = ffe9f1ac9c675e6e67db9084bd19fbdeffd8e162
CATEGORIES   = bootloaders
MASTER_SITES = https://github.com/crust-firmware/crust/archive/
PATCHFILES   = 0002-switch-TanixTX6-proto-to-NEC.patch
DISTFILES    = $(GARVERSION).tar.gz
WORKSRC      = $(WORKDIR)/crust-$(GARVERSION)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c
BUILDDEPS = devel/gcc-or1k-linux

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

# set to default value when package build is called without any defined board....
CRUST_CONFIG ?= tanix_tx6_defconfig

include ../../gar.mk

export CROSS_COMPILE=$(build_libdir)/gcc-or1k-linux/bin/or1k-linux-

# CRUST_CONFIG is defined in board-x package as config is per board specific!
configure-custom:
	@echo " "
	@echo "---------------------------------------------------------------"
	@echo "Building crust ..."
	@echo " "
	@echo "  -CRUST_CONFIG : $(CRUST_CONFIG)"
	@echo "---------------------------------------------------------------"
	@echo " "
	@echo "CONFIG_DEBUG_LOG=y" >> $(WORKSRC)/configs/$(CRUST_CONFIG)
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CRUST_CONFIG)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building crust ..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) scp
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)"
	@cp -f $(WORKSRC)/build/scp/scp.bin \
	       $(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/scp.bin
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
	@rm -rf $(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/scp.bin
