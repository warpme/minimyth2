
GARNAME       = archlinux-linux.pkg
GARVERSION    = 1.0
CATEGORIES    = archlinux
MASTER_SITES  = 
DISTFILES     = \
	60-linux.hook \
	90-linux.hook \
	kernel_data_key.vbprivk \
	kernel.keyblock \
	linux-aarch64.install \
	linux.preset \
	PKGBUILD \

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

BUILDDEPS = archlinux/pacman
DEPENDS   = kernel/kernel

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk
include ../../kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk

build-custom:
	@mkdir -p $(WORKSRC)/src
	@echo "symlinking sources ..."
	@ln -srf ../../kernel/linux-$(mm_KERNEL_VERSION)/work/main.d/linux-$(LINUX_FULL_VERSION) $(WORKSRC)/src/linux-$(LINUX_FULL_VERSION)
	@echo "update kernel ver in PKGBUILD ..."
	@sed -e 's|@@kern_ver@@|$(LINUX_FULL_VERSION)|g' -i $(WORKSRC)/PKGBUILD
	@sed -e 's|@@make@@|$(build_DESTDIR)$(build_bindir)/make|g' -i $(WORKSRC)/PKGBUILD
	@echo "starting packaging with MAKEPKG ..."
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/makepkg --skipinteg
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)/archlinux-pkgs
	@cp -f $(WORKDIR)/linux-aarch64-* $(DESTDIR)/archlinux-pkgs/
	@$(MAKECOOKIE)
