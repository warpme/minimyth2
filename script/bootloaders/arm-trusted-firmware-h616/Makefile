
GARNAME      = arm-trusted-firmware-v2.10-h616
GARVERSION   = 2.10
CATEGORIES   = kernel
MASTER_SITES = https://github.com/ARM-software/arm-trusted-firmware/archive/refs/tags/
DISTFILES    = v$(GARVERSION).zip
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
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) PLAT=sun50i_h616 DEBUG=1 bl31
	@echo "Instaling bl31 trusted firmware for Allwinner H616..."
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/h616"
	@cp $(WORKSRC)/build/sun50i_h616/debug/bl31.bin $(DESTDIR)$(libdir)/u-boot/h616/bl31.bin
	@$(MAKECOOKIE)

clean-all: clean
	@rm -f $(DESTDIR)$(libdir)/u-boot/h616/bl31.bin
