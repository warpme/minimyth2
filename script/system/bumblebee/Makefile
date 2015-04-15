GARNAME = bumblebee
GARVERSION = 3.2.1
CATEGORIES = system
MASTER_SITES = http://www.bumblebee-project.org/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c system/udev xorg/Mesa xorg/virtualgl

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	CONF_DRIVER_MODULE_NVIDIA=nvidia \
	CONF_LDPATH_NVIDIA=$(libdir)/nvidia/ \
	CONF_MODPATH_NVIDIA=$(libdir)/nvidia/xorg/modules/drivers/ \
	--prefix=/usr \
	--sbindir=/usr/bin \
	--with-udev-rules=$(libdir)/nvidia/udev/rules.d/ \
	--sysconfdir=/etc \
	--without-pidfile

include ../../gar.mk
