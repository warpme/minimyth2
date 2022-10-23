
GARNAME      = dbus-glib
GARVERSION   = 0.112
CATEGORIES   = gtk
MASTER_SITES = http://dbus.freedesktop.org/releases/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = LGPL2

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
	--with-gnu-ld \
	GLIB_GENMARSHAL=$(build_DESTDIR)$(build_bindir)/glib-genmarshal
ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	--enable-shared \
	--disable-static \
	--with-dbus-binding-tool=$(build_DESTDIR)$(build_bindir)/dbus-binding-tool
else
CONFIGURE_ARGS += \
	--disable-shared \
	--enable-static
endif

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libdbus-glib-1.la
	@$(MAKECOOKIE)
