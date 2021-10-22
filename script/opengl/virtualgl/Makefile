
GARNAME      = VirtualGL
GARVERSION   = 2.4
CATEGORIES   = opengl
MASTER_SITES = http://downloads.sourceforge.net/project/virtualgl/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE.txt

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	xorg/xcb-util-keysyms \
	opengl/glu \
	lib/libjpeg-turbo

CONFIGURE_SCRIPTS = $(WORKSRC)/cmake
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DTJPEG_INCLUDE_DIR=$(DESTDIR)$(includedir) \
	-DTJPEG_LIBRARY=$(DESTDIR)$(libdir)/libturbojpeg.so \
	-DVGL_FAKEXCB="ON" \

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk
