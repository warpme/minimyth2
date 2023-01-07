
GARNAME       = miniarch-rootfs
GARVERSION    = 20230106
CATEGORIES    = miniarch
MASTER_SITES  = http://os.archlinuxarm.org/os/
DISTFILES     = ArchLinuxARM-aarch64-latest.tar.gz
WORKSRC       = $(WORKDIR)

# PACMAN_ARGS  = --upgrade --noconfirm --debug --overwrite \*
PACMAN_ARGS  = --upgrade --noconfirm --overwrite \*
PACMAN_DIRS = \
	--root $(MINIARCH_ROOTFS) \
	--dbpath $(MINIARCH_ROOTFS)/var/lib/pacman/ \

LICENSE = GPL2

BUILDDEPS = \
	miniarch/pacman \
	miniarch/mkinitcpio \

DEPENDS = \
	miniarch/cross-compile-ldd \
	miniarch/miniarch-pkg \
	miniarch/linux-pkg \
	miniarch/linux-firmware-pkg \

BUILD_SCRIPTS   = 
INSTALL_SCRIPTS = custom
CLEAN_SCRIPTS   = custom

include ../../gar.mk
include ../../kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk

extract-$(DISTFILES):
	@echo " " ; \
	 echo "  Unpacking ArchLinuxARM-aarch64-latest requires root privilidges" ; \
	 echo "  Please provide root password..." ; \
	 echo " " ; \
	 su -c " \
	   echo 'unpacking ArchLinuxARM-aarch64-latest ...' ; \
	   rm -rf $(MINIARCH_ROOTFS) ; \
	   mkdir -p $(MINIARCH_ROOTFS) ; \
	   bsdtar -xpf $(DOWNLOADDIR)/$(DISTFILES) -C $(MINIARCH_ROOTFS) ; \
	   echo \"adding some fixups in archlinuxarm image ...\" ; \
	   cp -f $(WORKSRC)/../../files/{base,fsck} \
	     $(MINIARCH_ROOTFS)/usr/lib/initcpio/install/ ; \
	   cp -f $(WORKSRC)/../../files/bluetooth-usb.conf $(MINIARCH_ROOTFS)/usr/lib/modprobe.d/bluetooth-usb.conf ; \
	 "
	@$(MAKECOOKIE)

install-miniarch:
	@echo " " ; \
	 echo "  Installing miniarch-meta requires root privilidges" ; \
	 echo "  Please provide root password..." ; \
	 echo " " ; \
	 su -c " \
	   echo 'installing miniarch-meta ...' ; \
	   $(build_DESTDIR)$(build_bindir)/pacman $(PACMAN_ARGS) $(PACMAN_DIRS) \
	     $(WORKDIR)/../../../miniarch-pkg/work/main.d/miniarch-meta-* ; \
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
	     $(WORKDIR)/../../../linux-pkg/work/main.d/linux-aarch64-[0-9].* \
	     $(WORKDIR)/../../../linux-pkg/work/main.d/linux-aarch64-api-headers* ; \
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
	   cd $(MINIARCH_ROOTFS) ; $(build_DESTDIR)$(build_bindir)/mkinitcpio \
	     --config $(MINIARCH_ROOTFS)/etc/mkinitcpio.conf \
	     --generate $(MINIARCH_ROOTFS)/boot/initramfs-linux.img \
	     --hookdir $(MINIARCH_ROOTFS)/usr/lib/initcpio/ \
	     --moduleroot $(MINIARCH_ROOTFS)/ \
	     --kernel='$(LINUX_FULL_VERSION)' \
	     --sysroot $(MINIARCH_ROOTFS) \
	     --ldd $(build_DESTDIR)$(build_bindir)/$(compiler_prefix)ldd.arch \
	     --compress gzip ; \
	   echo \"moving generated initramfs-linux.img to mm2 boot dir ...\" ; \
	     mv -f $(MINIARCH_ROOTFS)/boot/initramfs-linux.img \
	     $(DESTDIR)/boot/ ; \
	     chmod 0666 $(DESTDIR)/boot/initramfs-linux.img ; \
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
	   cd $(MINIARCH_ROOTFS) ; tar -zpcf ../MiniArch-aarch64-$(GARVERSION).tar.gz * ; \
	 "

install-custom: extract install-miniarch update-kernel update-firmware run-mkinitcpio pack-image
	@echo " " ; \
	 echo "  Installing image requires root privilidges" ; \
	 echo "  Please provide root password..." ; \
	 echo " " ; \
	 su -c " \
	   echo 'installing MiniArch-aarch64-latest.tar.gz in [$(mm_SDCARD_FILES)]' ; \
	   mv -f $(MINIARCH_ROOTFS)/../MiniArch-aarch64-$(GARVERSION).tar.gz $(mm_SDCARD_FILES)/ ; \
	   echo \"$(GARVERSION)-$(LINUX_FULL_VERSION)\" > $(MINIARCH_ROOTFS)/version ; \
	 "
	@$(MAKECOOKIE)

clean-custom: cookieclean clean-all

clean-all: cookieclean
	@echo " " ; \
	 echo "  Cleaning MiniArch-aarch64-$(GARVERSION) build requires root privilidges" ; \
	 echo "  Please provide root password..." ; \
	 echo " " ; \
	 su -c " \
	   echo 'cleaning MiniArch-aarch64-$(GARVERSION) ...' ; \
	   rm -rf $(MINIARCH_ROOTFS) ; \
	   rm -ff $(DESTDIR)/MiniArch-aarch64-$(GARVERSION).tar.gz ; \
	   rm -f $(DESTDIR)/boot/initramfs-linux.img ; \
	 "

#@fakeroot -i $<.fakeroot sh -c "tar -C $(<D) -jcf $@~ $(<F)"