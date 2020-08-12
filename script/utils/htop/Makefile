GARNAME = htop
GARVERSION = 2.2.0
CATEGORIES = utils
MASTER_SITES = https://hisham.hm/$(GARNAME)/releases/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/ncursesw

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules

include ../../gar.mk

CPPFLAGS += -fcommon
CFLAGS   += -fcommon
