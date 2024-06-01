
GARNAME      = v4l-utils
GARVERSION   = 1.26.1
CATEGORIES   = utils
MASTER_SITES = https://linuxtv.org/downloads/v4l-utils/
DISTFILES    = $(DISTNAME).tar.xz
PATCHFILES   = v4l-utils-perl.patch.gar
LICENSE      = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	lang/c \
	lib/sysfsutils \
	lib/slang \
	qt/qt \

CONFIGURE_SCRIPTS  = meson
BUILD_SCRIPTS      = meson
INSTALL_SCRIPTS    = meson

include ../../gar.mk

MESON_CONFIGURE_ARGS = \
	--buildtype=release \
	-D qv4l2="disabled" \
	-D qvidcap="disabled" \
	-D gconv="disabled" \
	-D doxygen-doc="disabled" \
	-D doxygen-html="false" \
	-D doxygen-man="false" \

post-install:
	@rm -f $(DESTDIR)$(libdir)/libdvbv5.la
	@rm -f $(DESTDIR)$(libdir)/libv4l1.la
	@rm -f $(DESTDIR)$(libdir)/libv4l2.la
	@rm -f $(DESTDIR)$(libdir)/libv4l2rds.la
	@rm -f $(DESTDIR)$(libdir)/libv4lconvert.la
	@$(MAKECOOKIE)
