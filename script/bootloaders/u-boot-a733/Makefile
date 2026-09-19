
# For forcing given board (usually for testing)
# test bootloader will be in usr/lib/u-boot/test-<soc>

# for h6 - rememnber also to rebuild crust...
# mm_U-BOOT_BOARD_TYPE = test-h6.
# mm_U-BOOT_BOARD_DEFCONFIG = tanix_tx6_defconfig
# CRUST_CONFIG              = tanix_tx6_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = beelink_gs1_defconfig
# CRUST_CONFIG              = beelink_gs1_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = orangepi_3_lts_defconfig
# CRUST_CONFIG              = orangepi_3_defconfig

# mm_U-BOOT_BOARD_TYPE = test-h616.
# mm_U-BOOT_BOARD_DEFCONFIG = tanix_tx6s_axp313_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = tanix_tx6s_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = orangepi_zero2_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = tanix_tx6s_kingston_lpddr3_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = pendoo-x12_defconfig

# mm_U-BOOT_BOARD_TYPE = test-h313.
# mm_U-BOOT_BOARD_DEFCONFIG = x96_q_lpddr3_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = x96_q_lpddr3_v1.3_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = x96_q_ddr3_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = x96_q_ddr3_v5.1_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = tanix_tx1_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = tanix_tx1_v1.2_defconfig

# mm_U-BOOT_BOARD_TYPE = test-h618.
# mm_U-BOOT_BOARD_DEFCONFIG = orangepi_zero3_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = orangepi_zero2w_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = vontar_h618_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = transpeed-8k618-t_defconfig

# mm_U-BOOT_BOARD_TYPE = test-a523.
# mm_U-BOOT_BOARD_DEFCONFIG = radxa-cubie-a5e_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = orangepi_4a_defconfig
# mm_U-BOOT_BOARD_DEFCONFIG = x96q_pro_plus_defconfig

mm_U-BOOT_BOARD_TYPE = test-a733.
mm_U-BOOT_BOARD_DEFCONFIG = radxa-cubie-a7a_defconfig

GARNAME      = u-boot-a733
# A733/boot from 13.07.2026
#GARVERSION   = 24da4dae76374353cbe381e3074f2794dacafc0c
# A733/boot-2026.04 from 12.07.2026
GARVERSION   = c85cef9562351f538d113817091d240353e464c1
CATEGORIES   = bootloaders
MASTER_SITES = https://github.com/dlan17/u-boot/archive/
DISTFILES    = $(GARVERSION).zip


WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c
BUILDDEPS = devel/swig utils/dtc python3/python-pyelftools lib/libgnutls

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

include ../../gar.mk
include ../../python3/python/package-api.mk

# set to default value when package build is called without any defined board....
mm_U-BOOT_BOARD_TYPE      ?= test-h6.
mm_U-BOOT_BOARD_DEFCONFIG ?= tanix_tx6_defconfig
CRUST_CONFIG              ?= tanix_tx6_defconfig

# set this for inform ATF anc crust (for h6) about plat to build
export mm_U-BOOT_BOARD_TYPE
export CRUST_CONFIG

ifneq (,$(findstring h6.,$(mm_U-BOOT_BOARD_TYPE)))
INSTALL_PREF = h6
BL31         = $(DESTDIR)$(libdir)/u-boot/h6/bl31.bin
DEFCONFIG    = generic-h6_defconfig
endif
ifneq (,$(findstring h313.,$(mm_U-BOOT_BOARD_TYPE)))
INSTALL_PREF = h313
BL31         = $(DESTDIR)$(libdir)/u-boot/h313/bl31.bin
DEFCONFIG    = generic-h313_defconfig
endif
ifneq (,$(findstring h616.,$(mm_U-BOOT_BOARD_TYPE)))
INSTALL_PREF = h616
BL31         = $(DESTDIR)$(libdir)/u-boot/h616/bl31.bin
DEFCONFIG    = generic-h616_defconfig
endif
ifneq (,$(findstring h618.,$(mm_U-BOOT_BOARD_TYPE)))
INSTALL_PREF = h618
BL31         = $(DESTDIR)$(libdir)/u-boot/h618/bl31.bin
DEFCONFIG    = generic-h618_defconfig
endif
ifneq (,$(findstring a523.,$(mm_U-BOOT_BOARD_TYPE)))
INSTALL_PREF = a523
BL31         = $(DESTDIR)$(libdir)/u-boot/a523/bl31.bin
LIBDRAM      = $(DESTDIR)$(libdir)/u-boot/a523/libdram
DEFCONFIG    = generic-a523_defconfig
endif
ifneq (,$(findstring a733.,$(mm_U-BOOT_BOARD_TYPE)))
INSTALL_PREF = a733
BL31         = $(DESTDIR)$(libdir)/u-boot/a733/bl31.bin
LIBDRAM      = $(DESTDIR)$(libdir)/u-boot/a733/libdram
DEFCONFIG    = generic-a733_defconfig
endif

