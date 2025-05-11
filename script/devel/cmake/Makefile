
GARNAME      = cmake
GARVERSION   = 4.0.2
CATEGORIES   = devel
MASTER_SITES = http://www.cmake.org/files/v4.0/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = BSD_3_Clause

DESCRIPTION = 
define BLURB
endef

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
