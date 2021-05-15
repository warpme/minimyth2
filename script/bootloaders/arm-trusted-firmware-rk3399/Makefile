
GARNAME      = arm-trusted-firmware-rk3399-stikonas
GARVERSION   = 14-05-2021
CATEGORIES   = kernel
MASTER_SITES = https://stikonas.eu/files/gentoo-sources/u-boot/
DISTFILES    = bl31.elf
WORKSRC      = $(WORKDIR)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

CONFIGURE_SCRIPTS   = 
BUILD_SCRIPTS       = 
INSTALL_SCRIPTS     = custom

include ../../gar.mk

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \

install-custom:
	@echo "Instaling bl31 trusted firmware for rk3399..."
	@mkdir -p "$(DESTDIR)$(libdir)/u-boot/rk3399"
	@cp $(WORKSRC)/bl31.elf $(DESTDIR)$(libdir)/u-boot/rk3399/bl31.bin
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)$(libdir)/u-boot/rk3399/bl31.bin
