GARNAME = qtwebkit
CATEGORIES = qt
GARVERSION = 7b528379f143c791a42f73f9d70e432d796e440b
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
	-DCMAKE_PREFIX_PATH=$(DESTDIR)$(qt5prefix) \
	-DKDE_INSTALL_LIBDIR="$(qt5libdir)" \
	-DKDE_INSTALL_QMLDIR="$(qt5prefix)/qml" \
	-DKDE_INSTALL_LIBEXECDIR="$(qt5bindir)" \
	-DECM_PKGCONFIG_INSTALL_DIR="$(qt5libdir)/pkgconfig" \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DCMAKE_BUILD_TYPE=Release \
	-DPORT=Qt \
	-DENABLE_TOOLS=OFF \
	-DUSE_LIBHYPHEN="OFF" \
	-DCMAKE_CXX_FLAGS_RELEASE="-fPIC -fno-lto" \
	-DENABLE_PRINT_SUPPORT="OFF" \
	-DENABLE_API_TESTS="OFF" \
	-DENABLE_DEVICE_ORIENTATION="OFF" \
	-DENABLE_DRAG_SUPPORT="OFF" \
	-DENABLE_GAMEPAD_DEPRECATED="OFF" \
	-DENABLE_GEOLOCATION="OFF" \
	-DENABLE_INSPECTOR_UI="OFF" \
	-DENABLE_JIT="OFF" \
	-DENABLE_NETSCAPE_PLUGIN_API="OFF" \
	-DENABLE_PRINT_SUPPORT="OFF" \
	-DENABLE_QT_GESTURE_EVENTS="OFF" \
	-DENABLE_SPELLCHECK="OFF" \
	-DENABLE_TOUCH_EVENTS="OFF" \

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
