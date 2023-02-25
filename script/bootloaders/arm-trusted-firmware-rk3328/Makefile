
GARNAME      = arm-trusted-firmware-20201117-rk3328
# mainline v2.4 GA 17.11.2020
GARVERSION   = e2c509a39c6cc4dda8734e6509cdbe6e3603cdfc
CATEGORIES   = kernel
MASTER_SITES = https://github.com/ARM-software/arm-trusted-firmware/archive/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = 01-fix-building-with-binutils-2.39.patch
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
	@echo "Building bl31 trusted firmware for Rockchip RK3328 ..."
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) PLAT=rk3328 DEBUG=1 bl31
	@echo "Instaling bl31 trusted firmware for Rockchip RK3328 ..."
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/rk3328"
	@cp $(WORKSRC)/build/rk3328/debug/bl31/bl31.elf $(DESTDIR)$(libdir)/u-boot/rk3328/bl31.bin
	@$(MAKECOOKIE)

clean-all: clean
	@rm -f $(DESTDIR)$(libdir)/u-boot/rk3328/bl31.bin
