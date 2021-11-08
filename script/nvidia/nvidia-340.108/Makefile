
NVIDIA_MAJOR_VERSION = 340
NVIDIA_MINOR_VERSION = 108
NVIDIA_TEENY_VERSION =

PATCHFILES  = 0001-fix-5.6-rc1.patch
PATCHFILES += 0002-fix-5.7-rc1.patch
PATCHFILES += 0003-fix-5.7-rc1-reinstate-legacy-support.patch
PATCHFILES += 0004-fix-5.8.patch
PATCHFILES += 0005-fix-5.9.patch
PATCHFILES += 0006-fix-5.10.patch
PATCHFILES += 0007-fix-5.14.patch
PATCHFILES += 0008-fix-5.15.patch

BUILD_SCRIPTS   = nvidia
INSTALL_SCRIPTS = nvidia

BUILD_ARGS = $(NVIDIA_MAKE_ARGS)
BUILD_ENV  = $(NVIDIA_MAKE_ENV)

GAR_EXTRA_CONF += kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk nvidia/nvidia/package-api-legacy.mk
include ../../gar.mk

post-install:
	@cd files; ./generate-nvidia-udev-rule.sh $(NVIDIA_MAJOR_VERSION).$(NVIDIA_MINOR_VERSION)
	@$(MAKECOOKIE)
