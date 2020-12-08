GARNAME      = arm-trusted-firmware-20201208-h616
GARVERSION   = 0b18d5a5d64a9700eca6158876234b76cbae4ee5
CATEGORIES   = kernel
MASTER_SITES = https://github.com/ARM-software/arm-trusted-firmware/archive/
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
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) PLAT=sun50i_h6 DEBUG=1 bl31
	@echo "Instaling bl31 trusted firmware for Allwinner H616..."
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/h616"
	@cp $(WORKSRC)/build/sun50i_h6/debug/bl31.bin $(DESTDIR)$(libdir)/u-boot/h616/bl31.bin
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)$(libdir)/u-boot/h616/bl31.bin
