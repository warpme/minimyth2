
# URL GIT: https://github.com/superna9999/meson_gx_mali_450/

GARNAME = meson-gx-mali450
GARVERSION = DX910-SW-99002-r6p1-01rel0_meson_gx
CATEGORIES = system
MASTER_SITES = https://github.com/superna9999/meson_gx_mali_450/archive/
DISTFILES = $(GARVERSION).zip
WORKSRC = $(WORKDIR)/meson_gx_mali_450-$(GARVERSION)/driver/src/devicedrv/mali
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

GAR_EXTRA_CONF += kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk
include ../../gar.mk

BUILD_ARGS        = $(LINUX_MAKE_ARGS)

# These params are taken from <root sources>/build.sh
BUILD_ARGS        += "USING_UMP=0 BUILD=debug MALI_DMA_BUF_MAP_ON_ATTACH=1 USING_PROFILING=0 MALI_PLATFORM=meson USING_DVFS=0"

build-custom:
	$(warning build_args:$(BUILD_ARGS))
	@$(MAKE) -C $(WORKSRC) $(BUILD_ARGS) KDIR=$(DESTDIR)$(LINUX_SOURCEDIR)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/gpu/drm/mali
	@cp -f $(WORKSRC)/mali.ko $(DESTDIR)$(LINUX_MODULESDIR)/kernel/drivers/gpu/drm/mali
	@depmod -b $(DESTDIR) -v $(LINUX_FULL_VERSION)
	@$(MAKECOOKIE)
