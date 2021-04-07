GARNAME = freeglut
GARVERSION = 2.8.0
CATEGORIES = $(CATEGORY)
MASTER_SITES = http://downloads.sourceforge.net/project/$(GARNAME)/$(GARNAME)/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = $(DISTNAME)-disable_example_smooth_opengl3.patch
LICENSE = MIT

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

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes="$(DESTDIR)$(includedir)" \
	--x-libraries="$(DESTDIR)$(libdir)" \
	--enable-shared \
	--disable-static \
	--enable-replace-glut \
	--enable-warnings \
	--disable-warnings-as-errors \
	--disable-debug \
	--with-gnu-ld \
	--with-x

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libglut.la
	@$(MAKECOOKIE)
