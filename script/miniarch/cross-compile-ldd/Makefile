
GARNAME      = cross-compile-ldd
GARVERSION   = 6c9c724ebd6a29c279c6e5734e44c07f067808ec
CATEGORIES   = archlinux
MASTER_SITES = https://gist.githubusercontent.com/jerome-pouiller/c403786c1394f53f44a3b61214489e6f/raw/6c9c724ebd6a29c279c6e5734e44c07f067808ec/
DISTFILES    = cross-compile-ldd
WORKSRC      = $(WORKDIR)
LICENSE      = GPL2

DEPENDS = 

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = 
INSTALL_SCRIPTS   = custom

include ../../gar.mk

install-custom:
	@sed -e "s|^ld_library_path=\"/lib:/usr/lib\"|ld_library_path=\"/lib64:/lib:/usr/lib64:/usr/lib\"|g" -i $(WORKSRC)/cross-compile-ldd
	@sed -e "s|^bits=\"32\"|bits=\"64\"|g" -i $(WORKSRC)/cross-compile-ldd

	@cp -v $(WORKSRC)/cross-compile-ldd $(build_rootdir)$(bindir)/$(compiler_prefix)ldd
	@chmod +x $(build_rootdir)$(bindir)/$(compiler_prefix)ldd

test-ldd-miniarch:
	@echo " "
	@echo "running of $(build_rootdir)$(bindir)/$(compiler_prefix)ldd for $(MINIARCH_ROOTFS)/bin/bash"
	@echo " "
	@$(build_rootdir)$(bindir)/$(compiler_prefix)ldd --root=$(MINIARCH_ROOTFS) $(MINIARCH_ROOTFS)/bin/bash
	@echo " "
	@echo "running of $(build_rootdir)$(bindir)/$(compiler_prefix)ldd for $(MINIARCH_ROOTFS)/usr/bin/udevadm"
	@echo " "
	@$(build_rootdir)$(bindir)/$(compiler_prefix)ldd --root=$(MINIARCH_ROOTFS) $(MINIARCH_ROOTFS)/usr/bin/udevadm
	@echo " "

test-ldd-minimyth2: 
	@echo " "
	@echo "running of $(build_rootdir)$(bindir)/$(compiler_prefix)ldd for $(main_DESTDIR)/bin/bash"
	@echo " "
	@$(build_rootdir)$(bindir)/$(compiler_prefix)ldd $(main_DESTDIR)/bin/bash
	@echo " "
	@echo "running of $(build_rootdir)$(bindir)/$(compiler_prefix)ldd for $(main_DESTDIR)/usr/bin/udevadm"
	@echo " "
	@$(build_rootdir)$(bindir)/$(compiler_prefix)ldd $(main_DESTDIR)/usr/bin/udevadm
	@echo " "
