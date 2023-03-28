
GARNAME      = kickstart-oe
GARVERSION   = 2.7.3
CATEGORIES   = utils
MASTER_SITES = http://git.yoctoproject.org/cgit/cgit.cgi/poky/snapshot/
DISTFILES    = \
	poky-yocto-$(GARVERSION).tar.bz2 \
	board-rpi2.conf             \
	board-rpi2.wks              \
	board-rpi3.mainline32.conf  \
	board-rpi3.mainline32.wks   \
	board-rpi3.mainline64.conf  \
	board-rpi3.mainline64.wks   \
	board-rpi3.rpi32.conf       \
	board-rpi3.rpi32.wks        \
	board-rpi4.mainline64.conf  \
	board-rpi4.mainline64.wks   \
	board-rpi34.mainline64.conf \
	board-rpi34.mainline64.wks  \
	board-rpi4.rpi32.conf       \
	board-rpi4.rpi32.wks        \
	board-rpi4.rpi64.conf       \
	board-rpi4.rpi64.wks        \
	board-s905.conf             \
	board-s905.wks              \
	board-s912.conf             \
	board-s912.wks              \
	board-sm1.x96_air2g.conf    \
	board-sm1.x96_air2g.wks     \
	board-sm1.tanix_tx5_plus.conf \
	board-sm1.tanix_tx5_plus.wks \
	board-g12.radxa_zero.conf    \
	board-g12.radxa_zero.wks     \
	board-rk3328.beelink_a1.conf \
	board-rk3328.beelink_a1.wks  \
	board-rk3399.rockpi4-b.conf  \
	board-rk3399.rockpi4-b.wks   \
	board-rk3399.rockpi4-se.conf \
	board-rk3399.rockpi4-se.wks  \
	board-rk3399.orangepi_4.conf \
	board-rk3399.orangepi_4.wks  \
	board-rk3566.x96_x6.conf     \
	board-rk3566.x96_x6.wks      \
	board-rk3566.urve-pi.conf    \
	board-rk3566.urve-pi.wks     \
	board-rk3566.quartz64-b.conf \
	board-rk3566.quartz64-b.wks \
	board-rk3568.rock3-a.conf   \
	board-rk3568.rock3-a.wks    \
	board-rk3568.rock3-b.conf   \
	board-rk3568.rock3-b.wks    \
	board-rk3566.rock3-c.conf   \
	board-rk3566.rock3-c.wks    \
	board-rk3588.rock5-b.conf   \
	board-rk3588.rock5-b.wks    \
	board-rk3588s.rock5-a.conf  \
	board-rk3588s.rock5-a.wks   \
	board-h6.beelink_gs1.conf   \
	board-h6.beelink_gs1.wks    \
	board-h6.eachlink_mini.conf \
	board-h6.eachlink_mini.wks  \
	board-h6.tanix_tx6.conf     \
	board-h6.tanix_tx6.wks      \
	board-h6.tanix_tx6_mini.conf \
	board-h6.tanix_tx6_mini.wks  \
	board-h6.orangepi_3.conf    \
	board-h6.orangepi_3.wks     \
	board-h616.orangepi_zero2.conf \
	board-h616.orangepi_zero2.wks  \
	board-h616.tanix_tx6s.conf  \
	board-h616.tanix_tx6s.wks   \
	board-h616.tanix_tx6s_lpddr3.conf \
	board-h616.tanix_tx6s_lpddr3.wks  \
	board-h616.t95.conf         \
	board-h616.t95.wks          \
	board-h616.x96_mate.conf    \
	board-h616.x96_mate.wks     \
	board-h313.x96_q.conf       \
	board-h313.x96_q.wks        \
	board-x86pc.bios.conf       \
	board-x86pc.bios.wks        \
	board-x86pc.efi64.conf      \
	board-x86pc.efi64.wks       \
	board-x86pc.bios_efi64.conf \
	board-x86pc.bios_efi64.wks  \
	default-mbr.wks             \
	default-gpt.wks             \
	create-image.sh             \

PATCHFILES  = poky-yocto-2.7.3-bitbake-skip-python2-checks.patch
PATCHFILES += poky-yocto-2.7.3-add-biosplusefi-image-plugin.patch
PATCHFILES += poky-yocto-2.7.3-add-copy-mm2-files-into-image-boot-part.patch
PATCHFILES += poky-yocto-2.7.3-make-PARTUUID-as-constant-0x346d1a6a.patch
PATCHFILES += backport-001-wic-Add--offset-argument-for-partitions.patch
PATCHFILES += backport-002-wic-Fix--extra-space-argument-handling.patch
PATCHFILES += backport-003-wic-Fix-error-message-when-reporting-invalid-offset.patch
PATCHFILES += backport-004-wic-Add-512-Byte-alignment-to--offset.patch
PATCHFILES += poky-yocto-2.7.3-allow-arbitral-part-start-sector.patch

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
	disk/gptfdisk \
	utils/pseudo \
	disk/parted \
	bootloaders/syslinux \
	bootloaders/grub2 \
	python3/python \
	python3/python-codegen \
	python3/python-ply \
	python3/python-beautifulsoup4 \
	python3/python-simplediff \

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = 
INSTALL_SCRIPTS   = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(bindir)/kickstart/bitbake
	@mkdir -p $(DESTDIR)$(bindir)/kickstart/cache
	@mkdir -p $(DESTDIR)$(bindir)/kickstart/classes
	@mkdir -p $(DESTDIR)$(bindir)/kickstart/conf
	@mkdir -p $(DESTDIR)$(bindir)/kickstart/conf/multiconfig
	@mkdir -p $(DESTDIR)$(bindir)/kickstart/scripts
	@#
	@cp -rf $(WORKSRC)/bitbake/bin $(DESTDIR)$(bindir)/kickstart/bitbake/
	@cp -rf $(WORKSRC)/bitbake/lib $(DESTDIR)$(bindir)/kickstart/bitbake/
	@cp -rf $(WORKSRC)/meta/lib/oe $(DESTDIR)$(bindir)/kickstart/bitbake/lib/
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
	@#
	@cp -f $(WORKDIR)/create-image.sh   $(DESTDIR)$(bindir)/kickstart/
	@#
	@cp -f $(WORKDIR)/board-*.conf      $(DESTDIR)$(bindir)/kickstart/conf/multiconfig/
	@cp -f $(WORKDIR)/board-*.wks       $(DESTDIR)$(bindir)/kickstart/
	@cp -f $(WORKDIR)/default-mbr.wks   $(DESTDIR)$(bindir)/kickstart/default-mbr.wks
	@cp -f $(WORKDIR)/default-gpt.wks   $(DESTDIR)$(bindir)/kickstart/default-gpt.wks
	@#
	@# Remove all host tools requirements as we are listing them in BUILDEPS
	@sed -i -e "s/HOSTTOOLS +=/__HOSTTOOLS +=/g" $(DESTDIR)$(bindir)/kickstart/conf/bitbake.conf
	@echo 'HOSTTOOLS += " "' >> $(DESTDIR)$(bindir)/kickstart/conf/bitbake.conf
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(bindir)/kickstart*
	@$(MAKECOOKIE)
