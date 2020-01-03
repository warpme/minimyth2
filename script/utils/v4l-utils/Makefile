GARNAME = v4l-utils
GARVERSION = 1.16.6
CATEGORIES = utils
MASTER_SITES = http://linuxtv.org/downloads/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = $(DISTNAME)-perl.patch.gar
LICENSE = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/sysfsutils qt/qt5 lib/slang

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

post-install:
	@rm -f $(DESTDIR)$(libdir)/libdvbv5.la
	@rm -f $(DESTDIR)$(libdir)/libv4l1.la
	@rm -f $(DESTDIR)$(libdir)/libv4l2.la
	@rm -f $(DESTDIR)$(libdir)/libv4l2rds.la
	@rm -f $(DESTDIR)$(libdir)/libv4lconvert.la
	@$(MAKECOOKIE)
