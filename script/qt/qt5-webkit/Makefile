GARNAME = qtwebkit
CATEGORIES = qt
GARVERSION = 47e125f8c3ff6fb508a8f055d45b15365d5e9d83
MASTER_SITES = https://github.com/qt/qtwebkit/archive/
DISTFILES = $(GARVERSION).zip
PATCHFILES  = qt5-webkit-revert-ac17da2-Check-Qt-private-headers-available-before-compilation.patch

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c    \
	lang/cxx      \
	perl/perl     \
	db/sqlite     \
	devel/zlib    \
	lib/libjpeg   \
	lib/libpng    \
	lib/icu       \
	lib/libxml2   \
	lib/libxslt   \
	qt/qt5        \
	xorg/libX11   \
	gtk/glib      \
	utils/ruby    \

WORKSRC = $(WORKDIR)/$(DISTNAME)/Source
WORKBLD = $(WORKDIR)/$(DISTNAME)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS = \
	-DCMAKE_INSTALL_PREFIX="$(qt5prefix)" \
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
	-DCMAKE_VERBOSE_MAKEFILE="ON" \
	-DCMAKE_BUILD_TYPE=Release \
	-DPORT=Qt \
	-DENABLE_TOOLS=OFF \
	-DCMAKE_PREFIX_PATH=$(DESTDIR)$(qt5prefix) \
	-DUSE_LIBHYPHEN="OFF" \
	-DENABLE_PRINT_SUPPORT="OFF" \
	-DCMAKE_CXX_FLAGS_RELEASE="-fPIC -fno-lto" \
	-DKDE_INSTALL_LIBDIR="$(qt5libdir)" \
	-DKDE_INSTALL_QMLDIR="$(qt5prefix)/qml" \
	-DKDE_INSTALL_LIBEXECDIR="$(qt5bindir)" \
	-DECM_PKGCONFIG_INSTALL_DIR="$(qt5libdir)/pkgconfig" \
	-DENABLE_JIT="OFF"

ifeq ($(CPU_ARCH),armv7)
CONFIGURE_ARGS += \
	-DENABLE_JIT="OFF"
else
ifeq ($(CPU_ARCH),armv8)
CONFIGURE_ARGS += \
	-DENABLE_JIT="OFF"
endif
endif

include ../../gar.mk

configure-%/cmake:
	@echo " ==> Running configure in $*"
	@rm -rf $*
	@mkdir -p $*
	@cd $* && $(CONFIGURE_ENV) cmake $(CONFIGURE_ARGS) ../$(DISTNAME)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(qt5libdir)/*.la
	@sed \
	 -e 's%^Libs:.*%Libs: -L$(qt5libdir) -lQt5WebKit %g'      \
	 -e 's%^Cflags:.*%Cflags: -I$(qt5includedir)/QtWebKit %g' \
	 -i $(DESTDIR)$(qt5libdir)/pkgconfig/Qt5WebKit.pc
	@sed \
	 -e 's%^Libs:.*%Libs: -L$(qt5libdir) -lQt5WebKitWidgets %g' \
	 -e 's%^Cflags:.*%Cflags: -I$(qt5includedir)/QtWebKit %g'   \
	 -i $(DESTDIR)$(qt5libdir)/pkgconfig/Qt5WebKitWidgets.pc
	@#
	@sed \
	 -e 's%^QT.webkit.libs.*%QT.webkit.libs = \$$\$$QT_MODULE_LIB_BASE%g'             \
	 -e 's%^QT.webkit.includes.*%QT.webkit.includes = \$$\$$QT_MODULE_INCLUDE_BASE \$$\$$QT_MODULE_INCLUDE_BASE/QtWebKit%g' \
	 -e 's%^QT.webkit.bins.*%QT.webkit.bins = \$$\$$QT_MODULE_BIN_BASE%g'             \
	 -e 's%^QT.webkit.libexecs.*%QT.webkit.libexecs = \$$\$$QT_MODULE_LIBEXEC_BASE%g' \
	 -e 's%^QT.webkit.plugins.*%QT.webkit.plugins = \$$\$$QT_MODULE_PLUGIN_BASE%g'    \
	 -e 's%^QT.webkit.imports.*%QT.webkit.imports = \$$\$$QT_MODULE_IMPORT_BASE%g'    \
	 -e 's%^QT.webkit.qml.*%QT.webkit.qml = \$$\$$QT_MODULE_QML_BASE%g'               \
	 -i $(DESTDIR)$(qt5prefix)/mkspecs/modules/qt_lib_webkit.pri
	@#
	@sed \
	 -e 's%^QT.webkitwidgets.libs.*%QT.webkitwidgets.libs = \$$\$$QT_MODULE_LIB_BASE%g'             \
	 -e 's%^QT.webkitwidgets.includes.*%QT.webkitwidgets.includes = \$$\$$QT_MODULE_INCLUDE_BASE \$$\$$QT_MODULE_INCLUDE_BASE/QtWebKitWidgets%g' \
	 -e 's%^QT.webkitwidgets.bins.*%QT.webkitwidgets.bins = \$$\$$QT_MODULE_BIN_BASE%g'             \
	 -e 's%^QT.webkitwidgets.libexecs.*%QT.webkitwidgets.libexecs = \$$\$$QT_MODULE_LIBEXEC_BASE%g' \
	 -e 's%^QT.webkitwidgets.plugins.*%QT.webkitwidgets.plugins = \$$\$$QT_MODULE_PLUGIN_BASE%g'    \
	 -e 's%^QT.webkitwidgets.imports.*%QT.webkitwidgets.imports = \$$\$$QT_MODULE_IMPORT_BASE%g'    \
	 -e 's%^QT.webkitwidgets.qml.*%QT.webkitwidgets.qml = \$$\$$QT_MODULE_QML_BASE%g'               \
	 -i $(DESTDIR)$(qt5prefix)/mkspecs/modules/qt_lib_webkitwidgets.pri
	@$(MAKECOOKIE)
