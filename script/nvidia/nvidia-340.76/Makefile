NVIDIA_MAJOR_VERSION = 340
NVIDIA_MINOR_VERSION = 76
NVIDIA_TEENY_VERSION =

# PATCHFILES = kernel-3.18-no_drm_driver.set_busid.patch

BUILD_SCRIPTS   = nvidia
INSTALL_SCRIPTS = nvidia

BUILD_ARGS = $(NVIDIA_MAKE_ARGS)
BUILD_ENV  = $(NVIDIA_MAKE_ENV)

GAR_EXTRA_CONF += kernel-$(mm_KERNEL_VERSION)/linux/package-api.mk nvidia/nvidia/package-api.mk 
include ../../gar.mk
