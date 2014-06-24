GARNAME = mesa-demos
GARVERSION = 8.0.1
CATEGORIES = $(CATEGORY)
MASTER_SITES  = ftp://ftp.freedesktop.org/pub/mesa/demos/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	$(CATEGORY)/glew \
	$(CATEGORY)/glu \
	$(CATEGORY)/freeglut \
	$(CATEGORY)/Mesa

PWD := $(shell pwd)
CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--with-gnu-ld

include ../../gar.mk

LDFLAGS += -lX11 -lpthread

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)
