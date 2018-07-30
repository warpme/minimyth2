NVIDIA_MAJOR_VERSION = 340
NVIDIA_MINOR_VERSION = 107
NVIDIA_TEENY_VERSION =

BUILD_SCRIPTS   = nvidia
INSTALL_SCRIPTS = nvidia

BUILD_ARGS = $(NVIDIA_MAKE_ARGS)
BUILD_ENV  = $(NVIDIA_MAKE_ENV)

GAR_EXTRA_CONF += kernel-$(mm_KERNEL_VERSION)/linux/package-api.mk nvidia/nvidia/package-api-legacy.mk
include ../../gar.mk

post-install:
	@cd files; ./generate-nvidia-udev-rule.sh $(NVIDIA_MAJOR_VERSION).$(NVIDIA_MINOR_VERSION)
	@$(MAKECOOKIE)
