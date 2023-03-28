
ifeq (0,1)
GARNAME      = arm-trusted-firmware-v2.8.1-h313
GARVERSION   = 2.8.1
CATEGORIES   = kernel
MASTER_SITES = https://github.com/ARM-software/arm-trusted-firmware/archive/refs/tags/
DISTFILES    = lts-v$(GARVERSION).tar.gz
PATCHFILES   = 01-fix-building-with-binutils-2.39.patch
WORKSRC      = $(WORKDIR)/arm-trusted-firmware-lts-v$(GARVERSION)
PLATFORM     = sun50i_h616
endif

ifeq (1,1)
GARNAME      = arm-trusted-firmware-h313-iuncuim-27032023
GARVERSION   = af90864e1fe628c75f70cd9699e3f89be23571a3
CATEGORIES   = kernel
MASTER_SITES = https://github.com/iuncuim/arm-trusted-firmware/archive/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = 01-fix-building-with-binutils-2.39.patch
WORKSRC      = $(WORKDIR)/arm-trusted-firmware-$(GARVERSION)
PLATFORM     = sun50i_t507
endif

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
	@echo "Building bl31 trusted firmware for Allwinner $(PLATFORM)..."
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) PLAT=$(PLATFORM) DEBUG=1 bl31
	@echo "Instaling bl31 trusted firmware for Allwinner $(PLATFORM)..."
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/h313"
	@cp $(WORKSRC)/build/$(PLATFORM)/debug/bl31.bin $(DESTDIR)$(libdir)/u-boot/h313/bl31.bin
	@$(MAKECOOKIE)

clean-all: clean
	@rm -f $(DESTDIR)$(libdir)/u-boot/h313/bl31.bin
