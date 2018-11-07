
# https://github.com/raspberrypi/firmware

GARNAME      = bcrm-vc4
GARVERSION   = 45c6ee3cd7f36a2376b691affbc02dfc689b8056
CATEGORIES   = opengl
MASTER_SITES = https://github.com/raspberrypi/firmware/archive/
DISTFILES    = $(GARVERSION).zip
WORKSRC      = $(WORKDIR)/firmware

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c

BUILD_SCRIPTS   = 
INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(libdir)/bcrm-vc4-opengl
	cp -f $(WORKSRC)/opt/vc/lib/*.so*        $(DESTDIR)$(libdir)/bcrm-vc4-opengl/
	cp -f $(WORKSRC)/opt/vc/lib/*.a          $(DESTDIR)$(libdir)/bcrm-vc4-opengl/
	@mkdir -p $(DESTDIR)$(includedir)
	@cp -rf   $(WORKSRC)/opt/vc/include/*    $(DESTDIR)$(includedir)/
	@mkdir -p $(DESTDIR)$(libdir)/pkgconfig
	@cp -f $(WORKSRC)/opt/vc/lib/pkgconfig/* $(DESTDIR)$(libdir)/pkgconfig/
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
	@rm -f  $(DESTDIR)$(libdir)/pkgconfig/bcm_host.pc
	@rm -f  $(DESTDIR)$(libdir)/pkgconfig/brcmegl.pc
	@rm -f  $(DESTDIR)$(libdir)/pkgconfig/brcmglesv2.pc
	@rm -f  $(DESTDIR)$(libdir)/pkgconfig/brcmvg.pc
	@rm -f  $(DESTDIR)$(libdir)/pkgconfig/egl.pc
	@rm -f  $(DESTDIR)$(libdir)/pkgconfig/glesv2.pc
	@rm -f  $(DESTDIR)$(libdir)/pkgconfig/mmal.pc
	@rm -f  $(DESTDIR)$(libdir)/pkgconfig/vcsm.pc
	@rm -f  $(DESTDIR)$(libdir)/pkgconfig/vg.pc
