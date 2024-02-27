
GARNAME      = libplacebo
GARVERSION   = v6.338.2
CATEGORIES   = lib
MASTER_SITES = https://code.videolan.org/videolan/libplacebo/-/archive/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = add-missing-vulkan-headers.patch
LICENSE      = GPL

DEPENDS = lang/c

BUILDDEPS = python3/python-glad2

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D vulkan="disabled" \
	-D vk-proc-addr="disabled" \
	-D vulkan-registry="disabled" \
	-D demos="false" \

include ../../gar.mk

pre-configure:
	@cd $(WORKSRC); git submodule update --init
