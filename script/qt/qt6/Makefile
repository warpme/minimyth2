
GARNAME      = qt-everywhere-src
GARVERSION   = 6.11.0
CATEGORIES   = qt
MASTER_SITES = http://download.qt.io/official_releases/qt/6.11/$(GARVERSION)/single/
DISTFILES    = $(DISTNAME).tar.xz
PATCHFILES   = $(DISTNAME)-eglfskmsgbmscreen-add-dynamic-refresh-switching.patch
PATCHFILES  += $(DISTNAME)-eglfskmsintegration-add-dynamic-refresh-switching.patch
PATCHFILES  += $(DISTNAME)-qtdoc-uncoditionally-stop-building.patch
PATCHFILES  += $(DISTNAME)-qtwebengine-fix-compiling-with-external-ffmpeg81.patch

DESCRIPTION = 
define BLURB
endef

# modules required by myth
# qtbase
# qtdeclarative
# qthttpserver
# qtshadertools
# qttools
# qtwayland
# qtwebchannel
# qtwebengine
# qtwebsockets
# qtwebview

# list of modules removed before compilation
QT_MODULES_TO_REMOVE = \
     qt3d \
     qt5compat \
     qtactiveqt \
     qtcanvaspainter \
     qtcharts \
     qtcoap \
     qtconnectivity \
     qtdatavis3d \
     qtdoc \
     qtgraphs \
     qtgrpc \
     qtimageformats \
     qtlanguageserver \
     qtlocation \
     qtlottie \
     qtmqtt \
     qtmultimedia \
     qtnetworkauth \
     qtopcua \
     qtopenapi \
     qtpositioning \
     qtquick3d \
     qtquick3dphysics \
     qtquickeffectmaker \
     qtquicktimeline \
     qtremoteobjects \
     qtscxml \
     qtsensors \
     qtserialbus \
     qtserialport \
     qtspeech \
     qtsvg \
     qttasktree \
     qttranslations \
     qtvirtualkeyboard \

ifneq ($(DESTIMG),build)
# target build
DEPENDS   =            \
	lang/c         \
	lang/cxx       \
	db/mariadb     \
	lib/dbus       \
	lib/double-conversion \
	lib/freetype   \
	lib/fontconfig \
	lib/icu        \
	lib/libjpeg-turbo \
	lib/libjpeg    \
	lib/libmng     \
	lib/libpng     \
	lib/libtiff    \
	lib/libxslt    \
	lib/libxml2    \
	lib/libvpx     \
	lib/minizip    \
	lib/nss        \
	lib/nspr       \
	lib/openssl    \
	lib/libpng     \
	lib/libtiff    \
	lib/libwebp    \
	lib/re2        \
	lib/ffmpeg8.1  \
	gtk/glib       \
	gtk/harfbuzz   \
	devel/zlib     \
	opengl/opengl  \
	security/p11-kit \
	xorg/xorg      \

else
# host build
DEPENDS   =            \
	lang/c         \
	lang/cxx       \

endif

BUILDDEPS = \
	devel/bison \
	devel/flex  \
	lib/dbus \
	lib/fontconfig \

ifneq ($(DESTIMG),build)
BUILDDEPS += qt/qt6
else
BUILDDEPS += python3/python-html5lib lib/nodejs utils/gperf
endif

PWD := $(shell pwd)

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

include ../../gar.mk

