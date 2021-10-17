

ifeq (0,1)
GARNAME      = arm-trusted-firmware-20210330-h616
# mainline master 30.03.2021
GARVERSION   = 8078b5c5a0c2a47710df96412d88df53486e2b29
CATEGORIES   = kernel
MASTER_SITES = https://github.com/ARM-software/arm-trusted-firmware/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/arm-trusted-firmware-$(GARVERSION)
endif

ifeq (1,1)
GARNAME      = arm-trusted-firmware-v2.5-h616
# mainline v2.5 GA
GARVERSION   = 2.5
CATEGORIES   = kernel
MASTER_SITES = https://github.com/ARM-software/arm-trusted-firmware/archive/refs/tags/
DISTFILES    = v$(GARVERSION).zip
WORKSRC      = $(WORKDIR)/arm-trusted-firmware-$(GARVERSION)
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
	@echo "Building bl31 trusted firmware for Allwinner H616..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) PLAT=sun50i_h616 DEBUG=1 bl31
	@echo "Instaling bl31 trusted firmware for Allwinner H616..."
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/h616"
	@cp $(WORKSRC)/build/sun50i_h616/debug/bl31.bin $(DESTDIR)$(libdir)/u-boot/h616/bl31.bin
	@$(MAKECOOKIE)

clean-all: clean
	@rm -f $(DESTDIR)$(libdir)/u-boot/h616/bl31.bin
