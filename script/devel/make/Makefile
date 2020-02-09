GARNAME = make
GARVERSION = $(MAKE_VERSION)
CATEGORIES = devel
MASTER_SITES = https://ftp.gnu.org/gnu/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.gz

PATCHFILES  = $(DISTNAME)-library_search.patch
# PATCHFILES += $(DISTNAME)-glibc2.28-do-not-assume-glibc-glob-internals.patch
# PATCHFILES += $(DISTNAME)-glibc2.28-support-glob-interface-v2.patch
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
