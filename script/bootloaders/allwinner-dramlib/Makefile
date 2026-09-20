
# for testing purpouses
# mm_U-BOOT_BOARD_TYPE = test-a523.
# mm_U-BOOT_BOARD_TYPE = test-a733.

GARNAME      = allwinner-dramlib
# 14.05.2026
GARVERSION   = b1c31a940733da15a127be74dc9cb90bdd01a516
CATEGORIES   = bootloaders
MASTER_SITES = https://github.com/radxa/allwinner-dramlib/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/allwinner-dramlib-$(GARVERSION)
CATEGORIES   = bootloaders
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

CONFIGURE_SCRIPTS   = 
BUILD_SCRIPTS       = 
INSTALL_SCRIPTS     = custom

include ../../gar.mk

# set to default value when packahe is build without any defined board....
mm_U-BOOT_BOARD_TYPE ?= test-a733.

ifneq (,$(findstring a523.,$(mm_U-BOOT_BOARD_TYPE)))
SPL_BIN      = sun55iw3p1/spl_libdram/libdram
ARISC_BIN    = sun55iw3p1/arisc_liboem/libar100s.a
INSTALL_PREF = a523
endif

ifneq (,$(findstring a733.,$(mm_U-BOOT_BOARD_TYPE)))
SPL_BIN      = sun60iw2p1/spl_libdram/libdram
ARISC_BIN    = sun60iw2p1/arisc_liboem/libar100s.a
INSTALL_PREF = a733
endif

install-custom:
	@echo " "
	@echo "---------------------------------------------------------------"
	@echo "Building libdram for $(INSTALL_PREF) ..."
	@echo " "
	@echo "  -mm_U-BOOT_BOARD_TYPE : $(mm_U-BOOT_BOARD_TYPE)"
	@echo "  -install prefix       : $(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/"
	@echo "  -libdrm src file      : $(SPL_BIN)"
	@echo "  -arisc src file       : $(ARISC_BIN)"
	@echo "---------------------------------------------------------------"
	@echo " "
	@mkdir -p $(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)
	@cp $(WORKSRC)/$(SPL_BIN)   $(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/
	@cp $(WORKSRC)/$(ARISC_BIN) $(DESTDIR)$(libdir)/u-boot/$(INSTALL_PREF)/
	@$(MAKECOOKIE)

clean-all: clean