ifeq ($(DESTIMG),build)
# build
CONFIGURE_ARGS = \
	-nomake tests \
	-platform $(PLATFORM_GARBUILD_NAME) \
	-DCMAKE_SYSROOT="$(build_DESTDIR)" \
	-DCMAKE_FIND_ROOT_PATH="$(build_DESTDIR)" \
	-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="NEVER" \
	-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="ONLY" \
	-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="ONLY" \
	-DCMAKE_FIND_ROOT_PATH_MODE_PACKAGE="ONLY" \
	-DCMAKE_FIND_USE_SYSTEM_ENVIRONMENT_PATH=OFF \
	-DCMAKE_FIND_USE_CMAKE_SYSTEM_PATH=OFF \
	-DCMAKE_FIND_USE_CMAKE_PATH=OFF \
	-DCMAKE_FIND_USE_CMAKE_ENVIRONMENT_PATH=OFF \
	-DCMAKE_FIND_USE_CMAKE_SYSTEM_PATH=OFF \
	-DCMAKE_FIND_USE_INSTALL_PREFIX=OFF \
	-DCMAKE_C_COMPILER="$(build_DESTDIR)$(build_bindir)/$(CC)" \
	-DCMAKE_CXX_COMPILER="$(build_DESTDIR)$(build_bindir)/$(CXX)" \
	-DCMAKE_AR="$(build_DESTDIR)$(build_bindir)/$(AR)" \
	-DCMAKE_LINKER="$(build_DESTDIR)$(build_bindir)/$(LD)" \
	-DCMAKE_NM="$(build_DESTDIR)$(build_bindir)/$(NM)" \
	-DCMAKE_OBJCOPY="$(build_DESTDIR)$(build_bindir)/$(OBJCOPY)" \
	-DCMAKE_OBJDUMP="$(build_DESTDIR)$(build_bindir)/$(OBJDUMP)" \
	-DCMAKE_RANLIB="$(build_DESTDIR)$(build_bindir)/$(RANLIB)" \
	-DCMAKE_STRIP="$(build_DESTDIR)$(build_bindir)/$(STRIP)" \
	-DCMAKE_BUILD_PARALLEL_LEVEL=$(CPUS) \
	-DBUILD_ONLY_GN=ON \
	-DQT_GENERATE_SBOM=OFF \

# if webengine silently fails to be enabled for building,
# add this to force building webengine and see configure output fwat is missing
#	-DQT_BUILD_MODULE_qtwebengine=ON \
#	-DQT_FEATURE_webengine_core=ON \

else
# target
CONFIGURE_ARGS = \
	-prefix $(DESTDIR)$(qt6prefix) \
	-release \
	-confirm-license \
	-opensource \
	-no-rpath \
	-no-optimized-qmake \
	-c++std c++1z \
	-nomake examples \
	-nomake tests \
	-shared \
	-xplatform $(PLATFORM_GARHOST_NAME) \
	$(if $(filter arm arm64,$(GARCH_FAMILY)),-opengl es2) \
	-qt-host-path "../../build.d/$(GARNAME)-$(GARVERSION)_build" \
	-system-libjpeg \
	-system-libpng \
	-- $(DIRPATHS_CMAKE) \
	-DCMAKE_SYSTEM_NAME="Linux" \
	$(if $(filter i386,  $(GARCH_FAMILY)),-DCMAKE_SYSTEM_PROCESSOR="i386") \
	$(if $(filter x86_64,$(GARCH_FAMILY)),-DCMAKE_SYSTEM_PROCESSOR="x86_64") \
	$(if $(filter arm,   $(GARCH_FAMILY)),-DCMAKE_SYSTEM_PROCESSOR="arm") \
	$(if $(filter arm64, $(GARCH_FAMILY)),-DCMAKE_SYSTEM_PROCESSOR="aarch64") \
	-DCMAKE_SYSROOT="$(DESTDIR)" \
	-DQT_HOST_PATH_CMAKE_DIR=$(shell pwd)/work/build.d/$(GARNAME)-$(GARVERSION)_build/qtbase/lib/cmake/ \
	-DQT_BUILD_MODULE_qtwebengine=ON \
	-DQT_FEATURE_webengine_core=ON \
	-DQT_FEATURE_webengine_system_icu=ON \
	-DQT_GENERATE_SBOM=OFF \
	-DGn_EXECUTABLE=$(shell pwd)/work/build.d/$(GARNAME)-$(GARVERSION)_build/qtwebengine/install/bin/gn \
	-DQT_FEATURE_system_re2=ON \
	-DQT_FEATURE_webengine_system_re2=ON \
	-DQT_FEATURE_openssl=ON \
	-DQT_FEATURE_openssl_linked=ON \
	-DINPUT_openssl=linked \
	-DQT_FEATURE_webengine_system_ffmpeg=ON \
	-DWEBENGINE_USE_SYSTEM_FFMPEG=ON \
	-DQT_FEATURE_webengine_proprietary_codecs=ON \
	-DQT_FEATURE_webengine_spellchecker=OFF \

endif

configure-custom:
	@echo " ==> Running configure in $(WORKBLD)"
	@rm -rf $(WORKBLD)
	@mkdir -p $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ../$(DISTNAME)/configure $(CONFIGURE_ARGS)
	@cat $(WORKBLD)/config.summary
	@$(MAKECOOKIE)

build-custom:
	@echo " ==> Running build in $(WORKBLD)"
ifeq ($(DESTIMG),build)
	@cd $(WORKBLD) && $(CMAKE) --build . --parallel $(PARALLELMFLAGS) --target host_tools
