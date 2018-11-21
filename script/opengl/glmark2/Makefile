GARNAME = glmark2
GARVERSION = 40409f36c37b6f270e49c57b467a8543ae7b06fa
CATEGORIES = $(CATEGORY)
MASTER_SITES  = https://github.com/glmark2/glmark2/archive/
DISTFILES = $(GARVERSION).zip
WORKSRC = $(WORKDIR)/glmark2-$(GARVERSION)
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c          \
	lib/libjpeg-turbo \
	lib/libpng        \
	xorg/libX11       \
	xorg/libxcb       \
	xorg/libdrm       \
	python/python     \

PWD := $(shell pwd)
CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

include ../../gar.mk

CC=$(compiler_prefix)$(build_CC)
CXX=$(compiler_prefix)$(build_CXX)
export CC
export CXX

# Allowable flawors: x11-gl, mir-gl, x11-glesv2, drm-gl, wayland-gl, wayland-glesv2, drm-glesv2, mir-glesv2, dispmanx-glesv2
COMMA := ,
BUILD_FLAVORS = "drm-glesv2,x11-glesv2$(if $(filter mesa lima,$(mm_OPENGL_PROVIDER)),$(COMMA)drm-gl)$(if $(filter mesa lima,$(mm_OPENGL_PROVIDER)),$(COMMA)x11-gl)"

configure-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/python ./waf configure --with-flavors=$(BUILD_FLAVORS) --data-path=$(datadir)/glmark2 --prefix=$(prefix)
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/python ./waf
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/python ./waf install --destdir=$(DESTDIR)
	@$(MAKECOOKIE)
