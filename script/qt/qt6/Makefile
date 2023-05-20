
BUILD_QTWEBENGINE = no

GARNAME      = qt-everywhere-src
GARVERSION   = 6.5.0
CATEGORIES   = qt
MASTER_SITES = http://download.qt.io/official_releases/qt/6.5/$(GARVERSION)/single/
DISTFILES    = $(DISTNAME).tar.xz
PATCHFILES   = $(DISTNAME)-eglfskmsgbmscreen-add-dynamic-refresh-switching.patch
PATCHFILES  += $(DISTNAME)-eglfskmsintegration-add-dynamic-refresh-switching.patch
PATCHFILES  += $(DISTNAME)-qtwebengine-hack-to-crosscompile.patch
PATCHFILES  += $(DISTNAME)-QTBUG-111697-fixes-for-building-with-GCC13.patch
LICENSE      = LGPL2_1

DESCRIPTION = 
define BLURB
endef

ifneq ($(DESTIMG),build)
DEPENDS   =            \
	lang/c         \
	lang/cxx       \
	db/mariadb     \
	lib/dbus       \
	lib/double-conversion \
	lib/freetype   \
	lib/fontconfig \
	lib/icu        \
	lib/libjpeg    \
	lib/libmng     \
	lib/libpng     \
	lib/libtiff    \
	$(if $(filter yes,$(BUILD_QTWEBENGINE)),lib/nodejs lib/nss) \
	lib/openssl    \
	lib/pcre2      \
	gstreamer/meta \
	gtk/glib       \
	gtk/harfbuzz   \
	devel/zlib     \
	devel/ruby     \
	opengl/opengl  \
	xorg/xorg
else
DEPENDS   =            \
	lang/c         \
	lang/cxx
endif

BUILDDEPS = \
	devel/bison \
	devel/flex \

ifneq ($(DESTIMG),build)
BUILDDEPS += qt/qt6
else
BUILDDEPS += $(if $(filter yes,$(BUILD_QTWEBENGINE)), devel/gn python3/python-html5lib lib/nodejs)
endif

PWD := $(shell pwd)

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

include ../../gar.mk

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
	-skip qt3d \
	-skip qtcharts \
	-skip qtcoap \
	-skip qtdatavis3d \
	-skip qtdoc \
	-skip qtimageformats \
	-skip qtlocation \
	-skip qtlottie \
	-skip qtmqtt \
	-skip qtnetworkauth \
	-skip qtopcua \
	-skip qtquick3d \
	-skip qtquicktimeline \
	-skip qtpositioning \
	-skip qtremoteobjects \
	-skip qtscxml \
	-skip qtsensors \
	-skip qtserialbus \
	-skip qtserialport \
	-skip qttools \
	-skip qttranslations \
	-skip qtquick3dphysics \
	-skip qtvirtualkeyboard \
	-skip qtwebchannel \
	-skip qtwebsockets \
	-skip qtwebview \

ifeq ($(DESTIMG),build)
CONFIGURE_ARGS += \
	-platform $(PLATFORM_GARBUILD_NAME) \
	-no-{eventfd,glib,icu,openssl,opengl,dbus,pcre} \
	-no-sql-{db2,ibase,mysql,oci,odbc,psql,sqlite} \
	-qt-{zlib,libjpeg,libpng,freetype,pcre,harfbuzz} \
	-static \
	-no-ltcg \
	-optimize-size \
	-make tools \
	-skip qt5compat \
	-skip qtmultimedia \
	-skip qtwebengine
else
CONFIGURE_ARGS += \
	-xplatform $(PLATFORM_GARHOST_NAME) \
	-qt-host-path $(build_qt6prefix) \
	-no-sql-{db2,ibase,oci,odbc,psql,sqlite} \
	-plugin-sql-mysql \
	-qt-pcre \
	-shared \
	-ltcg \
	-feature-optimize_full \
	$(if $(filter arm arm64,$(GARCH_FAMILY)),-opengl es2) \
	-make tools \
	$(if $(filter yes,$(BUILD_QTWEBENGINE)),,-skip qtwebengine) \
	-- $(DIRPATHS_CMAKE) \
	-DCMAKE_SYSTEM_NAME="Linux" \
	$(if $(filter i386,  $(GARCH_FAMILY)),-DCMAKE_SYSTEM_PROCESSOR="i386") \
	$(if $(filter x86_64,$(GARCH_FAMILY)),-DCMAKE_SYSTEM_PROCESSOR="x86_64") \
	$(if $(filter arm,   $(GARCH_FAMILY)),-DCMAKE_SYSTEM_PROCESSOR="arm") \
	$(if $(filter arm64, $(GARCH_FAMILY)),-DCMAKE_SYSTEM_PROCESSOR="aarch64") \
	-DCMAKE_SYSROOT="$(DESTDIR)" \
	-DQT_WILL_BUILD_TOOLS="ON" \
	-DQT_FORCE_BUILD_TOOLS="ON" \
	-DMySQL_INCLUDE_DIR="$(DESTDIR)$(includedir)/mysql" \
	-DQT_HOST_GN_PATH="/home/piotro/minimyth2-aarch64-next/images/build/usr/bin/gn"
endif

configure-custom:
	@echo " ==> Running configure in $(WORKBLD)"
	@rm -rf $(WORKBLD)
	@mkdir -p $(WORKBLD)
	@cd $(WORKBLD) && $(CONFIGURE_ENV) ../$(DISTNAME)/configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

build-custom:
	@echo " ==> Running build in $(WORKBLD)"
	@cd $(WORKBLD) && $(CMAKE) --build . --parallel $(PARALLELMFLAGS)
	@$(MAKECOOKIE)

install-custom:
	@echo " ==> Running install in $(WORKBLD)"
	@cd $(WORKBLD) && $(CMAKE) --install .
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
	@ln -sf $(PLATFORM_GARHOST_NAME) $(PLATFORM_DEFAULT_PATH)
	@$(call GLIBC_ADD_LIB_PATH, $(qt6libdir))
	@if [ -e $(DESTDIR)$(qt6bindir)/target_qt.conf ] ; then \
	 sed -i 's/^SysrootifyPrefix=.*/SysrootifyPrefix=false/g' $(DESTDIR)$(qt6bindir)/target_qt.conf ; \
	 fi
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
	@rm -rf $(DESTDIR)$(qt6prefix)
