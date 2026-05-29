
GARNAME      = gxlimg
# master git@10.11.2025
GARVERSION   = d7a8d33ef7d330a8dc77f3f53ab1e12b00a6ec8f
CATEGORIES   = net
MASTER_SITES = https://github.com/repk/gxlimg/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      = GPL2
WORKSRC      = $(WORKDIR)/$(GARNAME)-$(GARVERSION)

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

BUILD_SCRIPTS   = custom
INSTALL_SCRIPTS = custom


include ../../gar.mk

build-custom:
	@echo "Building..."
	$(MAKE) -C $(WORKSRC) $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-custom:
	@cp -f $(WORKSRC)/gxlimg $(DESTDIR)$(bindir)/
	@$(MAKECOOKIE)
