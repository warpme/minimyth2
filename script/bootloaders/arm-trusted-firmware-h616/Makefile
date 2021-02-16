GARNAME      = arm-trusted-firmware-20201208-h616
# v3 15.02.2021
GARVERSION   = a7d1ae372469a32d27d4274f14d5d55473ceef79
CATEGORIES   = kernel
MASTER_SITES = https://github.com/apritzel/arm-trusted-firmware/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/arm-trusted-firmware-$(GARVERSION)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

CONFIGURE_SCRIPTS   = 
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = 

include ../../gar.mk

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \

build-custom:
	@echo "Building bl31 trusted firmware for Allwinner H616..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) PLAT=sun50i_h616 DEBUG=1 bl31
	@echo "Instaling bl31 trusted firmware for Allwinner H616..."
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/h616"
	@cp $(WORKSRC)/build/sun50i_h616/debug/bl31.bin $(DESTDIR)$(libdir)/u-boot/h616/bl31.bin
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)$(libdir)/u-boot/h616/bl31.bin
