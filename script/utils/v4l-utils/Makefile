
GARNAME      = v4l-utils
GARVERSION   = 20210106-f4316861d
CATEGORIES   = utils
MASTER_SITES = git://linuxtv.org/v4l-utils.git/
DISTFILES    = $(DISTNAME).tar.bz2
PATCHFILES   = v4l-utils-perl.patch.gar
PATCHFILES  += v4l-utils-disable-po.patch
LICENSE      = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	lang/c \
	lib/sysfsutils \
	lib/slang \
	qt/qt \

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) \
        --build=$(GARBUILD) \
        --host=$(GARHOST) \
        --prefix="$(prefix)" \
        --disable-static \
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
        --disable-qv4l2 \
        --disable-qvidcap \

include ../../gar.mk

git//%$(DISTNAME).tar.bz2:
	@$(call FETCH_GIT, $*, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))
	@$(MAKECOOKIE)

pre-configure:
	@cd $(WORKSRC); ./bootstrap.sh
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libdvbv5.la
	@rm -f $(DESTDIR)$(libdir)/libv4l1.la
	@rm -f $(DESTDIR)$(libdir)/libv4l2.la
	@rm -f $(DESTDIR)$(libdir)/libv4l2rds.la
	@rm -f $(DESTDIR)$(libdir)/libv4lconvert.la
	@$(MAKECOOKIE)
