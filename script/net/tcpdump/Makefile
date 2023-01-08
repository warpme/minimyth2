
GARNAME      = tcpdump
GARVERSION   = 4.99.2
CATEGORIES   = net
MASTER_SITES = https://www.tcpdump.org/release/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = BSD

DEPENDS = lib/libpcap

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

include ../../gar.mk

