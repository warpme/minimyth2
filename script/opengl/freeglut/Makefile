
GARNAME      = freeglut
GARVERSION   = 3.8.0
CATEGORIES   = $(CATEGORY)
MASTER_SITES = http://downloads.sourceforge.net/project/$(GARNAME)/$(GARNAME)/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
# PATCHFILES   = $(DISTNAME)-disable_example_smooth_opengl3.patch
LICENSE      = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	xorg/libX11 \
	xorg/libXext \
	xorg/libXi \
	xorg/libXxf86vm \
	opengl/glu \
	$(if $(filter mesa,$(mm_OPENGL_PROVIDER)),opengl/mesa) \

PWD := $(shell pwd)
CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

include ../../gar.mk
