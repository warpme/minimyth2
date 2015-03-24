GARNAME = qt-everywhere-opensource-src
GARVERSION = 5.4.1
CATEGORIES = qt
MASTER_SITES = http://download.qt-project.org/official_releases/qt/5.4/$(GARVERSION)/single/
DISTFILES = $(DISTNAME).tar.xz
PATCHFILES = \
	$(DISTNAME).patch.gar
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lang/cxx db/mysql lib/dbus gtk/glib lib/freetype lib/fontconfig lib/icu lib/libjpeg lib/libmng lib/libpng lib/libtiff lib/openssl lib/zlib utils/ruby xorg/xorg
BUILDDEPS = devel/bison devel/flex

PWD := $(shell pwd)

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	-prefix $(DESTDIR)$(qt5prefix) \
	-bindir $(DESTDIR)$(qt5bindir) \
	-libdir $(DESTDIR)$(qt5libdir) \
	-docdir $(DESTDIR)$(qt5prefix)/doc \
	-headerdir $(DESTDIR)$(qt5includedir) \
	-datadir $(DESTDIR)$(qt5libdir) \
	-translationdir $(DESTDIR)$(qt5prefix)/translations \
	-sysconfdir $(DESTDIR)$(qt5libdir)/settings \
	-examplesdir $(DESTDIR)$(qt5prefix)/examples \
	-confirm-license \
	-release \
	-opensource \
	-shared \
	-no-qml-debug \
	-no-mtdev \
	-no-journald \
	-no-harfbuzz \
	-no-cups \
	-plugin-sql-mysql \
	-largefile \
	-no-accessibility \
	-plugin-sql-mysql \
	-no-sql-db2 \
	-no-sql-ibase \
	-no-sql-oci \
	-no-sql-odbc \
	-no-sql-psql \
	-no-sql-sqlite \
	-no-sql-sqlite2 \
	-no-sql-tds \
	-no-compile-examples \
	-nomake tools \
	-nomake examples \
	-platform $(PLATFORM_GARBUILD_NAME) \
	-system-zlib \
	-system-libpng \
	-system-libjpeg \
	-openssl-linked \
	-nomake examples \
	-no-rpath \
	-verbose \
	-no-optimized-qmake \
	-no-nis \
	-no-cups \
	-iconv \
	-no-pch \
	-dbus-linked \
	-no-gtkstyle \
	-no-egl \
	-opengl \
	-no-openvg \
	-no-sm \
	-xshape \
	-no-xsync \
	-xinerama \
	-no-xcursor \
	-xfixes \
	-xrandr \
	-xrender \
	-mitshm \
	-fontconfig \
	-no-xinput \
	-xkb \
	-glib \
	-hostprefix $(DESTDIR)$(qt5prefix) \
	-force-pkg-config \
	-continue \
	-silent
ifeq ($(DESTIMG),build)
BUILD_ENV = \
	LD_LIBRARY_PATH="$(PWD)/$(WORKSRC)/lib:$(LD_LIBRARY_PATH)"
else
CONFIGURE_ARGS += \
	-xplatform $(PLATFORM_GARHOST_NAME) \
	-force-pkg-config
endif

GAR_EXTRA_CONF += devel/gcc/package-api.mk devel/glibc/package-api.mk
include ../../gar.mk

# qt fails to compile with gcc 4.7.2's link time optimization enabled.
CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

PLATFORM_GARBUILD_BASE_NAME = $(strip \
	$(if $(filter i386,$(build_GARCH_FAMILY)),linux-g++-32,) \
	$(if $(filter x86_64,$(build_GARCH_FAMILY)),linux-g++-64,))
PLATFORM_GARHOST_BASE_NAME = $(strip \
	$(if $(filter i386,$(GARCH_FAMILY)),linux-g++-32,) \
	$(if $(filter x86_64,$(GARCH_FAMILY)),linux-g++-64,))
