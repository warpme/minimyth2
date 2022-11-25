
GARNAME      = avahi
GARVERSION   = 0.8
CATEGORIES   = lib
MASTER_SITES = http://avahi.org/download/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = LGPL2_1

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/dbus lib/expat lib/libdaemon lib/libevent

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-glib \
	--disable-gobject \
	--disable-introspection \
	--disable-qt3 \
	--disable-qt4 \
	--disable-qt5 \
	--disable-gtk \
	--disable-gtk3 \
	--enable-dbus \
	--disable-dbm \
	--disable-gdbm \
	--enable-libdaemon \
	--disable-python \
	--disable-python-dbus \
	--disable-mono \
	--disable-monodoc \
	--disable-autoipd \
	--disable-doxygen-doc \
	--disable-doxygen-dot \
	--disable-doxygen-man \
	--disable-doxygen-rtf \
	--disable-doxygen-xml \
	--disable-doxygen-chm \
	--disable-doxygen-chi \
	--disable-doxygen-html \
	--disable-doxygen-ps \
	--disable-doxygen-pdf \
	--disable-core-docs \
	--disable-manpages \
	--disable-xmltoman \
	--disable-tests \
	--enable-compat-libdns_sd \
	--disable-compat-howl \
	--with-gnu-ld \
	--with-distro='none'

include ../../gar.mk

#pre-configure:
#	@$(call RUN_AUTOTOOLS)
#	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
#	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libavahi-libevent.la
	@rm -f $(DESTDIR)$(libdir)/libavahi-common.la
	@rm -f $(DESTDIR)$(libdir)/libavahi-core.la
	@rm -f $(DESTDIR)$(libdir)/libavahi-client.la
	@rm -f $(DESTDIR)$(libdir)/libdns_sd.la
	@$(MAKECOOKIE)
