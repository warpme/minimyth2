
GARNAME      = arm-trusted-firmware-20200220
GARVERSION   = eda880ff8ec77ee429f5249f08571c41232b27db
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
	M0_CROSS_COMPILE=$(compiler_prefix) \

build-custom:
ifneq (,$(findstring h6,$(mm_BOARD_TYPE)))
	@echo "Building bl31 trusted firmware for SunXi H6..."
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) PLAT=sun50i_h6 DEBUG=1 bl31
endif
ifneq (,$(findstring rk3399,$(mm_BOARD_TYPE)))
	@echo "Building bl31 trusted firmware for rk3399..."
	$(warning buildrgs:$(BUILD_ARGS))
	@$(BUILD_ARGS) $(MAKE) -C $(WORKSRC) PLAT=rk3399 bl31
endif
	@$(MAKECOOKIE)

install-custom:
ifneq (,$(findstring h6,$(mm_BOARD_TYPE)))
	@echo "Instaling bl31 trusted firmware for SunXi H6..."
	@mkdir -p "$(DESTDIR)/boot/h6loaderfiles"
	@cp $(WORKSRC)/build/sun50i_h6/debug/bl31.bin $(DESTDIR)/boot/h6loaderfiles/bl31.bin
endif
ifneq (,$(findstring rk3399,$(mm_BOARD_TYPE)))
	@echo "Instaling bl31 trusted firmware for rk3399..."
	@mkdir -p "$(DESTDIR)/boot/rk3399loaderfiles"
	@cp $(WORKSRC)/build/rk3399/debug/bl31.bin $(DESTDIR)/boot/rk3399loaderfiles/bl31.bin
endif
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)/boot/h6loaderfiles/bl31.bin
	@rm -f $(DESTDIR)/boot/rk3399loaderfiles/bl31.bin
