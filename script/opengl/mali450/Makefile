
# Sources URL: http://openlinux.amlogic.com:8000/download/ARM/filesystem/arm-buildroot-2016-08-18-5aaca1b35f.tar.gz

GARNAME      = mali-opengl
GARVERSION   = 2016-08-18-5aaca1b35f
CATEGORIES   = opengl
MASTER_SITES = http://openlinux.amlogic.com:8000/download/ARM/filesystem/
DISTFILES    = arm-buildroot-$(GARVERSION).tar.gz
WORKSRC      = $(WORKDIR)/buildroot

LICENSE = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS   = \
	kernel/meson-gx-mali450 \
	xorg/xf86-video-armsoc  \

BUILD_SCRIPTS   = 
INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(libdir)/Mali450-opengl
	cp -f $(WORKDIR)/buildroot/package/opengl/src/lib/arm64/r6p1/m450/libMali.so $(DESTDIR)$(libdir)/Mali450-opengl/libMali.so
	@rm -f   $(DESTDIR)$(libdir)/libEGL.so*
	@ln -sr  $(DESTDIR)$(libdir)/Mali450-opengl/libMali.so $(DESTDIR)$(libdir)/libEGL.so.1.4
	@ln -sr  $(DESTDIR)$(libdir)/libEGL.so.1.4             $(DESTDIR)$(libdir)/libEGL.so.1
	@ln -sr  $(DESTDIR)$(libdir)/libEGL.so.1               $(DESTDIR)$(libdir)/libEGL.so
	@rm -f   $(DESTDIR)$(libdir)/libGLESv1_CM.so*
	@ln -sr  $(DESTDIR)$(libdir)/Mali450-opengl/libMali.so $(DESTDIR)$(libdir)/libGLESv1_CM.so.1.1
	@ln -sr  $(DESTDIR)$(libdir)/libGLESv1_CM.so.1.1       $(DESTDIR)$(libdir)/libGLESv1_CM.so.1
	@ln -sr  $(DESTDIR)$(libdir)/libGLESv1_CM.so.1         $(DESTDIR)$(libdir)/libGLESv1_CM.so
	@rm -f   $(DESTDIR)$(libdir)/libGLESv2.so*
	@ln -sr  $(DESTDIR)$(libdir)/Mali450-opengl/libMali.so $(DESTDIR)$(libdir)/libGLESv2.so.2.0
	@ln -sr  $(DESTDIR)$(libdir)/libGLESv2.so.2.0          $(DESTDIR)$(libdir)/libGLESv2.so.2
	@ln -sr  $(DESTDIR)$(libdir)/libGLESv2.so.2            $(DESTDIR)$(libdir)/libGLESv2.so
	@rm -rf  $(DESTDIR)$(includedir)/EGL*
	@mkdir -p $(DESTDIR)$(includedir)/EGL
	@cp -rf   $(WORKSRC)/package/opengl/src/include/EGL/*   $(DESTDIR)$(includedir)/EGL
	@rm -rf   $(DESTDIR)$(includedir)/GLES*
	@mkdir -p $(DESTDIR)$(includedir)/GLES
	@cp -rf   $(WORKSRC)/package/opengl/src/include/GLES/*  $(DESTDIR)$(includedir)/GLES
	@rm -rf   $(DESTDIR)$(includedir)/GLES2*
	@mkdir -p $(DESTDIR)$(includedir)/GLES2
	@cp -rf   $(WORKSRC)/package/opengl/src/include/GLES2/* $(DESTDIR)$(includedir)/GLES2
	@rm -rf   $(DESTDIR)$(includedir)/KHR*
	@mkdir -p $(DESTDIR)$(includedir)/KHR
	@cp -rf   $(WORKSRC)/package/opengl/src/include/KHR/*   $(DESTDIR)$(includedir)/KHR
	@mkdir -p $(DESTDIR)$(libdir)/pkgconfig
	@cp -f $(WORKSRC)/package/opengl/src/lib/pkgconfig/egl.pc    $(DESTDIR)$(libdir)/pkgconfig/egl.pc
	@cp -f $(WORKSRC)/package/opengl/src/lib/pkgconfig/glesv2.pc $(DESTDIR)$(libdir)/pkgconfig/glesv2.pc
	@$(MAKECOOKIE)

clean-all:
	@rm -f  $(DESTDIR)$(libdir)/libEGL.so*
	@rm -f  $(DESTDIR)$(libdir)/libGLESv1_CM.so*
	@rm -f  $(DESTDIR)$(libdir)/libGLESv2.so*
	@rm -rf $(DESTDIR)$(includedir)/EGL*
	@rm -rf $(DESTDIR)$(includedir)/GLES*
	@rm -rf $(DESTDIR)$(includedir)/GLES2*
	@rm -rf $(DESTDIR)$(includedir)/KHR*
	@rm -f  $(DESTDIR)$(libdir)/pkgconfig/egl.pc
	@rm -f  $(DESTDIR)$(libdir)/pkgconfig/glesv2.pc