PLATFORM_GARBUILD_NAME      = $(PLATFORM_GARBUILD_BASE_NAME)-garbuild
PLATFORM_GARHOST_NAME       = $(PLATFORM_GARHOST_BASE_NAME)-garhost
PLATFORM_DEFAULT_NAME       = default
PLATFORM_GARBUILD_BASE_PATH = $(WORKSRC)/qtbase/mkspecs/$(PLATFORM_GARBUILD_BASE_NAME)
PLATFORM_GARHOST_BASE_PATH  = $(WORKSRC)/qtbase/mkspecs/$(PLATFORM_GARHOST_BASE_NAME)
PLATFORM_GARBUILD_PATH      = $(WORKSRC)/qtbase/mkspecs/$(PLATFORM_GARBUILD_NAME)
PLATFORM_GARHOST_PATH       = $(WORKSRC)/qtbase/mkspecs/$(PLATFORM_GARHOST_NAME)
PLATFORM_DEFAULT_PATH       = $(DESTDIR)$(qt5prefix)/mkspecs/$(PLATFORM_DEFAULT_NAME)

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
	echo "QMAKE_CFLAGS_RELEASE = $($(strip $(3))CFLAGS)"                                  >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/qmake.conf                   | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/gcc-base.conf      | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/gcc-base-unix.conf | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/g++-base.conf      | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/g++-unix.conf      | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/linux.conf         | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/unix.conf          | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	cat $(strip $(2))/../common/shell-unix.conf    | grep -v '^include' | grep -v '^load' >> $(strip $(2))/qmake.conf~ ; \
	echo 'load(qt_config)'                                                                >> $(strip $(2))/qmake.conf~ ; \
	rm -f $(strip $(2))/qmake.conf ; \
	mv -f $(strip $(2))/qmake.conf~ $(strip $(2))/qmake.conf ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_COPY          , , cp -f --preserve=timestamps) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_YACC          , , bison -y) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_CC            , , $($(strip $(3))CC)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_CXX           , , $($(strip $(3))CXX)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_LINK          , , $($(strip $(3))CXX)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_LINK_SHLIB    , , $($(strip $(3))CXX)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_AR            , , $($(strip $(3))AR) cqs) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_RANLIB        , , $($(strip $(3))RANLIB)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_STRIP         , , $($(strip $(3))STRIP)) ; \
	$(call UPDATE_PLATFORM, $(1), QMAKE_CFLAGS        , , $(call QMAKE_CFLAGS, $(3))) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_CFLAGS_RELEASE,+,) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_LFLAGS        , , $(call QMAKE_LFLAGS, $(3))) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_INCDIR        , , $($(strip $(3))DESTDIR)$($(strip $(3))includedir)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_LIBDIR        , , $($(strip $(3))DESTDIR)$($(strip $(3))libdir)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_INCDIR_X11    , , $($(strip $(3))DESTDIR)$($(strip $(3))includedir)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_LIBDIR_X11    , , $($(strip $(3))DESTDIR)$($(strip $(3))libdir)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_INCDIR_OPENGL , , $($(strip $(3))DESTDIR)$($(strip $(3))includedir)) ; \
	$(call UPDATE_PLATFORM, $(2), QMAKE_LIBDIR_OPENGL , , $($(strip $(3))DESTDIR)$($(strip $(3))libdir))

pre-configure:
	$(call CREATE_PLATFORM, $(PLATFORM_GARBUILD_BASE_PATH), $(PLATFORM_GARBUILD_PATH), build_)
	$(call CREATE_PLATFORM, $(PLATFORM_GARHOST_BASE_PATH) , $(PLATFORM_GARHOST_PATH) ,       )
	@$(MAKECOOKIE)

configure-%/configure:
	@cd $* && $(CONFIGURE_ENV) echo "yes" | ./configure $(CONFIGURE_ARGS)
	@$(MAKECOOKIE)

pre-install:
	@rm -rf $(DESTDIR)$(qt5prefix)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(qt5libdir)/*.la
	@rm -f $(PLATFORM_DEFAULT_PATH)
	@ln -sf $(PLATFORM_GARHOST_NAME) $(PLATFORM_DEFAULT_PATH)
	@$(call GLIBC_ADD_LIB_PATH, $(qt5libdir))
	@files=`ls -1 $(DESTDIR)$(qt5libdir)/pkgconfig/*.pc` ; \
	 for file in $${files} ; do \
		sed -e 's%^prefix=$(DESTDIR)$(qt5prefix)$$%prefix=$(qt5prefix)%g' -i $${file} ; \
		sed -e 's%-I$(DESTDIR)$(includedir)%-I$(includedir)%g'            -i $${file} ; \
		sed -e 's%-L$(DESTDIR)$(libdir)%-L$(libdir)%g'                    -i $${file} ; \
		sed -e 's%-I$(DESTDIR)$(qt5includedir)%-I$(qt5includedir)%g'      -i $${file} ; \
		sed -e 's%-L$(DESTDIR)$(qt5libdir)%-L$(qt5libdir)%g'              -i $${file} ; \
		sed -e 's%-I$(DESTDIR)$(qt5prefix)%-I$(qt5prefix)%g'              -i $${file} ; \
		sed -e 's%-L$(DESTDIR)$(qt5prefix)%-L$(qt5prefix)%g'              -i $${file} ; \
	 done
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
	@rm -rf $(DESTDIR)$(qt5prefix)
