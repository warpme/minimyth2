
GARNAME      = snappy
GARVERSION   = 1.2.2
CATEGORIES   = lib
MASTER_SITES = https://github.com/google/snappy/archive/$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = BSD

DEPENDS = lang/c

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DBUILD_SHARED_LIBS="ON" \
	-DSNAPPY_BUILD_TESTS="OFF" \
	-DSNAPPY_BUILD_BENCHMARKS="OFF" \

include ../../gar.mk
