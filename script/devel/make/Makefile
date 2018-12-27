GARNAME = make
GARVERSION = $(MAKE_VERSION)
CATEGORIES = devel
MASTER_SITES = https://ftp.gnu.org/gnu/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.bz2
PATCHFILES = $(DISTNAME)-savannah_bug_30723.patch 
PATCHFILES += $(DISTNAME)-library_search.patch
PATCHFILES += $(DISTNAME)-fix-compile-glibc-glob.patch
ifneq ("$(DESTIMG)+$(CROSSIMG)","build+build")
PATCHFILES += $(DISTNAME)-perl.patch.gar
endif
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c
BUILDDEPS = devel-tainted/devel-tainted

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-rpath

include ../../gar.mk
