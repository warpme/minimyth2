GARNAME      = u-boot-20200220-tools
GARVERSION   = 8e51bf746a11d7f67416859da73a83109af4e0a3
CATEGORIES   = kernel
MASTER_SITES = https://github.com/u-boot/u-boot/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/u-boot-$(GARVERSION)

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c lib/openssl

CONFIGURE_SCRIPTS   = custom
BUILD_SCRIPTS       = custom
INSTALL_SCRIPTS     = custom

include ../../gar.mk
include ../../python3/python/package-api.mk

BUILD_ARGS = \
	CROSS_COMPILE=$(compiler_prefix) \
	ARCH=$(GARCH_FAMILY) \

configure-custom:
	@$(MAKE) -C $(WORKSRC) defconfig
	@$(MAKECOOKIE)

build-custom:
	@$(call PYTHON3_SET_BUILD_SYSCONF)
	@$(MAKE) -C $(WORKSRC) $(PARALLELMFLAGS) tools-all
	@$(call PYTHON3_SET_MAIN_SYSCONF)
	@$(MAKECOOKIE)

git//%$(DISTNAME).tar.bz2:
	@$(call FETCH_GIT, $*, $(word 2,$(subst -, ,$(GARVERSION))), $(DISTNAME))
	@$(MAKECOOKIE)

install-custom:
	@cp -f $(WORKSRC)/tools/dumpimage   $(build_DESTDIR)$(build_bindir)/dumpimage
	@cp -f $(WORKSRC)/tools/img2srec    $(build_DESTDIR)$(build_bindir)/img2srec
	@cp -f $(WORKSRC)/tools/jtagconsole $(build_DESTDIR)$(build_bindir)/jtagconsole
	@cp -f $(WORKSRC)/tools/mkenvimage  $(build_DESTDIR)$(build_bindir)/mkenvimage
	@cp -f $(WORKSRC)/tools/mkimage     $(build_DESTDIR)$(build_bindir)/mkimage
	@cp -f $(WORKSRC)/tools/ncb         $(build_DESTDIR)$(build_bindir)/ncb
	@cp -f $(WORKSRC)/tools/netconsole  $(build_DESTDIR)$(build_bindir)/netconsole
	@$(MAKECOOKIE)

clean-all:
	@rm -f $(build_DESTDIR)$(build_bindir)/dumpimage
	@rm -f $(build_DESTDIR)$(build_bindir)/img2srec
	@rm -f $(build_DESTDIR)$(build_bindir)/jtagconsole
	@rm -f $(build_DESTDIR)$(build_bindir)/mkenvimage
	@rm -f $(build_DESTDIR)$(build_bindir)/mkimage
	@rm -f $(build_DESTDIR)$(build_bindir)/ncb
	@rm -f $(build_DESTDIR)$(build_bindir)/netconsole
