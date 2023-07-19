
GARNAME       = miniarch-firmware.pkg
GARVERSION    = 1.0
CATEGORIES    = miniarch
MASTER_SITES  = 
DISTFILES     = \
	PKGBUILD \

WORKSRC      = $(WORKDIR)

LICENSE = GPL2

BUILDDEPS = miniarch/pacman
DEPENDS   = firmware/firmware

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk
include ../../kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk

build-custom:
	@mkdir -p $(WORKSRC)/src/firmware
	@mkdir -p $(WORKSRC)/src/tmp
	@echo "symlinking sources ..."
	@ln -srf $(DESTDIR)$(elibdir)/firmware $(WORKSRC)/
	@filelist=`cd $(WORKSRC) ; cat ../../../../meta/minimyth/files/source/lists/kernel-arm64/minimyth-lib-list-$(mm_KERNEL_VERSION) | sed -e "/#.*/d;/.*modules.*/d"` ; \
	  # echo $${filelist} ; \
	  for file in $${filelist} ; do \
	    echo "adding firmware: $${file}" ; \
	    cp -rf --parents $(WORKSRC)/$${file} $(WORKSRC)/src/tmp ; \
	  done
	@cp -rf $(DESTDIR)$(elibdir)/firmware/cypress $(WORKSRC)/src/firmware/
	@cd $(WORKSRC)/src/tmp/work/main.d/firmware ; pwd ; mv ./* ../../../../firmware/
	@rm -rf $(WORKSRC)/src/tmp*
	@echo "starting packaging with MAKEPKG ..."
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/makepkg --skipinteg
	@$(MAKECOOKIE)

install-custom:
	@cp -f $(WORKDIR)/linux-firmware-* $(mm_SDCARD_FILES)/
	@$(MAKECOOKIE)
