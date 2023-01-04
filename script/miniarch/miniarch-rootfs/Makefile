
GARNAME       = miniarch-rootfs
GARVERSION    = 20230103
CATEGORIES    = miniarch
MASTER_SITES  = http://os.archlinuxarm.org/os/
DISTFILES     = ArchLinuxARM-aarch64-latest.tar.gz
WORKSRC       = $(WORKDIR)

# PACMAN_ARGS  = --upgrade --noconfirm --debug --overwrite \*
PACMAN_ARGS  = --upgrade --noconfirm --overwrite \*
PACMAN_DIRS = \
	--root $(DESTDIR)/miniarch-rootfs \
	--dbpath $(DESTDIR)/miniarch-rootfs/var/lib/pacman/ \


LICENSE = GPL2

BUILDDEPS = \
	miniarch/pacman \
	miniarch/mkinitcpio \

DEPENDS = \
	miniarch/cross-compile-ldd \
	miniarch/linux-pkg \
	miniarch/linux-firmware-pkg \

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
	   rm -rf $(DESTDIR)/miniarch-rootfs ; \
	   mkdir -p $(DESTDIR)/miniarch-rootfs ; \
	   bsdtar -xpf $(DOWNLOADDIR)/$(DISTFILES) -C $(DESTDIR)/miniarch-rootfs ; \
	   echo \"removing some uneeded/unused files from archlinuxarm image ...\" ; \
	   rm -rf $(DESTDIR)/miniarch-rootfs/boot/initramfs-linux-fallback.img ; \
	   echo \"adding some fixups in archlinuxarm image ...\" ; \
	   cp -f $(WORKSRC)/../../files/{base,fsck} \
	     $(DESTDIR)/miniarch-rootfs/usr/lib/initcpio/install/ ; \
	   cp -f $(WORKSRC)/../../files/bluetooth-usb.conf $(DESTDIR)/miniarch-rootfs/usr/lib/modprobe.d/bluetooth-usb.conf ; \
	   echo \"adding MiniArch artefacts to /etc ...\" ; \
	   cp -f $(WORKSRC)/../../files/{pacman.conf,pacman-miniarch.conf,fstab,hostname} \
	     $(DESTDIR)/miniarch-rootfs/etc/ ; \
	   echo \"adding MiniArch artefacts to /local/bin ...\" ; \
	   cp -f $(WORKSRC)/../../files/{start,resize-rootfs} \
	     $(DESTDIR)/miniarch-rootfs/usr/local/bin/ ; \
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
	   cd $(DESTDIR)/miniarch-rootfs ; $(build_DESTDIR)$(build_bindir)/mkinitcpio \
	     --config $(DESTDIR)/miniarch-rootfs/etc/mkinitcpio.conf \
	     --generate $(DESTDIR)/miniarch-rootfs/boot/initramfs-linux.img \
	     --hookdir $(DESTDIR)/miniarch-rootfs/usr/lib/initcpio/ \
	     --moduleroot $(DESTDIR)/miniarch-rootfs/ \
	     --kernel='$(LINUX_FULL_VERSION)' \
	     --sysroot $(DESTDIR)/miniarch-rootfs \
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
	   cd $(DESTDIR)/miniarch-rootfs ; tar -zpcf ../MiniArch-aarch64-$(GARVERSION).tar.gz * ; \
	 "

install-custom: extract update-kernel update-firmware run-mkinitcpio pack-image
	@echo " " ; \
	 echo "  Installing image requires root privilidges" ; \
	 echo "  Please provide root password..." ; \
	 echo " " ; \
	 su -c " \
	   echo 'installing MiniArch-aarch64-latest.tar.gz in [$(mm_SDCARD_FILES)]' ; \
	   mv -f $(DESTDIR)/MiniArch-aarch64-$(GARVERSION).tar.gz $(mm_SDCARD_FILES)/ ; \
	 "
	@$(MAKECOOKIE)

clean-all: clean
	@echo " " ; \
	 echo "  Cleaning MiniArch-aarch64-$(GARVERSION) build requires root privilidges" ; \
	 echo "  Please provide root password..." ; \
	 echo " " ; \
	 su -c " \
	   echo 'cleaning MiniArch-aarch64-$(GARVERSION) ...' ; \
	   rm -rf $(DESTDIR)/miniarch-rootfs ; \
	   rm -ff $(DESTDIR)/MiniArch-aarch64-$(GARVERSION).tar.gz ; \
	 "


#@fakeroot -i $<.fakeroot sh -c "tar -C $(<D) -jcf $@~ $(<F)"