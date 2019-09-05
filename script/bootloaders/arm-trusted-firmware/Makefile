
GARNAME      = arm-trusted-firmware-20190628
GARVERSION   = 39c92b6271f4bde4e84f2459dbc18228cedd7825
CATEGORIES   = kernel
MASTER_SITES = https://github.com/ARM-software/arm-trusted-firmware/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/arm-trusted-firmware-$(GARVERSION)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

CONFIGURE_SCRIPTS   = 
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

include ../../gar.mk

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \

build-custom:
ifneq (,$(findstring h6,$(mm_BOARD_TYPE)))
	@echo "Building bl31 trusted firmware for SunXi H6..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) PLAT=sun50i_h6 DEBUG=1 bl31
endif
	@$(MAKECOOKIE)

install-custom:
ifneq (,$(findstring h6,$(mm_BOARD_TYPE)))
	@echo "Instaling bl31 trusted firmware for SunXi H6..."
	@mkdir -p "$(DESTDIR)/boot/h6loaderfiles"
	@cp $(WORKSRC)/build/sun50i_h6/debug/bl31.bin $(DESTDIR)/boot/h6loaderfiles/bl31.bin
endif
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)/boot/h6loaderfiles/bl31.bin
