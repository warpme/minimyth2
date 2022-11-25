
GARNAME      = dbus
GARVERSION   = 1.12.20
CATEGORIES   = lib
MASTER_SITES = http://dbus.freedesktop.org/releases/dbus/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/expat xorg/libX11 xorg/libXt lib/libffi

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--x-includes="$(DESTDIR)$(includedir)" \
	--x-libraries="$(DESTDIR)$(libdir)" \
	--enable-silent-rules \
	--enable-shared \
	--disable-static \
	--enable-verbose-mode \
	--enable-asserts \
	--enable-checks \
	--disable-xml-docs \
	--disable-doxygen-docs \
	--disable-selinux \
	--with-gnu-ld \
	--with-x \
	--with-dbus-user="root"

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libdbus-1.la
	@$(MAKECOOKIE)
