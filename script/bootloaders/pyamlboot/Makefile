
GARNAME      = pyamlboot
GARVERSION   = c5a6d04c0d9e8f8077c0c50d37502782dac59cb3
CATEGORIES   = kernel
MASTER_SITES = https://github.com/superna9999/pyamlboot/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/pyamlboot-$(GARVERSION)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c
BUILDDEPS = 

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

include ../../gar.mk

export CROSS_COMPILE=$(build_libdir)/gcc-or1k-linux/bin/or1k-linux-

# CRUST_CONFIG is defined in board-x package as config is per board specific!
configure-custom:
	@echo "Configuring crust with $(CRUST_CONFIG) ..."
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
