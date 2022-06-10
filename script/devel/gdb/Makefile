
GARNAME      = gdb
GARVERSION   = 12.1
CATEGORIES   = devel
MASTER_SITES = https://ftp.gnu.org/gnu/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL2/LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lib/ncurses devel/gmp

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

CONFIGURE_ARGS = --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-werror \
	--prefix=$(DESTDIR)$(prefix) \
	--with-build-sysroot=$(DESTDIR) \

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
	@rm -f $(DESTDIR)$(libdir)/libctf.la
	@rm -f $(DESTDIR)$(libdir)/libctf-nobfd.la
	@rm -f $(DESTDIR)$(libdir)/libopcodes.la
	@$(if $(filter $(GARHOST), $(GARTARGET)),, rm -f $(DESTDIR)$(prefix)/$(GARHOST)/$(GARTARGET)/lib/libbfd.la)
	@$(if $(filter $(GARHOST), $(GARTARGET)),, rm -f $(DESTDIR)$(prefix)/$(GARHOST)/$(GARTARGET)/lib/libctf.la)
	@$(if $(filter $(GARHOST), $(GARTARGET)),, rm -f $(DESTDIR)$(prefix)/$(GARHOST)/$(GARTARGET)/lib/libctf-nobfd.la)
	@$(if $(filter $(GARHOST), $(GARTARGET)),, rm -f $(DESTDIR)$(prefix)/$(GARHOST)/$(GARTARGET)/lib/libopcodes.la)
	@$(MAKECOOKIE)
