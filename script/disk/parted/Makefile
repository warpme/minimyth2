GARNAME = parted
GARVERSION = 3.2
CATEGORIES = lib
MASTER_SITES = http://ftp.gnu.org/gnu/parted/
DISTFILES = $(DISTNAME).tar.xz
LICENSE = $(GARNAME)
PATCHFILES = $(DISTNAME)-fix-compile.patch
PATCHFILES += $(DISTNAME)-fix-man-dir.patch
PATCHFILES += $(DISTNAME)-glibc2.28-add-sysmacros.patch
$(GARNAME)_LICENSE_TEXT=$(WORKSRC)/COPYING

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-device-mapper \
	--disable-nls \
	--without-man

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libparted.la
	@rm -f $(DESTDIR)$(libdir)/libparted-fs-resize.la
	@$(MAKECOOKIE)
