
GARNAME      = u-boot-h6-20190702
GARVERSION   = 29c10c7113c8aaeab014c5af98201c92859fefe9
CATEGORIES   = kernel
MASTER_SITES = https://github.com/apritzel/u-boot/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c bootloaders/arm-trusted-firmware
BUILDDEPS = devel/swig utils/dtc

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

include ../../gar.mk

CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_TYPE)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \
	BL31=$(DESTDIR)/boot/h6loaderfiles/bl31.bin \

configure-custom:
	@echo "Configuring u-boot for SunXi H6..."
	@sed -i "s%HOSTCC%CC%g" $(WORKSRC)/scripts/dtc/pylibfdt/Makefile
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot for SunXi H6..."
	@$(BUILD_ARGS) $(warning HOSTCC is:$(HOSTCC)) $(MAKE) -C $(WORKSRC) $(PARALLELMFLAGS)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)/boot/h6loaderfiles"
	@cp -f $(WORKSRC)/u-boot-sunxi-with-spl.bin $(DESTDIR)/boot/h6loaderfiles/u-boot-sunxi-with-spl.bin
	@$(MAKECOOKIE)

clean-all:
	$(MAKE) clean -C ../arm-trusted-firmware
	@rm -f $(DESTDIR)/boot/h6loaderfiles/u-boot-sunxi-with-spl.bin
	@rm -f $(DESTDIR)/boot/h6loaderfiles/bl31.bin
