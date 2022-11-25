
# Git URL: https://github.com/superna9999/xf86-video-armsoc

GARNAME      = xf86-video-armsoc
GARVERSION   = 9b49434883c7c2d86b16854e14a9f89119550f25
MASTER_SITES = https://github.com/superna9999/xf86-video-armsoc/archive/
DISTFILES    = $(GARVERSION).tar.gz
WORKSRC      = $(WORKDIR)/$(GARNAME)-$(GARVERSION)

CATEGORIES = $(CATEGORY)
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	$(CATEGORY)/xorgproto \
	$(CATEGORY)/util-macros \
	$(CATEGORY)/xorg-server

BUILDDEPS = \
	$(CATEGORY)/xorg-sgml-doctools

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--with-gnu-ld

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

pre-configure:
	@if [ ! -e $(DESTDIR)$(libdir)/pkgconfig/dri.pc ] ; then \
		mkdir -p $(DESTDIR)$(libdir)/pkgconfig ; \
		echo "prefix=/usr"                                  >  $(DESTDIR)$(libdir)/pkgconfig/dri.pc ; \
		echo "exec_prefix=${prefix}"                        >> $(DESTDIR)$(libdir)/pkgconfig/dri.pc ; \
		echo "libdir=${exec_prefix}/lib"                    >> $(DESTDIR)$(libdir)/pkgconfig/dri.pc ; \
		echo "includedir=${prefix}/include"                 >> $(DESTDIR)$(libdir)/pkgconfig/dri.pc ; \
		echo "dridriverdir=/usr/lib/xorg/modules/dri"       >> $(DESTDIR)$(libdir)/pkgconfig/dri.pc ; \
		echo "Name: dri"                                    >> $(DESTDIR)$(libdir)/pkgconfig/dri.pc ; \
		echo "Description: Direct Rendering Infrastructure" >> $(DESTDIR)$(libdir)/pkgconfig/dri.pc ; \
		echo "Version: 11.1.2"                              >> $(DESTDIR)$(libdir)/pkgconfig/dri.pc ; \
		echo "Requires.private: libdrm >= 2.4.60"           >> $(DESTDIR)$(libdir)/pkgconfig/dri.pc ; \
		echo "Cflags: -I${includedir}"                      >> $(DESTDIR)$(libdir)/pkgconfig/dri.pc ; \
	fi
	@mkdir -p $(WORKSRC)/m4
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/xorg/modules/drivers/armsoc_drv.la
	@$(MAKECOOKIE)
