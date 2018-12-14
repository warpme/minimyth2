GARNAME = kickstart-oe
GARVERSION = 2.6
CATEGORIES = utils
MASTER_SITES = http://git.yoctoproject.org/cgit/cgit.cgi/poky/snapshot/
DISTFILES = \
	poky-yocto-$(GARVERSION).tar.bz2 \
	MiniMyth2.wks \
	board-rpi2.conf \
	board-rpi3.conf \
	board-s905.conf \
	create-image.sh \
	s905-rpi3.conf \
	upload-burn.sh \

WORKSRC = $(WORKDIR)/poky-yocto-$(GARVERSION)
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	python3/python \
	python3/python-codegen \
	python3/python-ply \
	python3/python-beautifulsoup4 \
	python3/python-simplediff \
	utils/diffstat \
	utils/dosfstools \
	utils/mtools \
	utils/pseudo \
	utils/e2fsprogs \

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
	@mkdir -p $(DESTDIR)$(bindir)/kickstart/tmp
	@mkdir -p $(DESTDIR)$(bindir)/kickstart/tmp/sysroots-components/x86_64/pseudo-native/usr/bin
	@#
	@cp -rf $(WORKSRC)/bitbake/bin $(DESTDIR)$(bindir)/kickstart/bitbake/
	@cp -rf $(WORKSRC)/bitbake/lib $(DESTDIR)$(bindir)/kickstart/bitbake/
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
	@cp -rf $(WORKSRC)/scripts/lib/    $(DESTDIR)$(bindir)/kickstart/scripts/lib/
	@cp -f  $(WORKSRC)/scripts/wic     $(DESTDIR)$(bindir)/kickstart/scripts/wic
	@cp -f  $(DESTDIR)$(bindir)/pseudo $(DESTDIR)$(bindir)/kickstart/tmp/sysroots-components/x86_64/pseudo-native/usr/bin/pseudo
	@#
	@cp -f $(WORKDIR)/MiniMyth2.wks   $(DESTDIR)$(bindir)/kickstart/
	@cp -f $(WORKDIR)/create-image.sh $(DESTDIR)$(bindir)/kickstart/
	@cp -f $(WORKDIR)/upload-burn.sh  $(DESTDIR)$(bindir)/kickstart/
	@#
	@cp -f $(WORKDIR)/board-rpi2.conf $(DESTDIR)$(bindir)/kickstart/conf/multiconfig/
	@cp -f $(WORKDIR)/board-rpi3.conf $(DESTDIR)$(bindir)/kickstart/conf/multiconfig/
	@cp -f $(WORKDIR)/board-s905.conf $(DESTDIR)$(bindir)/kickstart/conf/multiconfig/
	@cp -f $(WORKDIR)/s905-rpi3.conf  $(DESTDIR)$(bindir)/kickstart/conf/multiconfig/
	@$(MAKECOOKIE)
