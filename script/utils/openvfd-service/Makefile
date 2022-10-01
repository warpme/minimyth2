
GARNAME        = openvfd-service
# v1.4.2 6.09.2022
GARVERSION     = ac2d94c8f466d6d1d56b5dc818a342b0ce01a750
CONFIGSVERSION = e36499532ac9583cdfd1fcb2e42c0567c5a1f892
CATEGORIES     = utils
MASTER_SITES   = \
		https://github.com/arthur-liberman/linux_openvfd/archive/ \
		https://github.com/arthur-liberman/vfd-configurations/archive/
DISTFILES      = $(GARVERSION).zip $(CONFIGSVERSION).zip openvfd
WORKSRC        = $(WORKDIR)/linux_openvfd-$(GARVERSION)

LICENSE        = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = 
BUILD_SCRIPTS     = OpenVFDService
INSTALL_SCRIPTS   = OpenVFDService vfdconfigurations

include ../../gar.mk

build-OpenVFDService:
	@$(CC) $(LDFLAGS) -o $(WORKSRC)/OpenVFDService $(WORKSRC)/OpenVFDService.c -lm -lpthread
	@$(MAKECOOKIE)

install-OpenVFDService:
	@mkdir -p $(DESTDIR)$(bindir)
	@cp -rf $(WORKSRC)/OpenVFDService $(DESTDIR)$(bindir)/OpenVFDService
	@cp -rf $(WORKSRC)/../openvfd $(DESTDIR)$(bindir)/openvfd
	@$(MAKECOOKIE)

install-vfdconfigurations:
	@mkdir -p $(DESTDIR)$(datadir)/openvfd
	@cp -rf $(WORKDIR)/vfd-configurations-$(CONFIGSVERSION)/* $(DESTDIR)$(datadir)/openvfd/
	@$(MAKECOOKIE)

clean-all:
	@true
