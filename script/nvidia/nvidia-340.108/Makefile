
NVIDIA_MAJOR_VERSION = 340
NVIDIA_MINOR_VERSION = 108
NVIDIA_TEENY_VERSION =

PATCHFILES  = 0001-fix-compile-on-5.6-rc1.patch
PATCHFILES += 0002-fix-compile-on-5.7-rc1.patch
PATCHFILES += 0004-fix-compile-on-5.8.patch
PATCHFILES += 0005-fix-compile-on-5.9.patch
PATCHFILES += 0006-fix-compile-on-5.10.patch
PATCHFILES += 0007-fix-compile-on-5.14.patch
PATCHFILES += 0008-fix-compile-on-5.15.patch
PATCHFILES += 0009-fix-compile-on-5.16.patch
PATCHFILES += 0010-fix-compile-on-5.17.patch
PATCHFILES += 0011-fix-compile-on-5.18.patch
PATCHFILES += 0012-hack-linus-to-nvidia-licensing-middle-finger-5.18.patch

BUILD_SCRIPTS   = nvidia
INSTALL_SCRIPTS = nvidia

BUILD_ARGS = $(NVIDIA_MAKE_ARGS)
BUILD_ENV  = $(NVIDIA_MAKE_ENV)

GAR_EXTRA_CONF += kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk nvidia/nvidia/package-api-legacy.mk
include ../../gar.mk

post-install:
	@cd files; ./generate-nvidia-udev-rule.sh $(NVIDIA_MAJOR_VERSION).$(NVIDIA_MINOR_VERSION)
	@$(MAKECOOKIE)
