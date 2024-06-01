
GARNAME      = wakelan
GARVERSION   = 1.1
CATEGORIES   = net
MASTER_SITES = http://www.ibiblio.org/pub/Linux/system/network/misc/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = wakelan-1.1-fix-configure-on-gcc14.patch
LICENSE      = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile

CFLAGS += -Wno-implicit-function-declaration

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST)

INSTALL_OVERRIDE_DIRS = \
	prefix \
	exec_prefix \
	bindir \
	mandir
	
include ../../gar.mk
