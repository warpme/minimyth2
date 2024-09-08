
GARNAME      = tcl
GARVERSION   = 8.6.11
CATEGORIES   = utils
MASTER_SITES = http://downloads.sourceforge.net/project/$(GARNAME)/Tcl/$(GARVERSION)/
DISTFILES    = $(GARNAME)$(GARVERSION)-src.tar.gz
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/../license.terms

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

WORKSRC = $(WORKDIR)/$(GARNAME)$(GARVERSION)/unix

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-man-symlinks \
	--enable-threads \
	--enable-shared \
	$(if $(filter i386,$(GARCH_FAMILY)),--disable-64bit) \
	$(if $(filter x86_64,$(GARCH_FAMILY)),--enable-64bit) \
	--disable-64bit-vis \
	--disable-rpath \
	--disable-corefoundation \
	--enable-load \
	$(if $(filter yes,$(mm_DEBUG)),--enable-symbols) \
	--enable-langinfo \
	--enable-dll-unloading \
	--disable-dtrace \
	--disable-framework \
	--without-tzdata

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/tdbc1.0.3/libtdbcstub1.0.3.a
	@rm -f $(DESTDIR)$(libdir)/itcl4.0.3/libitclstub4.0.3.a
	@rm -f $(DESTDIR)$(bindir)/tclsh
	@ln -s tclsh$(word 1,$(subst ., ,$(GARVERSION))).$(word 2,$(subst ., ,$(GARVERSION))) $(DESTDIR)$(bindir)/tclsh
	@$(MAKECOOKIE)
