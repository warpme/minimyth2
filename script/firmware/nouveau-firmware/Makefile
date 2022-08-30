
GARNAME      = nouveau-firmware
NVIDIAVER    = 340.32
CATEGORIES   = firmware
MASTER_SITES = \
		https://download.nvidia.com/XFree86/Linux-x86_64/$(NVIDIAVER)/ \
		https://raw.github.com/imirkin/re-vp2/master/
DISTFILES    = NVIDIA-Linux-x86_64-$(NVIDIAVER).run extract_firmware.py
DESCRIPTION  =
WORKSRC      = $(WORKDIR)/NVIDIA-Linux-x86_64-$(NVIDIAVER)
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE


define BLURB
endef

DEPENDS = 
BUILDEPS = python2/python

BUILD_SCRIPTS = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

extract-%.run:
	@mkdir -p $(WORKDIR)
	@cp $(DOWNLOADDIR)/$*.run $(WORKDIR)
	@cd $(WORKDIR) ; sh $*.run --extract-only
	@cd $(WORKDIR) ; rm -rf $*.run
	@$(MAKECOOKIE)

build-custom:
	@chmod +x $(WORKDIR)/extract_firmware.py
	@cd $(WORKDIR); pwd; $(build_bindir)/python2 extract_firmware.py
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/nouveau
	@cd $(WORKDIR); cp -Rdf {nv*,vuc*} $(DESTDIR)$(elibdir)/firmware/nouveau/
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/nouveau*
