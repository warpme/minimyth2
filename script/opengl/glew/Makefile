GARNAME = glew
GARVERSION = 2.1.0
CATEGORIES = $(CATEGORY)
MASTER_SITES = http://downloads.sourceforge.net/project/$(GARNAME)/$(GARNAME)/$(GARVERSION)/
DISTFILES = $(DISTNAME).tgz
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE.txt

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	opengl/glu \
	xorg/libX11 \
	xorg/libXi \
	xorg/libXmu \
	xorg/libXext \
	$(if $(filter mesa,$(mm_OPENGL_PROVIDER)),opengl/mesa) \
	$(if $(filter lima,$(mm_OPENGL_PROVIDER)),opengl/mesa-lima) \

PWD := $(shell pwd)
CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

BUILD_ARGS  = \
	GLEW_DEST="$(prefix)" \
	BINDIR="$(bindir)" \
	LIBDIR="$(libdir)" \
	INCDIR="$(includedir)/GL" \
	CC="$(CC)" \
	LD="$(CC)" \
	AR="$(AR)" \
	POPT="$(CFLAGS)" \
	LDFLAGS.EXTRA="$(LDFLAGS)"

INSTALL_ARGS = \
	GLEW_DEST="$(prefix)" \
	BINDIR="$(bindir)" \
	LIBDIR="$(libdir)" \
	INCDIR="$(includedir)/GL"

include ../../gar.mk

CFLAGS  := $(CFLAGS)  -fPIC
LDFLAGS := $(LDFLAGS) -fPIC

post-install:
	@rm -f $(DESTDIR)$(libdir)/libGLEW.a
	@$(MAKECOOKIE)
