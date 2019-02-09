
# URL for sources: https://github.com/raspberrypi/firmware/archive/542c628c54bc0ffb988fb2494d4b646f9d89263c.zip

GARNAME      = libopenmax
GARVERSION   = 542c628c54bc0ffb988fb2494d4b646f9d89263c
CATEGORIES   = lib
MASTER_SITES = https://github.com/raspberrypi/firmware/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/firmware-$(GARVERSION)

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

BUILD_SCRIPTS   = 
INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(libdir)
	@cp -f $(WORKSRC)/opt/vc/lib/libbcm_host.so         $(DESTDIR)$(libdir)/libbcm_host.so
	@cp -f $(WORKSRC)/opt/vc/lib/libcontainers.so       $(DESTDIR)$(libdir)/libcontainers.so
	@cp -f $(WORKSRC)/opt/vc/lib/libmmal_components.so  $(DESTDIR)$(libdir)/libmmal_components.so
	@cp -f $(WORKSRC)/opt/vc/lib/libmmal_core.so        $(DESTDIR)$(libdir)/libmmal_core.so
	@cp -f $(WORKSRC)/opt/vc/lib/libmmal.so             $(DESTDIR)$(libdir)/libmmal.so
	@cp -f $(WORKSRC)/opt/vc/lib/libmmal_util.so        $(DESTDIR)$(libdir)/libmmal_util.so
	@cp -f $(WORKSRC)/opt/vc/lib/libmmal_vc_client.so   $(DESTDIR)$(libdir)/libmmal_vc_client.so
	@cp -f $(WORKSRC)/opt/vc/lib/libopenmaxil.so        $(DESTDIR)$(libdir)/libopenmaxil.so
	@cp -f $(WORKSRC)/opt/vc/lib/libvchiq_arm.so        $(DESTDIR)$(libdir)/libvchiq_arm.so
	@cp -f $(WORKSRC)/opt/vc/lib/libvcos.so             $(DESTDIR)$(libdir)/libvcos.so
	@cp -f $(WORKSRC)/opt/vc/lib/libvcsm.so             $(DESTDIR)$(libdir)/libvcsm.so
	@mkdir -p $(DESTDIR)$(includedir)
	@cp -rf $(WORKSRC)/opt/vc/include/IL*           $(DESTDIR)$(includedir)/
	@cp -rf $(WORKSRC)/opt/vc/include/interface*    $(DESTDIR)$(includedir)/
	@cp -rf $(WORKSRC)/opt/vc/include/vcinclude*    $(DESTDIR)$(includedir)/
	@cp -f  $(WORKSRC)/opt/vc/include/bcm_host.h    $(DESTDIR)$(includedir)/bcm_host.h
	@mkdir -p $(DESTDIR)$(libdir)/pkgconfig
	@cp -f $(WORKSRC)/opt/vc/lib/pkgconfig/bcm_host.pc $(DESTDIR)$(libdir)/pkgconfig/bcm_host.pc
	@cp -f $(WORKSRC)/opt/vc/lib/pkgconfig/mmal.pc     $(DESTDIR)$(libdir)/pkgconfig/mmal.pc
	@cp -f $(WORKSRC)/opt/vc/lib/pkgconfig/vcsm.pc     $(DESTDIR)$(libdir)/pkgconfig/vcsm.pc
	@sed -e 's%/opt/vc%/usr%' -i $(DESTDIR)$(libdir)/pkgconfig/bcm_host.pc
	@sed -e 's%/opt/vc%/usr%' -i $(DESTDIR)$(libdir)/pkgconfig/mmal.pc
	@sed -e 's%/opt/vc%/usr%' -i $(DESTDIR)$(libdir)/pkgconfig/vcsm.pc
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(includedir)/IL*
	@rm -rf $(DESTDIR)$(includedir)/interface*
	@rm -rf $(DESTDIR)$(includedir)/vcinclude*
	@rm -f $(DESTDIR)$(includedir)/bcm_host.h
	@rm -f $(DESTDIR)$(libdir)/libbcm_host.so
	@rm -f $(DESTDIR)$(libdir)/libcontainers.so
	@rm -f $(DESTDIR)$(libdir)/libmmal_components.so
	@rm -f $(DESTDIR)$(libdir)/libmmal_core.so
	@rm -f $(DESTDIR)$(libdir)/libmmal.so
	@rm -f $(DESTDIR)$(libdir)/libmmal_util.so
	@rm -f $(DESTDIR)$(libdir)/libmmal_vc_client.so
	@rm -f $(DESTDIR)$(libdir)/libopenmaxil.so
	@rm -f $(DESTDIR)$(libdir)/libvchiq_arm.so
	@rm -f $(DESTDIR)$(libdir)/libvcos.so
	@rm -f $(DESTDIR)$(libdir)/libvcsm.so
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/bcm_host.pc
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/mmal.pc
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/vcsm.pc
