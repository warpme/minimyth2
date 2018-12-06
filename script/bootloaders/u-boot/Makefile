GARNAME = u-boot
GARVERSION = 20181105-99431c1
CATEGORIES = kernel
MASTER_SITES = git://git.denx.de/u-boot.git/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = GPL2
WORKSRC = $(WORKDIR)/$(GARNAME)-$(GARVERSION)

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
	@mkdir -p "$(DESTDIR)$(LINUX_DIR)"
	@cp  $(WORKSRC)/u-boot.bin $(DESTDIR)/boot/u-boot.bin
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(DESTDIR)/boot/u-boot.bin
