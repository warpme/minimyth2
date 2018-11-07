GARNAME = VirtualGL
GARVERSION = 2.4
CATEGORIES = $(CATEGORY)
MASTER_SITES = http://downloads.sourceforge.net/project/virtualgl/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE.txt

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	xorg/xcb-util-keysyms \
	opengl/glu \
	lib/libjpeg-turbo

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/cmake
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	-DCMAKE_INSTALL_PREFIX="$(prefix)" \
	-DCMAKE_FIND_ROOT_PATH="$(DESTDIR)$(prefix)" \
	-DCMAKE_VERBOSE_MAKEFILE="1" \
	-DTJPEG_INCLUDE_DIR=$(DESTDIR)$(includedir) \
	-DTJPEG_LIBRARY=$(DESTDIR)$(libdir)/libturbojpeg.so \
	-DVGL_FAKEXCB=1

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

configure-%/cmake: 
	@echo " ==> Running configure in $*"
	@cd $* && $(CONFIGURE_ENV) cmake $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)
