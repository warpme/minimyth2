GARNAME = v4l-utils
GARVERSION = 1.6.3
CATEGORIES = utils
MASTER_SITES = http://linuxtv.org/downloads/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.bz2
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

include ../../gar.mk

# I don't know why but libtool relinking on ARM needs this...
# xxxx - fixme
pre-configure:
ifeq ($(DESTIMG),main)
ifeq ($(GARCH_FAMILY),arm)
	@echo "Hack for building Wayland on ARM..."
	@ln -sr $(DESTDIR)$(elibdir)/libgcc_s.so $(DESTDIR)$(libdir)/libgcc_s.so
	@ln -sr $(DESTDIR)$(elibdir)/libgcc_s.so.1 $(DESTDIR)$(libdir)/libgcc_s.so.1
endif
endif
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libdvbv5.la
	@rm -f $(DESTDIR)$(libdir)/libv4l1.la
	@rm -f $(DESTDIR)$(libdir)/libv4l2.la
	@rm -f $(DESTDIR)$(libdir)/libv4l2rds.la
	@rm -f $(DESTDIR)$(libdir)/libv4lconvert.la
# I don't know why but libtool relinking on ARM needs this...
# xxxx - fixme
	@echo "Deleting hack for building Wayland on ARM..."
	@rm -f $(DESTDIR)$(libdir)/libgcc_s.so
	@rm -f $(DESTDIR)$(libdir)/libgcc_s.so.1
	@$(MAKECOOKIE)
