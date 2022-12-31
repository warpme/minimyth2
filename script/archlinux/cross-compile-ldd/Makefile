
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
	@sed -e "s|^gcc=.*|gcc=\"$(build_rootdir)$(bindir)/$(compiler_prefix)gcc\"|g" -i $(WORKSRC)/cross-compile-ldd
	@sed -e "s|^readelf=.*|readelf=\"$(build_rootdir)$(bindir)/$(compiler_prefix)readelf\"|g" -i $(WORKSRC)/cross-compile-ldd
	@sed -e "s|^ld_library_path=\"/lib:/usr/lib\"|ld_library_path=\"/lib64:/lib:/usr/lib64:/usr/lib\"|g" -i $(WORKSRC)/cross-compile-ldd
	@sed -e "s|^bits=\"32\"|bits=\"64\"|g" -i $(WORKSRC)/cross-compile-ldd

	@sed -e "s|^sysroot=.*|sysroot=\"$(main_DESTDIR)\"|g" -i $(WORKSRC)/cross-compile-ldd
	@cp -v $(WORKSRC)/cross-compile-ldd $(build_rootdir)$(bindir)/$(compiler_prefix)ldd
	@chmod +x $(build_rootdir)$(bindir)/$(compiler_prefix)ldd

	@sed -e "s|^sysroot=.*|sysroot=\"$(main_DESTDIR)/archlinuxarm-rootfs\"|g" -i $(WORKSRC)/cross-compile-ldd
	@cp -v $(WORKSRC)/cross-compile-ldd $(build_rootdir)$(bindir)/$(compiler_prefix)ldd.arch
	@chmod +x $(build_rootdir)$(bindir)/$(compiler_prefix)ldd.arch
