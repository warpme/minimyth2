GARNAME = iguanaIR
GARVERSION = 1.0.3
CATEGORIES = system
MASTER_SITES = http://iguanaworks.net/downloads/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = \
	$(DISTNAME)-udev.patch \
	$(DISTNAME)-dash.patch \
	$(DISTNAME)-cflags.patch \
	$(DISTNAME)-fwhole_program.patch
LICENSE = GPL2/LGPL2_1

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/libusb-compat lib/popt

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-python

CONFIGURE_ENV  =
ifneq ($(DESTIMG),build)
CONFIGURE_ENV += \
	ac_cv_func_lstat_dereferences_slashed_symlink='yes' \
	ac_cv_func_malloc_0_nonnull='yes' \
	ac_cv_func_realloc_0_nonnull='yes'
endif
INSTALL_ENV    = \
	RPM_OS='yes'

include ../../gar.mk

pre-configure:
	@cd $(WORKSRC)/autoconf ; aclocal --verbose --force
	@cd $(WORKSRC)/autoconf ; autoconf --verbose --force -o ../configure
	@$(MAKECOOKIE)