else
	@#hack to force to use exact qt build-in gn binary
	@sed -e "s|\$${Gn_EXECUTABLE}|$(shell pwd)\/work/build.d\/$(GARNAME)-$(GARVERSION)_build\/qtwebengine\/install\/bin\/gn|g" \
	  -i $(shell pwd)/work/main.d/$(GARNAME)-$(GARVERSION)/qtwebengine/cmake/QtGnGen.cmake
	@cd $(WORKBLD) && $(CMAKE) --build . --parallel $(PARALLELMFLAGS)
endif
	@#$(MAKECOOKIE)

install-custom:
ifeq ($(DESTIMG),build)
	@echo " ==> Skipping install as this is cross-compile host_tools build ..."
	@ln -srf $(WORKBLD)/qtbase/bin/qmake $(WORKBLD)/qtbase/bin/qmake6
	@ln -srf $(WORKBLD)/qtbase/bin $(WORKBLD)/bin
	@ln -srf $(WORKBLD)/qtbase/libexec $(WORKBLD)/libexec
else
	@echo " ==> Running install in $(WORKBLD)"
	@cd $(WORKBLD) && $(CMAKE) --install .
endif
	@$(MAKECOOKIE)

PLATFORM_GARBUILD_BASE_NAME = $(strip \
	$(if $(filter i386,$(build_GARCH_FAMILY)),linux-g++-32,) \
	$(if $(filter x86_64,$(build_GARCH_FAMILY)),linux-g++-64,))
PLATFORM_GARHOST_BASE_NAME = $(strip \
	$(if $(filter i386,$(GARCH_FAMILY)),linux-g++-32,) \
	$(if $(filter x86_64,$(GARCH_FAMILY)),linux-g++-64,) \
	$(if $(filter arm,$(GARCH_FAMILY)),linux-arm-gnueabi-g++,) \
	$(if $(filter arm64,$(GARCH_FAMILY)),linux-aarch64-gnu-g++,))
PLATFORM_GARBUILD_NAME      = $(PLATFORM_GARBUILD_BASE_NAME)-garbuild
PLATFORM_GARHOST_NAME       = $(PLATFORM_GARHOST_BASE_NAME)-garhost
PLATFORM_DEFAULT_NAME       = default
PLATFORM_GARBUILD_BASE_PATH = $(WORKSRC)/qtbase/mkspecs/$(PLATFORM_GARBUILD_BASE_NAME)
PLATFORM_GARHOST_BASE_PATH  = $(WORKSRC)/qtbase/mkspecs/$(PLATFORM_GARHOST_BASE_NAME)
PLATFORM_GARBUILD_PATH      = $(WORKSRC)/qtbase/mkspecs/$(PLATFORM_GARBUILD_NAME)
PLATFORM_GARHOST_PATH       = $(WORKSRC)/qtbase/mkspecs/$(PLATFORM_GARHOST_NAME)
PLATFORM_DEFAULT_PATH       = $(DESTDIR)$(qt6prefix)/mkspecs/$(PLATFORM_DEFAULT_NAME)

QMAKE_INCLUDES    = $(filter  -I%, $($(strip $(1))CPPFLAGS))
QMAKE_NONINCLUDES = $(filter-out  -I%, $($(strip $(1))CPPFLAGS))
QMAKE_LIBS        = $(filter  -L%, $($(strip $(1))LDFLAGS))
QMAKE_NONLIBS     = $(filter-out  -L%, $($(strip $(1))LDFLAGS))
QMAKE_CFLAGS      = $(strip $(call QMAKE_INCLUDES, $(1)) $(call QMAKE_LIBS, $(1)) $(filter -m32 -m64,$($(strip $(1))CFLAGS)))
QMAKE_LFLAGS      = $(strip $(call QMAKE_NONLIBS,  $(1)) $(call QMAKE_LIBS, $(1)) $(filter -m32 -m64,$($(strip $(1))CFLAGS)))

UPDATE_PLATFORM   = sed -i 's%^\($(strip $(2))[ \t]*$(strip $(3))=[ \t]*\).*%\1$(strip $(4))%g' $(strip $(1))/qmake.conf 

