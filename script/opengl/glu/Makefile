
GARNAME       = glu
GARVERSION    = 9.0.3
CATEGORIES    = $(CATEGORY)
MASTER_SITES  = https://mesa.freedesktop.org/archive/glu/
DISTFILES     = $(DISTNAME).tar.xz
LICENSE       =

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx \
	$(if $(filter mesa,$(mm_OPENGL_PROVIDER)),opengl/mesa) \

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D gl_provider="gl" \

include ../../gar.mk
