GARNAME = kmscube
GARVERSION = 78d23c9eeb87c66e5bd8efa8c543cd35c2d01036
CATEGORIES = $(CATEGORY)
MASTER_SITES  = https://gitlab.freedesktop.org/mesa/kmscube/-/archive/$(GARVERSION)/
DISTFILES = kmscube-$(GARVERSION).tar.bz2
WORKSRC = $(WORKDIR)/kmscube-$(GARVERSION)
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

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

include ../../gar.mk

CC=$(compiler_prefix)$(build_CC)
CXX=$(compiler_prefix)$(build_CXX)
export CC
export CXX

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

clean-all:
	@true
