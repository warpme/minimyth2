
GARNAME      = arm-trusted-firmware-a523
GARVERSION   = c102e62e8a13800c0454690d69689bd9c94f78c0
CATEGORIES   = kernel
MASTER_SITES = https://github.com/jernejsk/arm-trusted-firmware/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/arm-trusted-firmware-$(GARVERSION)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

CONFIGURE_SCRIPTS   = 
BUILD_SCRIPTS       = custom
# INSTALL_SCRIPTS     = syterkit-blob

include ../../gar.mk

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \

build-custom:
	@echo "Building bl31 trusted firmware for Allwinner A523..."
	@$(BUILD_ARGS) $(MAKE) $(PARALLELMFLAGS) -C $(WORKSRC) PLAT=sun55i_a523 DEBUG=1 bl31
	@echo "Instaling bl31 trusted firmware for Allwinner A523..."
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/a523"
	@cp $(WORKSRC)/build/sun55i_a523/debug/bl31.bin $(DESTDIR)$(libdir)/u-boot/a523/
	@cd $(WORKDIR); cp -f ../../files/scp.bin $(DESTDIR)$(libdir)/u-boot/a523/
	@$(MAKECOOKIE)

install-syterkit-blob:
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/a523"
	@cd $(WORKDIR); cp -f ../../files/{bl31.bin,scp.bin} \
			$(DESTDIR)$(libdir)/u-boot/a523/

clean-all: clean
	@rm -f $(DESTDIR)$(libdir)/u-boot/a523/{bl31.bin,scp.bin}
