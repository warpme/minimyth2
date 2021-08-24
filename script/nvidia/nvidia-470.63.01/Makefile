
NVIDIA_MAJOR_VERSION = 470
NVIDIA_MINOR_VERSION = 63
NVIDIA_TEENY_VERSION = 01

include ../../minimyth.conf.mk

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
