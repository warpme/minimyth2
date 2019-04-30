GARNAME = kickstart-oe
GARVERSION = 2.6
CATEGORIES = utils
MASTER_SITES = http://git.yoctoproject.org/cgit/cgit.cgi/poky/snapshot/
DISTFILES = \
	poky-yocto-$(GARVERSION).tar.bz2 \
	board-rpi2.conf   \
	board-rpi3.conf   \
	board-s905.conf   \
	board-s912.conf   \
	board-rk3328.conf \
	board-rk3399.conf \
	board-h6.conf     \
	board-rpi2.wks    \
	board-rpi3.wks    \
	board-s905.wks    \
	board-s912.wks    \
	board-rk3328.wks  \
	board-rk3399.wks  \
	board-h6.wks      \
	default.wks       \
	create-image.sh   \

WORKSRC = $(WORKDIR)/poky-yocto-$(GARVERSION)
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	utils/diffstat \
	disk/dosfstools \
	disk/mtools \
	disk/e2fsprogs \
	utils/pseudo \
	lib/parted \

# Removed from dependencies as kickstart-oe not works OK with mm2 python3.
# This needs further investigation...
#	python3/python \
#	python3/python-codegen \
#	python3/python-ply \
#	python3/python-beautifulsoup4 \
#	python3/python-simplediff \


CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = 
INSTALL_SCRIPTS   = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)/kickstart/bitbake
	@mkdir -p $(DESTDIR)$(bindir)/kickstart/native-bins/usr/bin
	@mkdir -p $(DESTDIR)$(bindir)/kickstart/cache
	@mkdir -p $(DESTDIR)$(bindir)/kickstart/classes
	@mkdir -p $(DESTDIR)$(bindir)/kickstart/conf
	@mkdir -p $(DESTDIR)$(bindir)/kickstart/conf/multiconfig
	@mkdir -p $(DESTDIR)$(bindir)/kickstart/scripts
	@mkdir -p $(DESTDIR)$(bindir)/kickstart/tmp
	@mkdir -p $(DESTDIR)$(bindir)/kickstart/tmp/sysroots-components/x86_64/pseudo-native/usr/bin
	@#
	@cp -rf $(WORKSRC)/bitbake/bin $(DESTDIR)$(bindir)/kickstart/bitbake/
	@cp -rf $(WORKSRC)/bitbake/lib $(DESTDIR)$(bindir)/kickstart/bitbake/
	@cp -rf $(WORKSRC)/meta/lib/oe $(DESTDIR)$(bindir)/kickstart/bitbake/lib/
	@#
	@ln -srf $(DESTDIR)$(bindir)/find       $(DESTDIR)$(bindir)/kickstart/native-bins/usr/bin/find
	@ln -srf $(DESTDIR)$(sbindir)/fsck.ext3 $(DESTDIR)$(bindir)/kickstart/native-bins/usr/bin/fsck.ext3
	@ln -srf $(DESTDIR)$(sbindir)/fsck.ext4 $(DESTDIR)$(bindir)/kickstart/native-bins/usr/bin/fsck.ext4
	@ln -srf $(DESTDIR)$(bindir)/mcopy      $(DESTDIR)$(bindir)/kickstart/native-bins/usr/bin/mcopy
	@ln -srf $(DESTDIR)$(sbindir)/mkdosfs   $(DESTDIR)$(bindir)/kickstart/native-bins/usr/bin/mkdosfs
	@ln -srf $(DESTDIR)$(sbindir)/mkfs.ext3 $(DESTDIR)$(bindir)/kickstart/native-bins/usr/bin/mkfs.ext3
	@ln -srf $(DESTDIR)$(sbindir)/mkfs.ext4 $(DESTDIR)$(bindir)/kickstart/native-bins/usr/bin/mkfs.ext4
	@ln -srf $(DESTDIR)$(sbindir)/parted    $(DESTDIR)$(bindir)/kickstart/native-bins/usr/bin/parted
	@ln -srf $(DESTDIR)$(bindir)/pseudo     $(DESTDIR)$(bindir)/kickstart/native-bins/usr/bin/pseudo
	@ln -srf $(DESTDIR)$(bindir)/pseudodb   $(DESTDIR)$(bindir)/kickstart/native-bins/usr/bin/pseudodb
	@ln -srf $(DESTDIR)$(bindir)/pseudolog  $(DESTDIR)$(bindir)/kickstart/native-bins/usr/bin/pseudolog
	@#
	@cp -f $(WORKSRC)/meta/classes/base.bbclass          $(DESTDIR)$(bindir)/kickstart/classes/
	@cp -f $(WORKSRC)/meta/classes/logging.bbclass       $(DESTDIR)$(bindir)/kickstart/classes/
	@cp -f $(WORKSRC)/meta/classes/metadata_scm.bbclass  $(DESTDIR)$(bindir)/kickstart/classes/
	@cp -f $(WORKSRC)/meta/classes/mirrors.bbclass       $(DESTDIR)$(bindir)/kickstart/classes/
	@cp -f $(WORKSRC)/meta/classes/patch.bbclass         $(DESTDIR)$(bindir)/kickstart/classes/
	@cp -f $(WORKSRC)/meta/classes/sanity.bbclass        $(DESTDIR)$(bindir)/kickstart/classes/
	@cp -f $(WORKSRC)/meta/classes/staging.bbclass       $(DESTDIR)$(bindir)/kickstart/classes/
	@cp -f $(WORKSRC)/meta/classes/terminal.bbclass      $(DESTDIR)$(bindir)/kickstart/classes/
	@cp -f $(WORKSRC)/meta/classes/utility-tasks.bbclass $(DESTDIR)$(bindir)/kickstart/classes/
	@cp -f $(WORKSRC)/meta/classes/utils.bbclass         $(DESTDIR)$(bindir)/kickstart/classes/
	@#
	@cp -f $(WORKSRC)/meta/conf/abi_version.conf         $(DESTDIR)$(bindir)/kickstart/conf/
	@cp -f $(WORKSRC)/meta/conf/bitbake.conf             $(DESTDIR)$(bindir)/kickstart/conf/
	@cp -f $(WORKSRC)/meta/conf/sanity.conf              $(DESTDIR)$(bindir)/kickstart/conf/
	@cp -f $(WORKSRC)/meta/conf/multiconfig/default.conf $(DESTDIR)$(bindir)/kickstart/conf/multiconfig/
	@#
	@cp -rf $(WORKSRC)/scripts/lib/     $(DESTDIR)$(bindir)/kickstart/scripts/lib/
	@cp -f  $(WORKSRC)/scripts/wic      $(DESTDIR)$(bindir)/kickstart/scripts/wic
	@cp -f  $(DESTDIR)$(bindir)/pseudo  $(DESTDIR)$(bindir)/kickstart/tmp/sysroots-components/x86_64/pseudo-native/usr/bin/pseudo
	@#
	@cp -f $(WORKDIR)/create-image.sh   $(DESTDIR)$(bindir)/kickstart/
	@#
	@cp -f $(WORKDIR)/board-*.conf      $(DESTDIR)$(bindir)/kickstart/conf/multiconfig/
	@cp -f $(WORKDIR)/board-*.wks       $(DESTDIR)$(bindir)/kickstart/
	@cp -f $(WORKDIR)/default.wks       $(DESTDIR)$(bindir)/kickstart/default.wks
	@#
	@# Remove all host tools requirements as we are listing them in BUILDEPS
	@sed -i -e "s/HOSTTOOLS +=/__HOSTTOOLS +=/g" $(DESTDIR)$(bindir)/kickstart/conf/bitbake.conf
	@echo 'HOSTTOOLS += " "' >> $(DESTDIR)$(bindir)/kickstart/conf/bitbake.conf
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(bindir)/kickstart*
	@$(MAKECOOKIE)
