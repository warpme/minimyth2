
GARNAME      = cmake
GARVERSION   = 3.24.1
CATEGORIES   = devel
MASTER_SITES = http://www.cmake.org/files/v3.24/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = $(DISTNAME)-disable-qt5-chcking-with-no-qt.patch
LICENSE      = BSD_3_Clause

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile


CONFIGURE_ARGS = \
	--verbose \
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
	--mandir="$(subst $(prefix),,$(mandir))"

include ../../gar.mk
