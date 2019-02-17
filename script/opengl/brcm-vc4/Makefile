
# URL for sources: https://github.com/raspberrypi/firmware

GARNAME      = rpi-opengl
GARVERSION   = 83977fe3b6ef54c1d29c83b0a778d330f523441f
CATEGORIES   = opengl
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
	cp -f $(WORKSRC)/opt/vc/lib/*.so*        $(DESTDIR)$(libdir)/
	cp -f $(WORKSRC)/opt/vc/lib/*.a          $(DESTDIR)$(libdir)/
	@mkdir -p $(DESTDIR)$(includedir)
	@cp -rf   $(WORKSRC)/opt/vc/include/*    $(DESTDIR)$(includedir)/
	@mkdir -p $(DESTDIR)$(libdir)/pkgconfig
	@cp -f $(WORKSRC)/opt/vc/lib/pkgconfig/* $(DESTDIR)$(libdir)/pkgconfig/
	@sed -e 's%/opt/vc%/usr%' -i $(DESTDIR)$(libdir)/pkgconfig/bcm_host.pc
	@sed -e 's%/opt/vc%/usr%' -i $(DESTDIR)$(libdir)/pkgconfig/brcmegl.pc
	@sed -e 's%/opt/vc%/usr%' -i $(DESTDIR)$(libdir)/pkgconfig/brcmglesv2.pc
	@sed -e 's%/opt/vc%/usr%' -i $(DESTDIR)$(libdir)/pkgconfig/brcmvg.pc
	@sed -e 's%/opt/vc%/usr%' -i $(DESTDIR)$(libdir)/pkgconfig/egl.pc
	@sed -e 's%/opt/vc%/usr%' -i $(DESTDIR)$(libdir)/pkgconfig/glesv2.pc
	@sed -e 's%/opt/vc%/usr%' -i $(DESTDIR)$(libdir)/pkgconfig/mmal.pc
	@sed -e 's%/opt/vc%/usr%' -i $(DESTDIR)$(libdir)/pkgconfig/vcsm.pc
	@sed -e 's%/opt/vc%/usr%' -i $(DESTDIR)$(libdir)/pkgconfig/vg.pc
	@mv      $(DESTDIR)$(libdir)/libEGL.so   $(DESTDIR)$(libdir)/libEGL.so.1
	@ln -sr  $(DESTDIR)$(libdir)/libEGL.so.1 $(DESTDIR)$(libdir)/libEGL.so
	@mv      $(DESTDIR)$(libdir)/libGLESv2.so   $(DESTDIR)$(libdir)/libGLESv2.so.2
	@ln -sr  $(DESTDIR)$(libdir)/libGLESv2.so.2 $(DESTDIR)$(libdir)/libGLESv2.so
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(includedir)/EGL*
	@rm -rf $(DESTDIR)$(includedir)/GLES*
	@rm -rf $(DESTDIR)$(includedir)/GLES2*
	@rm -rf $(DESTDIR)$(includedir)/IL*
	@rm -rf $(DESTDIR)$(includedir)/interface*
	@rm -rf $(DESTDIR)$(includedir)/KHR*
	@rm -rf $(DESTDIR)$(includedir)/vcinclude*
	@rm -rf $(DESTDIR)$(includedir)/VG*
	@rm -rf $(DESTDIR)$(includedir)/WF*
	@rm -f $(DESTDIR)$(includedir)/bcm_host.h
	@rm -f $(DESTDIR)$(libdir)/libbcm_host.so
	@rm -f $(DESTDIR)$(libdir)/libbrcmEGL.so
	@rm -f $(DESTDIR)$(libdir)/libbrcmGLESv2.so
	@rm -f $(DESTDIR)$(libdir)/libbrcmOpenVG.so
	@rm -f $(DESTDIR)$(libdir)/libbrcmWFC.so
	@rm -f $(DESTDIR)$(libdir)/libcontainers.so
	@rm -f $(DESTDIR)$(libdir)/libdebug_sym.so
	@rm -f $(DESTDIR)$(libdir)/libdebug_sym_static.a
	@rm -f $(DESTDIR)$(libdir)/libdtovl.so
	@rm -f $(DESTDIR)$(libdir)/libEGL.so*
	@rm -f $(DESTDIR)$(libdir)/libEGL_static.a
	@rm -f $(DESTDIR)$(libdir)/libelftoolchain.so
	@rm -f $(DESTDIR)$(libdir)/libGLESv1_CM.so
	@rm -f $(DESTDIR)$(libdir)/libGLESv2.so*
	@rm -f $(DESTDIR)$(libdir)/libGLESv2_static.a
	@rm -f $(DESTDIR)$(libdir)/libkhrn_client.a
	@rm -f $(DESTDIR)$(libdir)/libkhrn_static.a
	@rm -f $(DESTDIR)$(libdir)/libmmal_components.so
	@rm -f $(DESTDIR)$(libdir)/libmmal_core.so
	@rm -f $(DESTDIR)$(libdir)/libmmal.so
	@rm -f $(DESTDIR)$(libdir)/libmmal_util.so
	@rm -f $(DESTDIR)$(libdir)/libmmal_vc_client.so
	@rm -f $(DESTDIR)$(libdir)/libopenmaxil.so
	@rm -f $(DESTDIR)$(libdir)/libOpenVG.so
	@rm -f $(DESTDIR)$(libdir)/libvcfiled_check.a
	@rm -f $(DESTDIR)$(libdir)/libvchiq_arm.so
	@rm -f $(DESTDIR)$(libdir)/libvchostif.a
	@rm -f $(DESTDIR)$(libdir)/libvcilcs.a
	@rm -f $(DESTDIR)$(libdir)/libvcos.so
	@rm -f $(DESTDIR)$(libdir)/libvcsm.so
	@rm -f $(DESTDIR)$(libdir)/libWFC.so
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/bcm_host.pc
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/brcmegl.pc
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/brcmglesv2.pc
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/brcmvg.pc
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/egl.pc
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/glesv2.pc
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/mmal.pc
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/vcsm.pc
	@rm -f $(DESTDIR)$(libdir)/pkgconfig/vg.pc
