
GARNAME      = cmake
GARVERSION   = 4.3.0
CATEGORIES   = devel
MASTER_SITES = http://www.cmake.org/files/v4.3/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = FindICU-stop-looking-first-in-lib64.patch
LICENSE      = BSD_3_Clause

DESCRIPTION = 
define BLURB
endef

DEPENDS = lib/openssl

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	--parallel=1 \
	--no-system-libs \
	--no-system-curl \
	--no-system-expat \
	--no-system-jsoncpp \
	--no-system-zlib \
	--no-system-bzip2 \
	--no-system-libarchive \
	--no-qt-gui \
	--prefix="$(prefix)" \
	--datadir="$(subst $(prefix),,$(datadir)/CMake)" \
	--docdir="$(subst $(prefix),,$(docdir)/CMake)" \
	--mandir="$(subst $(prefix),,$(mandir))" \
	--parallel=$(PARALLELMFLAGS) \

include ../../gar.mk
