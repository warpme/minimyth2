
GARNAME      = gcc-arm-none-eabi
GARVERSION   = 10.3-2021.10
CATEGORIES   = lib
MASTER_SITES = https://developer.arm.com/-/media/Files/downloads/gnu-rm/$(GARVERSION)/
DISTFILES    = gcc-arm-none-eabi-$(GARVERSION)-x86_64-linux.tar.bz2
WORKSRC      = $(WORKDIR)/gcc-arm-none-eabi-$(GARVERSION)
LICENSE      = 

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = 
INSTALL_SCRIPTS   = custom

install-custom:
	@mkdir -p $(DESTDIR)$(libdir)/arm-none-eabi
	@cp -rf $(WORKSRC)/* $(DESTDIR)$(libdir)/arm-none-eabi
	@ln -srf $(DESTDIR)$(libdir)/arm-none-eabi/bin/arm-none-eabi-gcc  $(DESTDIR)$(bindir)/arm-none-eabi-gcc
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(libdir)/arm-none-eabi
	@rm -f  $(DESTDIR)$(bindir)/arm-none-eabi-gcc

include ../../gar.mk
