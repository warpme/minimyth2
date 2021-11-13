
GARNAME       = kmscube
GARVERSION    = 4660a7dca6512b6e658759d00cff7d4ad2a2059d
CATEGORIES    = $(CATEGORY)
MASTER_SITES  = https://gitlab.freedesktop.org/mesa/kmscube/-/archive/$(GARVERSION)/
DISTFILES     = kmscube-$(GARVERSION).tar.bz2
WORKSRC       = $(WORKDIR)/kmscube-$(GARVERSION)
LICENSE       = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c          \
	lib/libjpeg-turbo \
	lib/libpng        \
	xorg/libX11       \
	xorg/libxcb       \
	xorg/libdrm       \
	python2/python    \

CONFIGURE_SCRIPTS  = custom
BUILD_SCRIPTS      = custom
INSTALL_SCRIPTS    = custom

include ../../gar.mk

CONFIGURE_ARGS = \
	--prefix="$(DESTDIR)$(prefix)" \
	--libdir="$(DESTDIR)$(libdir)" \
	--includedir="$(DESTDIR)$(includedir)" \
	--datadir="$(DESTDIR)$(datadir)" \
	--cross-file=$(build_DESTDIR)$(build_datadir)/meson/cross/$(GARHOST).conf \
	--buildtype=release \

configure-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/meson build $(CONFIGURE_ARGS)
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/meson configure build
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/ninja -C build
	@$(MAKECOOKIE)

install-custom:
	@cd $(WORKSRC); $(build_DESTDIR)$(build_bindir)/ninja -C build install
	@$(MAKECOOKIE)

clean-all:
	@true
