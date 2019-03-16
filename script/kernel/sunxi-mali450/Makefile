
# URL GIT: https://github.com/noblock/sunxi-mali/archive/

GARNAME = sunxi-mali450
GARVERSION = 98727ac8ce6953518753477591ecdf11983ea38c
CATEGORIES = system
MASTER_SITES = https://github.com/noblock/sunxi-mali/archive/
DISTFILES = $(GARVERSION).zip
WORKSRC = $(WORKDIR)/sunxi-mali-$(GARVERSION)/r9p0/src/devicedrv/mali
LICENSE = GPL2
 
PATCHFILES  = 0001-makefile-Add-install-target-and-build-the-module-by-.patch
PATCHFILES += 0004-mali-Print-the-mali-version-at-probe.patch
PATCHFILES += 0005-mali-Add-sunxi-platform.patch
PATCHFILES += 0006-mali-Allow-devfreq-to-run-without-power-models.patch
PATCHFILES += 0014-mali-Make-devfreq-optional.patch
PATCHFILES += 0013-mali-support-building-against-4.15.patch
PATCHFILES += 0015-Enable-parallel-building-passing-variable-to-Makefile.patch
PATCHFILES += 0016-mali-support-building-against-4.16.patch
PATCHFILES += 0018-mali-support-building-against-4.20.patch
PATCHFILES += 0019-mali-support-building-against-5.0.patch
PATCHFILES += 0090-mali-fix-sunxi-h5-platform.patch
PATCHFILES += 0091-mali-add-meson-gxbb-gxl.patch

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
BUILD_ARGS        += USING_UMP=0 BUILD=release USING_PROFILING=0 MALI_PLATFORM=sunxi USING_DVFS=1 USING_DEVFREQ=1

build-custom:
	$(warning build_args:$(BUILD_ARGS))
	@$(MAKE) -C $(WORKSRC) $(BUILD_ARGS) KDIR=$(DESTDIR)$(LINUX_SOURCEDIR)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(LINUX_MODULESDIR)/kernel/misc/gpu/drm/mali
	@cp -f $(WORKSRC)/mali.ko $(DESTDIR)$(LINUX_MODULESDIR)/kernel/misc/gpu/drm/mali
	@depmod -b $(DESTDIR) -v $(LINUX_FULL_VERSION)
	@$(MAKECOOKIE)

clean-all:
	@true
