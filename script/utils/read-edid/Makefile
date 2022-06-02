
GARNAME      = read-edid
GARVERSION   = 3.0.2
CATEGORIES   = utils
MASTER_SITES = http://www.polypux.org/projects/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = 01-remove-COPYING.patch
PATCHFILES  += 02-fix-GCC-10-FTBFS.patch
LICENSE      = GPL

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DCLASSICBUILD=OFF \

include ../../gar.mk
