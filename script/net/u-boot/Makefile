GARNAME = u-boot
GARVERSION = 20180823-2418734
CATEGORIES = net
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

CONFIGURE_ARGS = \
	HOST_CC="$(build_CC)" \
	CROSS_COMPILE="$(compiler_prefix)" \
	$(if $(filter armv7 ,$(GARCH_FAMILY)),rpi_2_defconfig) \
	$(if $(filter armv8 ,$(GARCH_FAMILY)),rpi_3_defconfig) \
	$(if $(filter i386  ,$(GARCH_FAMILY)),efi-x86_payload32_defconfig) \
	$(if $(filter x86_64,$(GARCH_FAMILY)),efi-x86_payload64_defconfig) \

include ../../gar.mk

configure-custom:
	$(warning configure cmd:$(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS))
	@$(MAKE) -C $(WORKSRC) $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	$(warning build cmd:$(MAKE) -C $(WORKSRC) $(PARALLELMFLAGS))
	@$(MAKE) -C $(WORKSRC) $(PARALLELMFLAGS)
	@$(MAKECOOKIE)

git//%$(DISTNAME).tar.bz2:
	@$(call FETCH_GIT, $*, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p "$(DESTDIR)/boot"
ifeq ($(GARCH),armv7)
	@cp  $(WORKSRC)/u-boot $(DESTDIR)/boot/u-boot.bin
else
ifeq ($(GARCH),armv8)
	@cp  $(WORKSRC)/u-boot $(DESTDIR)/boot/u-boot.bin
else
	@cp  $(WORKSRC)/u-boot $(DESTDIR)/boot/u-boot.bin
endif
endif
	@$(MAKECOOKIE)
