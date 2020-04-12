
GARNAME      = glib
GARVERSION   = 2.59.0
CATEGORIES   = gtk
MASTER_SITES = https://ftp.gnome.org/pub/gnome/sources/glib/2.59/
PATCHFILES   = $(DISTNAME)-fix-gtk-doc-compile.patch
DISTFILES    = $(DISTNAME).tar.xz
LICENSE      = LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS    = lang/c lib/libffi lib/pcre devel/zlib gtk/gtk-doc utils/util-linux
BUILDDEPS  = gtk/gtk-doc

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--cache-file=config.cache \
	--disable-silent-rules \
	--disable-debug \
	--disable-static \
	--enable-shared \
	--disable-selinux \
	--disable-fam \
	--enable-xattr \
	--disable-libelf \
	--disable-gtk-doc \
	--disable-man \
	--disable-dtrace \
	--disable-systemtap \
	--disable-gcov \
	--enable-Bsymbolic \
	--with-gnu-ld \
	--with-threads=posix \
	--with-pcre=system

CONFIGURE_ENV  =
ifneq ($(DESTIMG),build)
CONFIGURE_ENV += \
	ac_cv_func_mmap_fixed_mapped='yes' \
	ac_cv_func_posix_getpwuid_r='yes' \
	ac_cv_func_posix_getgrgid_r='yes' \
	ac_cv_func_printf_unix98='yes' \
	ac_cv_func_snprintf_c99='yes' \
	ac_cv_func_vsnprintf_c99='yes' \
	glib_cv_stack_grows='no' \
	glib_cv_uscore='no' \
	glib_cv_va_val_copy='no'
endif

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@mkdir -p $(DESTDIR)$(qt5libdir)/pkgconfig/
	@cp -rf $(WORKSRC)/glib-2.0.pc $(DESTDIR)$(qt5libdir)/pkgconfig/
	@rm -rf $(DESTDIR)$(libdir)/libgio-2.0.la
	@rm -rf $(DESTDIR)$(libdir)/libglib-2.0.la
	@rm -rf $(DESTDIR)$(libdir)/libgmodule-2.0.la
	@rm -rf $(DESTDIR)$(libdir)/libgobject-2.0.la
	@rm -rf $(DESTDIR)$(libdir)/libgthread-2.0.la
	@$(MAKECOOKIE)
