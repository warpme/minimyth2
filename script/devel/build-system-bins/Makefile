GARNAME = build-system-bins
GARVERSION =
CATEGORIES = devel
LICENSE =

DESCRIPTION =
define BLURB
endef

ifeq ("$(DESTIMG)","build")
INSTALL_SCRIPTS = bins
else
INSTALL_SCRIPTS = error
endif

GAR_EXTRA_CONF += devel/build-system-bins/package-api.mk
include ../../gar.mk

PATH=$(BUILD_SYSTEM_PATH)
export $(PATH)

install-bins:
	@rm -rf   $(DESTDIR)$(rootdir)/bin-build-system
	@mkdir -p $(DESTDIR)$(rootdir)/bin-build-system
	@$(foreach pkg,$(build_system_bins), \
		$(foreach bin,$(sort $(build_system_bins_$(subst -,_,$(pkg)))), \
			which $(bin) > /dev/null 2>&1 ; \
			if [ ! "$$?" = "0" ] ; then \
				echo "error: your system does not contain the program '$(bin)' (from package '$(pkg)')." ; \
				exit 1 ; \
			fi ; \
			if [ ! -e $(DESTDIR)$(rootdir)/bin-build-system/$(bin) ] ; then \
				ln -s `which $(bin)` $(DESTDIR)$(rootdir)/bin-build-system/$(bin) ; \
			fi ; \
			grep -q '/perl' $(DESTDIR)$(rootdir)/bin-build-system/$(bin) ; \
			if [ "$$?" = "0" ] ; then \
				echo 'Updating perl path in $(bin)' ; \
				rm $(DESTDIR)$(rootdir)/bin-build-system/$(bin) ; \
				cp `which $(bin)` $(DESTDIR)$(rootdir)/bin-build-system/$(bin) ; \
				sed -e "s%/usr/bin/perl%$(DESTDIR)$(rootdir)/usr/bin/perl%" -i $(DESTDIR)$(rootdir)/bin-build-system/$(bin) ; \
			fi ; \
			grep -q '/python*' $(DESTDIR)$(rootdir)/bin-build-system/$(bin) ; \
			if [ "$$?" = "0" ] ; then \
				echo 'Updating python path in $(bin)' ; \
				rm $(DESTDIR)$(rootdir)/bin-build-system/$(bin) ; \
				cp `which $(bin)` $(DESTDIR)$(rootdir)/bin-build-system/$(bin) ; \
				sed -e "s%/usr/bin/python%$(DESTDIR)$(rootdir)/usr/bin/python%" -i $(DESTDIR)$(rootdir)/bin-build-system/$(bin) ; \
			fi ; \
		) \
	)
	@$(MAKECOOKIE)

install-error:
	@echo "error: this package is only valid for DESTIMG=build."
	@exit 1
	@$(MAKECOOKIE)
