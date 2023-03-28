
GARNAME      = arm-trusted-firmware-v2.8.1-h313
GARVERSION   = 2.8.1
CATEGORIES   = kernel
MASTER_SITES = https://github.com/ARM-software/arm-trusted-firmware/archive/refs/tags/
DISTFILES    = lts-v$(GARVERSION).tar.gz
PATCHFILES   = 01-fix-building-with-binutils-2.39.patch
WORKSRC      = $(WORKDIR)/arm-trusted-firmware-lts-v$(GARVERSION)

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
	@echo "Building bl31 trusted firmware for Allwinner H313..."
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) PLAT=sun50i_h616 DEBUG=1 bl31
	@echo "Instaling bl31 trusted firmware for Allwinner H313..."
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/h313"
	@cp $(WORKSRC)/build/sun50i_h616/debug/bl31.bin $(DESTDIR)$(libdir)/u-boot/h313/bl31.bin
	@$(MAKECOOKIE)

clean-all: clean
	@rm -f $(DESTDIR)$(libdir)/u-boot/h313/bl31.bin
