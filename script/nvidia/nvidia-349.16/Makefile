NVIDIA_MAJOR_VERSION = 349
NVIDIA_MINOR_VERSION = 16
NVIDIA_TEENY_VERSION =

# PATCHFILES = linux-4.0-fix-build.patch

BUILD_SCRIPTS   = nvidia
INSTALL_SCRIPTS = nvidia

BUILD_ARGS = $(NVIDIA_MAKE_ARGS)
BUILD_ENV  = $(NVIDIA_MAKE_ENV)

GAR_EXTRA_CONF += kernel-$(mm_KERNEL_VERSION)/linux/package-api.mk nvidia/nvidia/package-api.mk 
include ../../gar.mk
