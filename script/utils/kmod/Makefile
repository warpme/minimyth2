
GARNAME      = kmod
GARVERSION   = 30
CATEGORIES   = utils
MASTER_SITES = https://www.kernel.org/pub/linux/utils/kernel/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile links

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--disable-static \
	--enable-shared \
	--disable-experimental \
	--enable-tools \
	--disable-manpages \
	--disable-test-modules \
	--enable-logging \
	--disable-debug \
	--disable-python \
	--disable-coverage \
	--disable-gtk-doc \
	--disable-gtk-doc-html \
	--disable-gtk-doc-pdf \
	--with-gnu-ld \
	--without-xz \
	--without-zlib

include ../../gar.mk

install-links:
	@rm -f $(DESTDIR)$(esbindir)/depmod
	@ln -s $(patsubst /%,%,$(call DIRSTODOTS,$(esbindir)))$(bindir)/kmod $(DESTDIR)$(esbindir)/depmod
	@rm -f $(DESTDIR)$(esbindir)/insmod
	@ln -s $(patsubst /%,%,$(call DIRSTODOTS,$(esbindir)))$(bindir)/kmod $(DESTDIR)$(esbindir)/insmod
	@rm -f $(DESTDIR)$(esbindir)/lsmod
	@ln -s $(patsubst /%,%,$(call DIRSTODOTS,$(esbindir)))$(bindir)/kmod $(DESTDIR)$(esbindir)/lsmod
	@rm -f $(DESTDIR)$(esbindir)/modinfo
	@ln -s $(patsubst /%,%,$(call DIRSTODOTS,$(esbindir)))$(bindir)/kmod $(DESTDIR)$(esbindir)/modinfo
	@rm -f $(DESTDIR)$(esbindir)/modprobe
	@ln -s $(patsubst /%,%,$(call DIRSTODOTS,$(esbindir)))$(bindir)/kmod $(DESTDIR)$(esbindir)/modprobe
	@rm -f $(DESTDIR)$(esbindir)/rmmod
	@ln -s $(patsubst /%,%,$(call DIRSTODOTS,$(esbindir)))$(bindir)/kmod $(DESTDIR)$(esbindir)/rmmod
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libkmod.la
	@$(MAKECOOKIE)
