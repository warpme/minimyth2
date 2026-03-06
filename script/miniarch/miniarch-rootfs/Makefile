
GARNAME       = miniarch-rootfs
GARVERSION    = 15.0.1-19.01.2026
CATEGORIES    = miniarch
MASTER_SITES  = http://os.archlinuxarm.org/os/
DISTFILES     = ArchLinuxARM-aarch64-latest.tar.gz
WORKSRC       = $(WORKDIR)

#PACMAN_ARGS  = --upgrade --noconfirm --debug --overwrite \*
PACMAN_ARGS  = --upgrade --noconfirm --overwrite \*
PACMAN_DIRS = \
	--root $(MINIARCH_ROOTFS) \
	--config $(WORKSRC)/../../files/pacman.conf \
	--dbpath $(MINIARCH_ROOTFS)/var/lib/pacman/ \
	--cachedir $(MINIARCH_ROOTFS)/var/cache/pacman/pkg/ \

MINIARCH_VERSION=$(GARVERSION)-$(LINUX_FULL_VERSION)

LICENSE = GPL2

BUILDDEPS = \
	miniarch/pacman \
	miniarch/mkinitcpio \
	lib/libarchive \
	devel/fakeroot \

DEPENDS = \
	miniarch/miniarch-pkg \
	miniarch/linux-pkg \
	miniarch/linux-firmware-pkg \

BUILD_SCRIPTS   = custom
CLEAN_SCRIPTS   = custom

include ../../gar.mk
include ../../kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk

extract-$(DISTFILES):
	@echo " " ; \
	  echo 'unpacking ArchLinuxARM-aarch64-latest ...' ; \
	  rm -rf $(MINIARCH_ROOTFS) ; \
	  mkdir -p $(MINIARCH_ROOTFS) ; \
	  fakeroot bsdtar -xpf $(DOWNLOADDIR)/$(DISTFILES) -C $(MINIARCH_ROOTFS) ; \
	  echo 'runing fixup_rootfs_content.sh to fixup/customize archlinuxarm image in [$(MINIARCH_ROOTFS)] to make miniarch image ...' ; \
	  $(WORKSRC)/../../files/fixup_rootfs_content.sh $(mm_HOME) $(MINIARCH_ROOTFS)
	@$(MAKECOOKIE)

install-miniarch:
	@echo " " ; \
	  echo 'installing miniarch-meta ...' ; \
	  fakeroot $(build_DESTDIR)$(build_bindir)/pacman $(PACMAN_ARGS) $(PACMAN_DIRS) \
	    $(WORKDIR)/../../../miniarch-pkg/work/main.d/miniarch-meta-*
	@$(MAKECOOKIE)

update-kernel: extract update-firmware
	@echo " " ; \
	  echo 'updating kernel ...' ; \
	  fakeroot $(build_DESTDIR)$(build_bindir)/pacman $(PACMAN_ARGS) $(PACMAN_DIRS) \
	    $(WORKDIR)/../../../linux-pkg/work/main.d/linux-aarch64-[0-9].* \
	    $(WORKDIR)/../../../linux-pkg/work/main.d/linux-aarch64-api-headers* ; \
	  echo \"$(MINIARCH_VERSION)\" > $(MINIARCH_ROOTFS)/version
	@$(MAKECOOKIE)

list-packages: extract
	-@echo "listing currently installed packages in miniarch rootfs ..." ; \
	 fakeroot $(build_DESTDIR)$(build_bindir)/pacman --noconfirm $(PACMAN_DIRS) -Qs ; \

remove-packages: extract
	-@echo "removing packages listed in pkg-to-remove.lst ..." ; \
	 pkgs=`cat $(WORKSRC)/../../files/pkg-to-remove.lst | sed -e "/^#/d" -e "/^$$/d"` ; \
	 echo "pkg list to remove: $${pkgs}" ; \
	 for pkg in $${pkgs} ; do \
		echo "removing: $${pkg}" ; \
		fakeroot $(build_DESTDIR)$(build_bindir)/pacman --noconfirm $(PACMAN_DIRS) -Rdd $${pkg} ; \
	 done ;
	@$(MAKECOOKIE)

install-packages: extract
	-@echo "adding packages listed in pkg-to-install.lst ..." ; \
	 pkgs=`cat $(WORKSRC)/../../files/pkg-to-install.lst | sed -e "/^#/d" -e "/^$$/d"` ; \
	 if [ ! $${pkgs} = "" ] ; then \
	   echo "updating system ..." ; \
	   fakeroot $(build_DESTDIR)$(build_bindir)/pacman --noconfirm $(PACMAN_DIRS) -Syu ; \
	   echo "pkg list to install: $${pkgs}" ; \
	   for pkg in $${pkgs} ; do \
		echo "installing: $${pkg}" ; \
		fakeroot $(build_DESTDIR)$(build_bindir)/pacman --noconfirm $(PACMAN_DIRS) -S $${pkg} ; \
	   done ; \
	 else \
	   echo "Nothing to install ..." ; \
	 fi
	@$(MAKECOOKIE)

