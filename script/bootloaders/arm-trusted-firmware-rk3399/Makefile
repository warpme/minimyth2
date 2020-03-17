GARNAME      = arm-trusted-firmware-20200310-rk3399
GARVERSION   = 65012c08922fa5646ca7ca485036dfd901cae360
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
	@echo "Building bl31 trusted firmware for rk3399..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) PLAT=rk3399 bl31
	@echo "Instaling bl31 trusted firmware for rk3399..."
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/rk3399"
	@cp $(WORKSRC)/build/rk3399/debug/bl31.bin $(DESTDIR)$(libdir)/u-boot/rk3399/bl31.bin
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)$(libdir)/u-boot/rk3399/bl31.bin
