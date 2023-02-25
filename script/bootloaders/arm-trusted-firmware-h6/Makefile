
GARNAME      = arm-trusted-firmware-20201117-h6
# mainline v2.4 GA 17.11.2020
GARVERSION   = e2c509a39c6cc4dda8734e6509cdbe6e3603cdfc
CATEGORIES   = kernel
MASTER_SITES = https://github.com/ARM-software/arm-trusted-firmware/archive/
PATCHFILES   = 0001-sunxi-Don-t-enable-referenced-regulators.patch
PATCHFILES  += 0002-allwinner-psci-Improve-system-shutdown-reset-sequenc.patch
PATCHFILES  += 0003-fix-building-with-binutils-2.39.patch
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
	@echo "Building bl31 trusted firmware for Allwinner H6..."
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) PLAT=sun50i_h6 DEBUG=1 bl31
	@echo "Instaling bl31 trusted firmware for Allwinner H6..."
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/h6"
	@cp $(WORKSRC)/build/sun50i_h6/debug/bl31.bin $(DESTDIR)$(libdir)/u-boot/h6/bl31.bin
	@$(MAKECOOKIE)

clean-all: clean
	@rm -f $(DESTDIR)$(libdir)/u-boot/h6/bl31.bin
