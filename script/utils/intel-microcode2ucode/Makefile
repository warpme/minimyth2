GARNAME = intel-microcode2ucode
GARVERSION =
CATEGORIES = utils
DISTFILES = intel-microcode2ucode.c
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom

include ../../gar.mk

extract-$(GARNAME).c:
	@mkdir -p $(WORKSRC)
	@cp -f $(DOWNLOADDIR)/$(GARNAME).c $(WORKSRC)/$(GARNAME).c
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC) && $(CC) $(CFLAGS) $(CCFLAGS) $(LDFLAGS) -fwhole-program -o $(GARNAME) $(GARNAME).c
	@$(MAKECOOKIE)

install-custom:
	install -m755 "$(WORKSRC)/$(GARNAME)" "$(DESTDIR)$(bindir)"
	@$(MAKECOOKIE)
