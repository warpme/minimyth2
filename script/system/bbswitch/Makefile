GARNAME = bbswitch
GARVERSION = 0.8
CATEGORIES = system
MASTER_SITES = http://github.com/Bumblebee-Project/bbswitch/archive/v$(GARVERSION)
DISTFILES = $(DISTNAME).tar.gz
LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = 

GAR_EXTRA_CONF += kernel-$(mm_KERNEL_VERSION)/linux/package-api.mk
include ../../gar.mk

post-install:
	@mkdir -p $(DESTDIR)$(LINUX_MODULESDIR)/misc/bbswitch
	@cp -f $(WORKSRC)/bbswitch.ko $(DESTDIR)$(LINUX_MODULESDIR)/misc/bbswitch/
	@depmod -b $(DESTDIR) -v $(LINUX_FULL_VERSION)
	@$(MAKECOOKIE)

pre-configure:
	@sed -e 's|KDIR :=.*|KDIR := $(DESTDIR)$(LINUX_SOURCEDIR)|g' -i $(WORKSRC)/Makefile
	@$(MAKECOOKIE)