update-firmware: extract
	@echo 'updating firmware ...' ; \
	  fakeroot $(build_DESTDIR)$(build_bindir)/pacman $(PACMAN_ARGS) $(PACMAN_DIRS) \
	    $(WORKDIR)/../../../linux-firmware-pkg/work/main.d/linux-firmware-*
	@$(MAKECOOKIE)

run-mkinitcpio: update-kernel
	@echo " " ; \
	  echo "running mkinitcpio after kernel update ..." ; \
	  fakeroot cd $(MINIARCH_ROOTFS) ; $(build_DESTDIR)$(build_bindir)/mkinitcpio \
	    --config $(WORKSRC)/../../files/mkinitcpio.conf \
	    --generate $(MINIARCH_ROOTFS)/boot/initramfs-linux.img \
	    --hookdir $(WORKSRC)/../../files \
	    --moduleroot $(MINIARCH_ROOTFS)/ \
	    --kernel='$(LINUX_FULL_VERSION)' \
	    --sysroot $(MINIARCH_ROOTFS) \
	    --ldd $(build_DESTDIR)$(build_bindir)/$(compiler_prefix)ldd \
	    --compress gzip ; \
	  echo "moving generated initramfs-linux.img to mm2 boot dir ..." ; \
	  mv -f $(MINIARCH_ROOTFS)/boot/initramfs-linux.img \
	    $(DESTDIR)/boot/ ; \
	  chmod 0666 $(DESTDIR)/boot/initramfs-linux.img
	@$(MAKECOOKIE)
# add if you want debug mkinitpcio add after --ldd $(build_DESTDIR)$(build_bindir)/$(compiler_prefix)ldd
#	     --verbose \
#	     --save \
#	    --hookdir $(WORKSRC)/../../files \

pack-rootfs:
	@echo " " ; \
	  echo 'packing to MiniArch-aarch64-latest ...' ; \
	  fakeroot -i $(MINIARCH_ROOTFS).fakeroot sh -c " \
	    cd $(MINIARCH_ROOTFS) ; tar -zpcf ../MiniArch-aarch64-$(MINIARCH_VERSION).tar.gz * "
	@$(MAKECOOKIE)

$(MINIARCH_ROOTFS): extract

$(MINIARCH_ROOTFS).fakeroot: $(MINIARCH_ROOTFS)
	@echo " " ; \
	  echo 'generating miniarch-rootfs.fakeroot for $@ ...'
	@fakeroot -s $@~ sh -c                          " \
		chmod    u+s       $</bin/chage         ; \
		chmod    u+s       $</bin/chfn          ; \
		chmod    u+s       $</bin/chsh          ; \
		chmod    u+s       $</bin/expiry        ; \
		chmod    u+s       $</bin/gpasswd       ; \
		chmod    u+s       $</bin/ksu           ; \
		chmod    u+s       $</bin/mount         ; \
		chmod    u+s       $</bin/newgrp        ; \
		chmod    u+s       $</bin/passwd        ; \
		chmod    u+s       $</bin/sg            ; \
		chmod    u+s       $</bin/su            ; \
		chmod    u+s       $</bin/systemctl     ; \
		chmod    u+s       $</bin/umount        ; \
		chmod    u+s       $</bin/unix_chkpwd   ; \
		chmod    u+r       $</etc/credstore     ; \
		chmod    u+r       $</etc/credstore.encrypted ; \
		chown -R 1000:1000 $</home/alarm*       ; \
		rm -rf             $</dev               ; \
		mkdir -m 0755 -p   $</dev               ; \
		mknod -m 0600      $</dev/console c 5 1 ; \
		mknod -m 0600      $</dev/initctl p     ; \
		mknod -m 0666      $</dev/null    c 1 3 "
		@touch $@~
		@mv $@~ $@
	@$(MAKECOOKIE)

gen-fakeroot: $(MINIARCH_ROOTFS).fakeroot

build-custom: $(MINIARCH_ROOTFS) remove-packages install-packages update-kernel update-firmware run-mkinitcpio install-miniarch gen-fakeroot
	@echo 'building MiniArch-aarch64-$(MINIARCH_VERSION) ...'
	@$(MAKECOOKIE)

install-rootfs: pack-rootfs
	@echo " " ; \
	  echo 'installing MiniArch-aarch64-$(MINIARCH_VERSION).tar.gz in [$(mm_SDCARD_FILES)]' ; \
	  mv -f $(MINIARCH_ROOTFS)/../MiniArch-aarch64-$(MINIARCH_VERSION).tar.gz $(mm_SDCARD_FILES)/
	@$(MAKECOOKIE)

clean-custom: cookieclean downloadclean clean-all

clean-all: cookieclean
	@echo " " ; \
	  echo 'cleaning MiniArch-aarch64-$(MINIARCH_VERSION) ...' ; \
	  chmod -R 0777 $(MINIARCH_ROOTFS)/etc/ca-certificates/extracted/cadir 2>/dev/null ; \
	  rm -f "$(MINIARCH_ROOTFS)/../miniarch-rootfs.fakeroot" ; \
	  rm -rf $(MINIARCH_ROOTFS) ; \
	  rm -ff $(DESTDIR)/MiniArch-aarch64-$(MINIARCH_VERSION).tar.gz ; \
	  rm -f $(DESTDIR)/boot/initramfs-linux.img ; \
	  echo " "
