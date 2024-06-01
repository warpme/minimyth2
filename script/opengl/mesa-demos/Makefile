
GARNAME      = mesa-demos
GARVERSION   = 9.0.0
CATEGORIES   = $(CATEGORY)
MASTER_SITES = https://mesa.freedesktop.org/archive/demos/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = MIT

DESCRIPTION =.
define BLURB
endef

DEPENDS = lang/c \
	opengl/glew \
	opengl/glu \
	opengl$(if $(filter mesa,$(mm_OPENGL_PROVIDER)),$(CATEGORY)/mesa) \
	opengl/freeglut \

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D wayland="disabled" \

include ../../gar.mk