ifeq ($(mm_U-BOOT_BOARD_DEFCONFIG),)
mm_U-BOOT_BOARD_DEFCONFIG = $(DEFCONFIG)
endif
CONFIGURE_ARGS = $(mm_U-BOOT_BOARD_DEFCONFIG)

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \

$(BL31):
ifneq (,$(findstring a523.,$(mm_U-BOOT_BOARD_TYPE))$(findstring a733.,$(mm_U-BOOT_BOARD_TYPE)))
	@echo "Building A523/A733 ATF as dependency ..."
	@$(MAKE) clean install -C ../arm-trusted-firmware-aw
else
	@echo "Building ATF as dependency ..."
	@$(MAKE) clean install -C ../arm-trusted-firmware
endif
	@$(MAKECOOKIE)

$(LIBDRAM):
	@echo "Building A523/A733 libdram as dependency ..."
	@$(MAKE) clean install -C ../allwinner-dramlib

pre-everything: $(BL31) $(LIBDRAM)

pre-configure:
# handling h6 scp
ifneq (,$(findstring h6.,$(mm_U-BOOT_BOARD_TYPE)))
	@echo "Building crust with $(CRUST_CONFIG) config ..."
	@$(MAKE) clean install -C ../crust
	@if [ -e $(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/scp.bin ] ; then \
		echo "Copying [$(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/scp.bin] to u-boot tree ..." ; \
		cp -pd $(DESTDIR)$(libdir)/u-boot/h6/$(mm_U-BOOT_BOARD_TYPE)/scp.bin \
		       $(WORKSRC)/scp.bin ; \
	fi
endif

configure-custom:
	@echo " "
	@echo "------------------------------------------------------------------"
	@echo "Configuring u-boot with args:$(CONFIGURE_ARGS) ..."
	@echo " "
	@echo "  -mm_U-BOOT_BOARD_TYPE      : $(mm_U-BOOT_BOARD_TYPE)"
	@echo "  -mm_U-BOOT_BOARD_DEFCONFIG : $(mm_U-BOOT_BOARD_DEFCONFIG)"
	@echo "  -BL31                      : $(BL31)"
	@echo "  -libdram                   : $(LIBDRAM)"
	@echo "  -building defconfig        : $(mm_U-BOOT_BOARD_DEFCONFIG)"
	@echo "  -Install dir               : [$(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/$(mm_U-BOOT_BOARD_TYPE)]"
	@echo "-----------------------------------------------------------------"
	@echo " "
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo "Building u-boot with $(CONFIGURE_ARGS) ..."
	@$(call PYTHON3_SET_BUILD_SYSCONF)
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) $(PARALLELMFLAGS) BL31=$(BL31) SUNXI_LIBDRAM=$(LIBDRAM) all
	@$(call PYTHON3_SET_MAIN_SYSCONF)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/$(mm_U-BOOT_BOARD_TYPE)"
	@cp -f $(WORKDIR)/../../files/boot0_sdcard.bin \
	       $(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/$(mm_U-BOOT_BOARD_TYPE)/boot0_sdcard.bin
	@cp -f $(WORKDIR)/../../files/boot_package.fex \
	       $(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/$(mm_U-BOOT_BOARD_TYPE)/boot_package.fex
	@$(MAKECOOKIE)

clean-all: clean
	@rm -f $(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/bl31.bin
	@rm -f $(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/$(mm_U-BOOT_BOARD_TYPE)/u-boot-sunxi-with-spl.bin

menuconfig: configure
	@$(CONFIGURE_ENV) $(MAKE) $(CONFIGURE_ARGS) -C $(WORKSRC) menuconfig
