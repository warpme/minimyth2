
GARNAME       = exiv2
# commit is for exiv2 v0.27.2
GARVERSION    = 70f9405fafbe19c7bab94b36a1267c4332dc8a8a
CATEGORIES    = lib
MASTER_SITES  = https://github.com/Exiv2/exiv2/archive/
DISTFILES     = $(GARVERSION).zip
WORKSRC       = $(WORKDIR)/exiv2-$(GARVERSION)
LICENSE       = GPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c lang/cxx lib/expat devel/zlib

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS = \
	-DCMAKE_INSTALL_PREFIX="$(prefix)" \
	-DCMAKE_INSTALL_LIBDIR="lib" \
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
	-DCMAKE_VERBOSE_MAKEFILE="1" \

ifneq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	-DCMAKE_SYSTEM_NAME="Linux"
endif

include ../../gar.mk

configure-%/cmake: 
	@echo " ==> Running configure in $*"
	@rm -rf $*
	@mkdir -p $*
	@cd $* && $(CONFIGURE_ENV) cmake $(CONFIGURE_ARGS) ../$(DISTNAME)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/lib$(GARNAME).la
	@$(MAKECOOKIE)
