GARNAME = dbus-glib
GARVERSION = 0.100.2
CATEGORIES = gtk
MASTER_SITES = http://dbus.freedesktop.org/releases/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = \
	$(DISTNAME)-automake_1.13.patch
LICENSE = LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS    = lang/c lib/expat lib/dbus gtk/glib
BUILDDEPS  = lib/dbus
ifneq ($(DESTIMG),build)
BUILDDEPS += gtk/dbus-glib
endif

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS  = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-tests \
	--disable-ansi \
	--disable-verbose-mode \
	--disable-asserts \
	--enable-checks \
	--disable-gcov \
	--disable-bash-completion \
	--enable-shared \
	--disable-static \
	--disable-gtk-doc \
	--disable-gtk-doc-html \
	--disable-gtk-doc-pdf \
	--with-gnu-ld
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--with-dbus-binding-tool=$(build_DESTDIR)$(build_bindir)/dbus-binding-tool
endif

CONFIGURE_ENV  =
ifneq ($(DESTIMG),build)
CONFIGURE_ENV += \
  	ac_cv_have_abstract_sockets='yes'
endif

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libdbus-glib-1.la
	@$(MAKECOOKIE)
