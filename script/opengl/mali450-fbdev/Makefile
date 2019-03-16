
# Sources URL: http://openlinux.amlogic.com:8000/download/ARM/filesystem/arm-buildroot-2016-08-18-5aaca1b35f.tar.gz
# https://developer.arm.com/-/media/Files/downloads/mali-drivers/user-space/hikey/mali-450_r7p0-01rel0_linux-armhf_1.tar.gz?revision=8dd9b8db-e408-4072-803a-8bf9d6ef4d71

GARNAME      = mali450-opengl
GARVERSION   = openlinux-201901-fixup
CATEGORIES   = opengl
MASTER_SITES = https://github.com/superna9999/amlogic-meson-mali/archive/
DISTFILES    = buildroot-$(GARVERSION).zip
WORKSRC      = $(WORKDIR)/amlogic-meson-mali-buildroot-$(GARVERSION)

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
	@cp -f   $(WORKSRC)/lib/arm64/m450/r7p0/fbdev/libMali.so $(DESTDIR)$(libdir)/Mali450-opengl/libMali.so
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
	@cp -rf   $(WORKSRC)/include/EGL/*                                       $(DESTDIR)$(includedir)/EGL
	@cp -rf   $(WORKSRC)/include/EGL_platform/platform_fbdev/eglplatform.h  $(DESTDIR)$(includedir)/EGL/eglplatform.h
	@cp -rf   $(WORKSRC)/include/EGL_platform/platform_fbdev/fbdev_window.h $(DESTDIR)$(includedir)/EGL/fbdev_window.h
	@rm -rf   $(DESTDIR)$(includedir)/GLES*
	@mkdir -p $(DESTDIR)$(includedir)/GLES
	@cp -rf   $(WORKSRC)/include/GLES/*  $(DESTDIR)$(includedir)/GLES
	@rm -rf   $(DESTDIR)$(includedir)/GLES2*
	@mkdir -p $(DESTDIR)$(includedir)/GLES2
	@cp -rf   $(WORKSRC)/include/GLES2/* $(DESTDIR)$(includedir)/GLES2
	@rm -rf   $(DESTDIR)$(includedir)/GLES3*
	@mkdir -p $(DESTDIR)$(includedir)/GLES3
	@cp -rf   $(WORKSRC)/include/GLES3/* $(DESTDIR)$(includedir)/GLES3
	@rm -rf   $(DESTDIR)$(includedir)/KHR*
	@mkdir -p $(DESTDIR)$(includedir)/KHR
	@cp -rf   $(WORKSRC)/include/KHR/*   $(DESTDIR)$(includedir)/KHR
	@mkdir -p $(DESTDIR)$(libdir)/pkgconfig
	@cp -f $(WORKSRC)/lib/pkgconfig/egl.pc    $(DESTDIR)$(libdir)/pkgconfig/egl.pc
	@cp -f $(WORKSRC)/lib/pkgconfig/glesv2.pc $(DESTDIR)$(libdir)/pkgconfig/glesv2.pc
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(libdir)/Mali450-opengl*
	@rm -f  $(DESTDIR)$(libdir)/libEGL.so*
	@rm -f  $(DESTDIR)$(libdir)/libGLESv1_CM.so*
	@rm -f  $(DESTDIR)$(libdir)/libGLESv2.so*
	@rm -rf $(DESTDIR)$(includedir)/EGL*
	@rm -rf $(DESTDIR)$(includedir)/GLES*
	@rm -rf $(DESTDIR)$(includedir)/GLES2*
	@rm -rf $(DESTDIR)$(includedir)/GLES3*
	@rm -rf $(DESTDIR)$(includedir)/KHR*
	@rm -f  $(DESTDIR)$(libdir)/pkgconfig/egl.pc
	@rm -f  $(DESTDIR)$(libdir)/pkgconfig/glesv2.pc
