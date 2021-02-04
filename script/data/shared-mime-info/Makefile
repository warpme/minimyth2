
GARNAME      = shared-mime-info
GARVERSION   = 2.1
CATEGORIES   = $(CATEGORY)
MASTER_SITES = https://gitlab.freedesktop.org/xdg/shared-mime-info/-/archive/2.1/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/COPYING

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS  = 
BUILD_SCRIPTS      = 
INSTALL_SCRIPTS    = custom

include ../../gar.mk

install-custom:
	@echo "prefix=/usr" > $(DESTDIR)$(libdir)/pkgconfig/shared-mime-info.pc
	@echo "" >> $(DESTDIR)$(libdir)/pkgconfig/shared-mime-info.pc
	@echo "Name: shared-mime-info" >> $(DESTDIR)$(libdir)/pkgconfig/shared-mime-info.pc
	@echo "Description: Freedesktop common MIME database" >> $(DESTDIR)$(libdir)/pkgconfig/shared-mime-info.pc
	@echo "Version: 2.1" >> $(DESTDIR)$(libdir)/pkgconfig/shared-mime-info.pc
	@echo "Requires:" >> $(DESTDIR)$(libdir)/pkgconfig/shared-mime-info.pc
	@echo "Libs:" >> $(DESTDIR)$(libdir)/pkgconfig/shared-mime-info.pc
	@echo "Cflags:" >> $(DESTDIR)$(libdir)/pkgconfig/shared-mime-info.pc
	@$(MAKECOOKIE)
