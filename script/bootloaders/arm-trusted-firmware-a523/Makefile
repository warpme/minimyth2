
GARNAME      = arm-trusted-firmware-a523
GARVERSION   = 20241227
CATEGORIES   = kernel
# MASTER_SITES = https://github.com/ARM-software/arm-trusted-firmware/archive/refs/tags/
# DISTFILES    = v$(GARVERSION).zip
WORKSRC      = $(WORKDIR)/arm-trusted-firmware-$(GARVERSION)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

CONFIGURE_SCRIPTS   = 
# BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

include ../../gar.mk

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \

build-custom:
	@echo "Building bl31 trusted firmware for Allwinner A523..."
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) PLAT=sun50i_a523 DEBUG=1 bl31
	@echo "Instaling bl31 trusted firmware for Allwinner A523..."
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/a523"
	@cp $(WORKSRC)/build/sun50i_a523/debug/bl31.bin $(DESTDIR)$(libdir)/u-boot/a523/bl31.bin
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/a523"
	@cd $(WORKDIR); cp -f ../../files/{bl31.bin,scp.bin} \
			$(DESTDIR)$(libdir)/u-boot/a523/

clean-all: clean
	@rm -f $(DESTDIR)$(libdir)/u-boot/a523/{bl31.bin,scp.bin}
