
GARNAME      = libpcap
GARVERSION   = 1.10.2
CATEGORIES   = lib
MASTER_SITES = https://www.tcpdump.org/release/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = BSD

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk
