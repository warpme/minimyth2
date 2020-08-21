
GARNAME      = gdb
GARVERSION   = 9.2
CATEGORIES   = devel
MASTER_SITES = https://ftp.gnu.org/gnu/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL2/LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/ncurses

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-werror \
	--prefix=$(BUILD_DESTDIR) \
	--with-build-sysroot=$(BUILD_DESTDIR)

include ../../gar.mk

configure-custom:
	@mkdir -p $(WORKSRC)/build; cd $(WORKSRC)/build; ../configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@$(MAKE) -C $(WORKSRC)/build all
	@$(MAKECOOKIE)

install-custom:
	@$(MAKE) -C $(WORKSRC)/build install
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libbfd.la
	@rm -f $(DESTDIR)$(libdir)/libopcodes.la
	@$(if $(filter $(GARHOST), $(GARTARGET)),, rm -f $(DESTDIR)$(prefix)/$(GARHOST)/$(GARTARGET)/lib/libbfd.la)
	@$(if $(filter $(GARHOST), $(GARTARGET)),, rm -f $(DESTDIR)$(prefix)/$(GARHOST)/$(GARTARGET)/lib/libopcodes.la)
	@$(MAKECOOKIE)