CREATE_PLATFORM   = \
	rm -rf $(strip $(2)) ; \
	cp -r $(strip $(1)) $(strip $(2)) ; \
	rm -f $(strip $(2))/qmake.conf~ ; \
	echo "QMAKE_CFLAGS_RELEASE = $($(strip $(3))CFLAGS) -fPIC"                            >> $(strip $(2))/qmake.conf~ ; \
	echo "QMAKE_CFLAGS_DEBUG   = $($(strip $(3))CFLAGS) -fPIC"                            >> $(strip $(2))/qmake.conf~ ; \
	echo "QMAKE_LFLAGS_RELEASE = $($(strip $(3))CFLAGS)"                                  >> $(strip $(2))/qmake.conf~ ; \
	echo "QMAKE_LFLAGS_DEBUG   = $($(strip $(3))CFLAGS)"                                  >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/qmake.conf                   | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/unix.conf          | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/linux.conf         | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/gcc-base.conf      | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/sanitize.conf      | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/gcc-base-unix.conf | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/g++-base.conf      | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/g++-unix.conf      | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	echo 'load(qt_config)'                                                                >> $(strip $(2))/qmake.conf~ ; \
	rm -f $(strip $(2))/qmake.conf ; \
	mv -f $(strip $(2))/qmake.conf~ $(strip $(2))/qmake.conf ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_COPY              , , cp -f --preserve=timestamps) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_YACC              , , bison -y) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_CC                , , $($(strip $(3))CC)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_CXX               , , $($(strip $(3))CXX)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_LINK              , , $($(strip $(3))CXX)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_LINK_SHLIB        , , $($(strip $(3))CXX)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_AR                , , $($(strip $(3))AR) cqs) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_RANLIB            , , $($(strip $(3))RANLIB)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_STRIP             , , $($(strip $(3))STRIP)) ; \
	$(call UPDATE_PLATFORM, $(1), QMAKE_CFLAGS            , , $(call QMAKE_CFLAGS, $(3))) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_CFLAGS_RELEASE    ,+,) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_LFLAGS            , , $(call QMAKE_LFLAGS, $(3))) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_INCDIR            , , $($(strip $(3))DESTDIR)$($(strip $(3))includedir)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_LIBDIR            , , $($(strip $(3))DESTDIR)$($(strip $(3))libdir)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_INCDIR_X11        , , $($(strip $(3))DESTDIR)$($(strip $(3))includedir)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_LIBDIR_X11        , , $($(strip $(3))DESTDIR)$($(strip $(3))libdir)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_INCDIR_OPENGL     , , $($(strip $(3))DESTDIR)$($(strip $(3))includedir)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_LIBDIR_OPENGL     , , $($(strip $(3))DESTDIR)$($(strip $(3))libdir)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_INCDIR_OPENGL_ES2 , , $($(strip $(3))DESTDIR)$($(strip $(3))includedir)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_LIBDIR_OPENGL_ES2 , , $($(strip $(3))DESTDIR)$($(strip $(3))libdir)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_INCDIR_EGL        , , $($(strip $(3))DESTDIR)$($(strip $(3))includedir)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_LIBDIR_EGL        , , $($(strip $(3))DESTDIR)$($(strip $(3))libdir))

pre-configure:
	@echo "removing uneeded modules" ; \
	 for file in $(QT_MODULES_TO_REMOVE) ; do \
	   echo "removing $(WORKSRC)/$${file}" ; \
	   if [ -e $(WORKSRC)/$${file} ] ; then \
	     rm -rf $(WORKSRC)/$${file} ; \
	   fi ; \
	 done
	$(call CREATE_PLATFORM, $(PLATFORM_GARBUILD_BASE_PATH), $(PLATFORM_GARBUILD_PATH), build_)
	$(call CREATE_PLATFORM, $(PLATFORM_GARHOST_BASE_PATH) , $(PLATFORM_GARHOST_PATH) ,       )
	@$(MAKECOOKIE)

configure-%/configure:
	@cd $* && $(CONFIGURE_ENV) echo "yes" | ./configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

pre-install:
	@rm -rf $(DESTDIR)$(qt6prefix)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(qt6libdir)/*.la
	@rm -f $(PLATFORM_DEFAULT_PATH)
	@#ln -sf $(PLATFORM_GARHOST_NAME) $(PLATFORM_DEFAULT_PATH)
	@$(call GLIBC_ADD_LIB_PATH, $(qt6libdir))
	@if [ -e $(DESTDIR)$(qt6bindir)/target_qt.conf ] ; then \
	 sed -i 's/^SysrootifyPrefix=.*/SysrootifyPrefix=false/g' $(DESTDIR)$(qt6bindir)/target_qt.conf ; \
	 fi
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
	@rm -rf $(DESTDIR)$(qt6prefix)
