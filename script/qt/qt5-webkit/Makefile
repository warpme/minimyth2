
GARNAME      = qtwebkit
CATEGORIES   = qt
# ver 13.10.2020
GARVERSION = 5a4cfb58842dd3225b574198ec41ee76179dfe10
MASTER_SITES = https://github.com/qtwebkit/qtwebkit/archive/
PATCHFILES   = fix-building-with-icu68.patch
DISTFILES    = $(GARVERSION).zip

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c    \
	lang/cxx      \
	perl/perl     \
	db/sqlite     \
	devel/zlib    \
	devel/ruby    \
	lib/libjpeg   \
	lib/libpng    \
	lib/icu       \
	lib/libxml2   \
	lib/libxslt   \
	qt/qt5        \
	xorg/libX11   \
	gtk/glib      \

WORKSRC = $(WORKDIR)/$(DISTNAME)/Source
WORKBLD = $(WORKDIR)/$(DISTNAME)_build

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS = \
	-DCMAKE_SYSTEM_NAME="Linux" \
	$(if $(filter i386,  $(GARCH_FAMILY)),-DCMAKE_SYSTEM_PROCESSOR="i386") \
	$(if $(filter x86_64,$(GARCH_FAMILY)),-DCMAKE_SYSTEM_PROCESSOR="x86_64") \
	$(if $(filter arm,   $(GARCH_FAMILY)),-DCMAKE_SYSTEM_PROCESSOR="arm") \
	$(if $(filter arm64, $(GARCH_FAMILY)),-DCMAKE_SYSTEM_PROCESSOR="aarch64") \
	-DCMAKE_CROSSCOMPILING="ON" \
	-DCMAKE_SYSROOT="$(DESTDIR)" \
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
	-DENABLE_GEOLOCATION="OFF" \
	-DENABLE_TOOLS=OFF \
	-DUSE_LIBHYPHEN="OFF" \
	-DENABLE_PRINT_SUPPORT="OFF" \
	-DENABLE_API_TESTS="OFF" \
	-DENABLE_DEVICE_ORIENTATION="OFF" \
	-DENABLE_DRAG_SUPPORT="OFF" \
	-DENABLE_GAMEPAD_DEPRECATED="OFF" \
	-DENABLE_INSPECTOR_UI="OFF" \
	-DENABLE_NETSCAPE_PLUGIN_API="OFF" \
	-DENABLE_PRINT_SUPPORT="OFF" \
	-DENABLE_QT_GESTURE_EVENTS="OFF" \
	-DENABLE_SPELLCHECK="OFF" \
	-DENABLE_TOUCH_EVENTS="OFF" \
	-DCMAKE_CXX_FLAGS="-fPIC" \

CONFIGURE_ARGS1 = \
	-DQt5Core_DIR="/home/piotro/minimyth-dev/images/main/usr/lib/qt5/lib/cmake/Qt5Core" \
	-DQt5Gui_DIR="/home/piotro/minimyth-dev/images/main/usr/lib/qt5/lib/cmake/Qt5Gui" \
	-DQt5Network_DIR="/home/piotro/minimyth-dev/images/main/usr/lib/qt5/lib/cmake/Qt5Network" \
	-DQt5Widgets_DIR="/home/piotro/minimyth-dev/images/main/usr/lib/qt5/lib/cmake/Qt5Widgets" \
	-DQt5Quick_DIR="/home/piotro/minimyth-dev/images/main/usr/lib/qt5/lib/cmake/Qt5Quick" \
	-DQt5QmlModels_DIR="/home/piotro/minimyth-dev/images/main/usr/lib/qt5/lib/cmake/Qt5QmlModels" \
	-DQt5Qml_DIR="/home/piotro/minimyth-dev/images/main/usr/lib/qt5/lib/cmake/Qt5Qml" \
	-DQt5WebChannel_DIR="/home/piotro/minimyth-dev/images/main/usr/lib/qt5/lib/cmake/Qt5WebChannel" \
	-DGLIB_INCLUDE_DIRS="/home/piotro/minimyth-dev/images/main/usr/include" \
	-DGLIB_LIBRARIES="/home/piotro/minimyth-dev/images/main/usr/lib" \

#	-DCMAKE_PREFIX_PATH="/home/piotro/minimyth-dev/images/main/usr/lib/qt5/lib/cmake" \


include ../../gar.mk

configure-custom:
	@echo " ==> Running configure in $*"
	@mkdir -p $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) $(CMAKE) $(CONFIGURE_ARGS) ../$(DISTNAME)
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
