GARNAME = findutils
GARVERSION = 4.6.0
CATEGORIES = utils
MASTER_SITES = https://ftp.gnu.org/gnu/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES  = $(DISTNAME)-perl.patch.gar
PATCHFILES += $(DISTNAME)-glibc2.28-fix-fflush.patch
PATCHFILES += $(DISTNAME)-glibc2.28-fix-makedev.patch
LICENSE = GPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-rpath \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@# Disable building doc as this requires some perl modules..and is basically useless here
	@sed -i '/^SUBDIRS/s/doc//' $(WORKSRC)/Makefile.in
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)
