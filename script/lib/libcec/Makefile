
GARNAME      = libcec
GARVERSION   = 6.0.2
CATEGORIES   = lib
MASTER_SITES = https://github.com/Pulse-Eight/libcec/archive/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/cxx lib/lockdev lib/platform lib/p8-platform system/eudev xorg/xorg

WORKSRC = $(WORKDIR)/$(GARNAME)-$(DISTNAME)
WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS = \
	-DCMAKE_INSTALL_PREFIX="$(prefix)" \
	-DCMAKE_INSTALL_LIBDIR:PATH="$(patsubst $(prefix)/%,%,$(libdir))" \
	-DCMAKE_FIND_ROOT_PATH="$(DESTDIR)$(prefix)" \
	-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="NEVER" \
	-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="ONLY" \
	-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="ONLY" \
	-DCMAKE_FIND_ROOT_PATH_MODE_PACKAGE="ONLY" \
	-DCMAKE_C_COMPILER="$(build_DESTDIR)$(build_bindir)/$(CC)" \
	-DCMAKE_CXX_COMPILER="$(build_DESTDIR)$(build_bindir)/$(CXX)" \
	-DCMAKE_AR="$(build_DESTDIR)$(build_bindir)/$(AR)" \
	-DCMAKE_LINKER="$(build_DESTDIR)$(build_bindir)/$(LD)" \
	-DCMAKE_NM="$(build_DESTDIR)$(build_bindir)/$(NM)" \
	-DCMAKE_OBJCOPY="$(build_DESTDIR)$(build_bindir)/$(OBJCOPY)" \
	-DCMAKE_OBJDUMP="$(build_DESTDIR)$(build_bindir)/$(OBJDUMP)" \
	-DCMAKE_RANLIB="$(build_DESTDIR)$(build_bindir)/$(RANLIB)" \
	-DCMAKE_STRIP="$(build_DESTDIR)$(build_bindir)/$(STRIP)" \
	-DBUILD_SHARED_LIBS=1 \
	-DHAVE_AOCEC_API=1 \
	-DHAVE_LINUX_API=1 \
	-DCMAKE_VERBOSE_MAKEFILE=1 \

ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	-DCMAKE_SYSTEM_NAME="Linux"
endif

include ../../gar.mk

configure-%/cmake: 
	@echo " ==> Running configure in $*"
	@rm -rf $*
	@mkdir -p $*
	@cd $* && $(CONFIGURE_ENV) cmake $(CONFIGURE_ARGS) ../$(patsubst %_build,%,$(notdir $*))
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(bindir)/cec-client
	@mv -f $(DESTDIR)$(bindir)/cec-client-$(GARVERSION) $(DESTDIR)$(bindir)/cec-client
	@$(MAKECOOKIE)
