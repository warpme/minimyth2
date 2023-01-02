
GARNAME       = archlinuxarm-rootfs
GARVERSION    = 20221227
CATEGORIES    = archlinux
MASTER_SITES  = http://os.archlinuxarm.org/os/
DISTFILES     = ArchLinuxARM-aarch64-latest.tar.gz
WORKSRC       = $(WORKDIR)

# PACMAN_ARGS  = --upgrade --noconfirm --debug --overwrite \*
PACMAN_ARGS  = --upgrade --noconfirm --overwrite \*
PACMAN_DIRS = \
	--root $(DESTDIR)/archlinuxarm-rootfs \
	--dbpath $(DESTDIR)/archlinuxarm-rootfs/var/lib/pacman/ \


LICENSE = GPL2

BUILDDEPS = \
	archlinux/pacman \
	archlinux/mkinitcpio \

DEPENDS = \
	archlinux/cross-compile-ldd \
	archlinux/linux-pkg \
	archlinux/linux-firmware-pkg \

BUILD_SCRIPTS   = 
INSTALL_SCRIPTS = custom

include ../../gar.mk
include ../../kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk

extract-$(DISTFILES):
	@echo " " ; \
	 echo "  Unpacking ArchLinuxARM-aarch64-latest requires root privilidges" ; \
	 echo "  Please provide root password..." ; \
	 echo " " ; \
	 su -c " \
	   echo 'unpacking ArchLinuxARM-aarch64-latest ...' ; \
	   rm -rf $(DESTDIR)/archlinuxarm-rootfs ; \
	   mkdir -p $(DESTDIR)/archlinuxarm-rootfs ; \
	   bsdtar -xpf $(DOWNLOADDIR)/$(DISTFILES) -C $(DESTDIR)/archlinuxarm-rootfs ; \
	   cp -fv $(WORKSRC)/../../files/base               $(DESTDIR)/archlinuxarm-rootfs/usr/lib/initcpio/install/ ; \
	   cp -fv $(WORKSRC)/../../files/fsck               $(DESTDIR)/archlinuxarm-rootfs/usr/lib/initcpio/install/ ; \
	   cp -fv $(WORKSRC)/../../files/bluetooth-usb.conf $(DESTDIR)/archlinuxarm-rootfs/usr/lib/modprobe.d/bluetooth-usb.conf ; \
	   cp -fv $(WORKSRC)/../../files/pacman.conf        $(DESTDIR)/archlinuxarm-rootfs/etc/pacman.conf ; \
	 "
	@$(MAKECOOKIE)

update-kernel:
	@echo " " ; \
	 echo "  Updatng kernel requires root privilidges" ; \
	 echo "  Please provide root password..." ; \
	 echo " " ; \
	 su -c " \
	   echo 'updating kernel ...' ; \
	   $(build_DESTDIR)$(build_bindir)/pacman $(PACMAN_ARGS) $(PACMAN_DIRS) \
	     $(WORKDIR)/../../../linux-pkg/work/main.d/linux-aarch64-* ; \
	 "
	@$(MAKECOOKIE)

update-firmware:
	@echo " " ; \
	 echo "  Updatng firmware requires root privilidges" ; \
	 echo "  Please provide root password..." ; \
	 echo " " ; \
	 su -c " \
	   echo 'updating firmware ...' ; \
	   $(build_DESTDIR)$(build_bindir)/pacman $(PACMAN_ARGS) $(PACMAN_DIRS) \
	     $(WORKDIR)/../../../linux-firmware-pkg/work/main.d/linux-firmware-* ; \
	 "
	@$(MAKECOOKIE)

run-mkinitcpio:
	@echo " " ; \
	 echo "  Running mkinitcpio requires root privilidges" ; \
	 echo "  Please provide root password..." ; \
	 echo " " ; \
	 su -c " \
	   echo 'running mkinitcpio after kernel update ...' ; \
	   cd $(DESTDIR)/archlinuxarm-rootfs ; $(build_DESTDIR)$(build_bindir)/mkinitcpio \
	     --config $(DESTDIR)/archlinuxarm-rootfs/etc/mkinitcpio.conf \
	     --generate $(DESTDIR)/archlinuxarm-rootfs/boot/initramfs-linux.img \
	     --hookdir $(DESTDIR)/archlinuxarm-rootfs/usr/lib/initcpio/ \
	     --moduleroot $(DESTDIR)/archlinuxarm-rootfs/ \
	     --kernel='$(LINUX_FULL_VERSION)' \
	     --sysroot $(DESTDIR)/archlinuxarm-rootfs \
	     --ldd $(build_DESTDIR)$(build_bindir)/$(compiler_prefix)ldd.arch \
	     --compress gzip \
	 "
	@$(MAKECOOKIE)
# add if you want debug mkinitpcio
#	     --verbose \
#	     --save \

pack-image:
	@echo " " ; \
	 echo "  Packing image requires root privilidges" ; \
	 echo "  Please provide root password..." ; \
	 echo " " ; \
	 su -c " \
	   echo 'packing to MiniArch-aarch64-latest ...' ; \
	   cd $(DESTDIR)/archlinuxarm-rootfs ; tar -zpcf MiniArch-aarch64-$(GARVERSION).tar.gz * ; \
	 "
	@#$(MAKECOOKIE)

install-custom: extract update-kernel update-firmware run-mkinitcpio pack-image
	@echo "installing MiniArch-aarch64-latest.tar.gz in [$(mm_SDCARD_FILES)]"
	cp -f $(DESTDIR)/archlinuxarm-rootfs/MiniArch-aarch64-$(GARVERSION).tar.gz $(mm_SDCARD_FILES)/
	@$(MAKECOOKIE)

clean-all: clean
	@echo " " ; \
	 echo "  Cleaning MiniArch-aarch64-$(GARVERSION) build requires root privilidges" ; \
	 echo "  Please provide root password..." ; \
	 echo " " ; \
	 su -c " \
	   echo 'cleaning MiniArch-aarch64-$(GARVERSION) ...' ; \
	   rm -rf $(DESTDIR)/archlinuxarm-rootfs ; \
	 "


#@fakeroot -i $<.fakeroot sh -c "tar -C $(<D) -jcf $@~ $(<F)"