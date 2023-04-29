
GARNAME      = v4l-utils
GARVERSION   = 20230423-d42567298311
CATEGORIES   = utils
MASTER_SITES = git://linuxtv.org/v4l-utils.git/
DISTFILES    = $(DISTNAME).tar.bz2
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
	-D gconv="disabled" \
	-D doxygen-doc="disabled" \
	-D doxygen-html="false" \
	-D doxygen-man="false" \

git//%$(DISTNAME).tar.bz2:
	@$(call FETCH_GIT, $*, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libdvbv5.la
	@rm -f $(DESTDIR)$(libdir)/libv4l1.la
	@rm -f $(DESTDIR)$(libdir)/libv4l2.la
	@rm -f $(DESTDIR)$(libdir)/libv4l2rds.la
	@rm -f $(DESTDIR)$(libdir)/libv4lconvert.la
	@$(MAKECOOKIE)
