GARNAME = wayland
GARVERSION = 1.15.0
CATEGORIES = $(CATEGORY)
MASTER_SITES = https://wayland.freedesktop.org/releases/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c \
	lib/libxslt \
	lib/libffi

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-documentation \
	--disable-dtd-validation

ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += --with-host-scanner "$(build_DESTDIR)$(build_bindir)/wayland-scanner"
endif

GAR_EXTRA_CONF += $(CATEGORY)/xorg/package-api.mk
include ../../gar.mk

pre-configure:
# I don't know why but libtool relinking on ARM needs this...
# xxxx - fixme
ifeq ($(DESTIMG),main)
ifeq ($(GARCH_FAMILY),arm)
	@echo "Hack for building Wayland on ARM..."
	@ln -sr $(DESTDIR)$(elibdir)/libgcc_s.so $(DESTDIR)$(libdir)/libgcc_s.so
	@ln -sr $(DESTDIR)$(elibdir)/libgcc_s.so.1 $(DESTDIR)$(libdir)/libgcc_s.so.1
endif
endif
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libwayland-client.la
	@rm -f $(DESTDIR)$(libdir)/libwayland-cursor.la
	@rm -f $(DESTDIR)$(libdir)/libwayland-egl.la
	@rm -f $(DESTDIR)$(libdir)/libwayland-server.la
# I don't know why but libtool relinking on ARM needs this...
# xxxx - fixme
	@echo "Deleting hack for building Wayland on ARM..."
	@rm -f $(DESTDIR)$(libdir)/libgcc_s.so
	@rm -f $(DESTDIR)$(libdir)/libgcc_s.so.1
	@$(MAKECOOKIE)
