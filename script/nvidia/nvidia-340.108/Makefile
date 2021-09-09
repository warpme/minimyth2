
NVIDIA_MAJOR_VERSION = 340
NVIDIA_MINOR_VERSION = 108
NVIDIA_TEENY_VERSION =

PATCHFILES  = nvidia-340.108-fix-5.6-kernel-compile.patch
PATCHFILES += nvidia-340.108-fix-5.7-kernel-compile.patch
PATCHFILES += nvidia-340.108-5.7-kernel-reinstate-legacy-support.patch
PATCHFILES += nvidia-340.108-fix-5.8-kernel-compile.patch
PATCHFILES += nvidia-340.108-fix-5.9-kernel-compile.patch
PATCHFILES += nvidia-340.108-fix-5.10-kernel-compile.patch
PATCHFILES += nvidia-340.108-fix-5.11-kernel-compile.patch
PATCHFILES += nvidia-340.108-fix-5.14-kernel-compile.patch

BUILD_SCRIPTS   = nvidia
INSTALL_SCRIPTS = nvidia

BUILD_ARGS = $(NVIDIA_MAKE_ARGS)
BUILD_ENV  = $(NVIDIA_MAKE_ENV)

GAR_EXTRA_CONF += kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk nvidia/nvidia/package-api-legacy.mk
include ../../gar.mk

post-install:
	@cd files; ./generate-nvidia-udev-rule.sh $(NVIDIA_MAJOR_VERSION).$(NVIDIA_MINOR_VERSION)
	@$(MAKECOOKIE)
