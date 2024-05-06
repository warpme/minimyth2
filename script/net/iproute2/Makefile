
GARNAME      = iproute2
GARVERSION   = 6.8.0
CATEGORIES   = net
MASTER_SITES = https://mirrors.edge.kernel.org/pub/linux/utils/net/iproute2/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL2

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \

include ../../gar.mk
