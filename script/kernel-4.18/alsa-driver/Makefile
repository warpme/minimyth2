GARNAME = alsa-driver
GARVERSION = 1.1.4
CATEGORIES = kernel-4.18
MASTER_SITES  = ftp://ftp.alsa-project.org/pub/driver/
MASTER_SITES += ftp://ftp.alsa-project.org/pub/testing/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c kernel-4.18/linux

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile


CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) \
	--with-cross="$(compiler_prefix)" \
	--with-kernel="$(DESTDIR)$(LINUX_BUILDDIR)" \
	--with-build="$(DESTDIR)$(LINUX_BUILDDIR)" \
	--with-redhat=no \
	--with-suse=no \
	--with-moddir="$(LINUX_MODULESDIR)/kernel/sound" \
	--with-isapnp=no \
	--with-sequencer=yes \
	--with-oss=no \
	--with-cards="ali5451,atiixp,ca0106,cmipci,cs5535audio,emu10k1,ens1371,hda-intel,ice1724,intel8x0,intel8x0m,sis7019,usb-audio,via82xx"

CONFIGURE_ENV = $(LINUX_MAKE_ENV)
BUILD_ENV     = $(LINUX_MAKE_ENV)
INSTALL_ENV   = $(LINUX_MAKE_ENV) IUSER="$(IUSER)" IGROUP="$(IGROUP)"

GAR_EXTRA_CONF += kernel-4.18/linux/package-api.mk
include ../../gar.mk

CC       := 
CPPFLAGS :=
CFLAGS   :=
LDFLAGS  :=

IUSER  := `id -u`
IGROUP := `id -g`

post-install:
	@# In-tree uses 'core' but out-of-tree uses 'acore'.
	@cd $(DESTDIR)$(LINUX_MODULESDIR)/kernel/sound ; \
		rm -fr core ; mv acore core
	@# In-tree uses 'ac97_bus.ko' but out-of-tree uses 'misc/ac97_bus.ko'.
	@cd $(DESTDIR)$(LINUX_MODULESDIR)/kernel/sound ; \
		rm -f ac97_bus.ko ; \
		mv misc/ac97_bus.ko ac97_bus.ko ; \
		rmdir --ignore-fail-on-non-empty misc
	@depmod -b "$(DESTDIR)$(rootdir)" "$(LINUX_FULL_VERSION)"
	@$(MAKECOOKIE)
