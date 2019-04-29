GARNAME      = u-boot-20190429
GARVERSION   = 6aebc0d11a10f48a54146c5e71bbef15a1a458fc
CATEGORIES   = kernel
MASTER_SITES = https://github.com/u-boot/u-boot/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

include ../../gar.mk

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \
	ARCH=$(GARCH_FAMILY) \

configure-custom:
	@$(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(PARALLELMFLAGS)
	@$(MAKECOOKIE)

git//%$(DISTNAME).tar.bz2:
	@$(call FETCH_GIT, $*, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)/boot"
ifeq ($(mm_U-BOOT_BOARD_TYPE),rpi_2_defconfig)
	@cp -f $(WORKSRC)/u-boot.bin $(DESTDIR)/boot/kernel7.img
endif
ifeq ($(mm_U-BOOT_BOARD_TYPE),rpi_3_defconfig)
	@cp -f $(WORKSRC)/u-boot.bin $(DESTDIR)/boot/kernel8.img
endif
ifeq ($(mm_U-BOOT_BOARD_TYPE),p212_defconfig)
	@cp -f $(WORKSRC)/u-boot.bin $(DESTDIR)/boot/s905_u-boot
endif
ifeq ($(mm_U-BOOT_BOARD_TYPE),evb-rk3328_defconfig)
	@cp -f $(WORKSRC)/u-boot.bin $(DESTDIR)/boot/rk3328_u-boot
endif
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)/boot/kernel7.img
	@rm -f $(DESTDIR)/boot/kernel8.img
	@rm -f $(DESTDIR)/boot/s905_u-boot
	@rm -f $(DESTDIR)/boot/rk3328_u-boot
