NVIDIA_MAJOR_VERSION = 455
NVIDIA_MINOR_VERSION = 45
NVIDIA_TEENY_VERSION = 01

include ../../minimyth.conf.mk

ifneq (,$(filter %5.9,$(mm_KERNEL_VERSION)))
PATCHFILES += nvidia-450.66-mmu.patch
PATCHFILES  = nvidia-450.66-kernel-5.9.patch
PATCHFILES += nvidia-450.66-license.patch
endif

BUILD_SCRIPTS   = nvidia
INSTALL_SCRIPTS = nvidia

BUILD_ARGS = $(NVIDIA_MAKE_ARGS)
BUILD_ENV  = $(NVIDIA_MAKE_ENV)

export IGNORE_MISSING_MODULE_SYMVERS=1

GAR_EXTRA_CONF += kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk nvidia/nvidia/package-api.mk
include ../../gar.mk

post-install:
	@cd files; ./generate-nvidia-udev-rule.sh $(NVIDIA_MAJOR_VERSION).$(NVIDIA_MINOR_VERSION)
	@$(MAKECOOKIE)
