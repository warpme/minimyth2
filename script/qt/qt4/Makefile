GARNAME = qt-everywhere-opensource-src
GARVERSION = 4.8.5
CATEGORIES = qt
MASTER_SITES = http://download.qt-project.org/official_releases/qt/4.8/4.8.5/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = \
	$(DISTNAME).patch.gar
LICENSE = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lang/cxx db/mysql lib/dbus gtk/glib lib/freetype lib/fontconfig lib/libjpeg lib/libmng lib/libpng lib/libtiff lib/openssl devel/zlib xorg/xorg
BUILDDEPS = devel/bison devel/flex

PWD := $(shell pwd)

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = \
	-prefix $(qt4prefix) \
	-prefix-install \
	-bindir $(qt4bindir) \
	-libdir $(qt4libdir) \
	-docdir $(qt4libdir)/doc \
	-headerdir $(qt4includedir) \
	-datadir $(qt4libdir) \
	-translationdir $(qt4libdir)/translations \
	-sysconfdir $(DESTDIR)$(qt4libdir)/settings \
	-examplesdir $(DESTDIR)$(qt4prefix)/examples \
	-demosdir $(DESTDIR)$(qt4prefix)/demos \
	-release \
	-opensource \
	-shared \
	-no-fast \
	-largefile \
	-no-exceptions \
	-no-accessibility \
	-stl \
	-plugin-sql-mysql \
	-qt3support \
	-no-xmlpatterns \
	-multimedia \
	-no-phonon \
	-no-phonon-backend \
	-svg \
	-webkit \
	-javascript-jit \
	-script \
	-scripttools \
	-no-declarative \
	-platform $(PLATFORM_GARBUILD_NAME) \
	-system-zlib \
	-system-libtiff \
	-system-libpng \
	-system-libmng \
	-system-libjpeg \
	-openssl-linked \
	-nomake demos \
	-nomake examples \
	-no-rpath \
	-verbose \
	-no-optimized-qmake \
	-no-nis \
	-no-cups \
	-iconv \
	-no-pch \
	-dbus-linked \
	-separate-debug-info \
	-no-gtkstyle \
	-no-nas-sound \
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
	-hostprefix $(DESTDIR)$(qt4prefix) \
	-force-pkg-config \
	-little-endian
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

# qt 4.8.4 fails to compile with gcc 4.7.2's link time optimization enabled.
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
PLATFORM_GARBUILD_BASE_PATH = $(WORKSRC)/mkspecs/$(PLATFORM_GARBUILD_BASE_NAME)
PLATFORM_GARHOST_BASE_PATH  = $(WORKSRC)/mkspecs/$(PLATFORM_GARHOST_BASE_NAME)
PLATFORM_GARBUILD_PATH      = $(WORKSRC)/mkspecs/$(PLATFORM_GARBUILD_NAME)
PLATFORM_GARHOST_PATH       = $(WORKSRC)/mkspecs/$(PLATFORM_GARHOST_NAME)
PLATFORM_DEFAULT_PATH       = $(DESTDIR)$(qt4prefix)/mkspecs/$(PLATFORM_DEFAULT_NAME)

QMAKE_INCLUDES    = $(filter  -I%, $($(strip $(1))CPPFLAGS))
QMAKE_NONINCLUDES = $(filter-out  -I%, $($(strip $(1))CPPFLAGS))
QMAKE_LIBS        = $(filter  -L%, $($(strip $(1))LDFLAGS))
QMAKE_NONLIBS     = $(filter-out  -L%, $($(strip $(1))LDFLAGS))
QMAKE_CFLAGS      = $(strip $(call QMAKE_INCLUDES, $(1)) $(call QMAKE_LIBS, $(1)) $(filter -m32 -m64,$($(strip $(1))CFLAGS)))
QMAKE_LFLAGS      = $(strip $(call QMAKE_NONLIBS,  $(1)) $(call QMAKE_LIBS, $(1)) $(filter -m32 -m64,$($(strip $(1))CFLAGS)))

UPDATE_PLATFORM   = sed -i 's%^\($(strip $(2))[ \t]*$(strip $(3))=[ \t]*\).*%\1$(strip $(4))%g' $(strip $(1))/qmake.conf 
# We should not need to provide QMAKE_INCDIR or QMAKE_LIBDIR since they are compiled into the compiler and linker.
# However, the QT configure program does not find the supported libraries without them.
# We add --preserve=timestamps to QMAKE_COPY so that files installed using qmake generated make files keep their
# original dates. This keeps the dates of the MythTV themes with their original dates so that themecahes are not
# needlessly regenerated when MiniMyth is updated.
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
	@rm -rf $(DESTDIR)$(qt4prefix)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(qt4libdir)/*.la
	@rm -f $(PLATFORM_DEFAULT_PATH)
	@ln -sf $(PLATFORM_GARHOST_NAME) $(PLATFORM_DEFAULT_PATH)
	@$(call GLIBC_ADD_LIB_PATH, $(qt4libdir))
	@files=`ls -1 $(DESTDIR)$(qt4libdir)/pkgconfig/*.pc` ; \
	 for file in $${files} ; do \
		sed -e 's%^prefix=$(DESTDIR)$(qt4prefix)$$%prefix=$(qt4prefix)%g' -i $${file} ; \
		sed -e 's%-I$(DESTDIR)$(includedir)%-I$(includedir)%g'            -i $${file} ; \
		sed -e 's%-L$(DESTDIR)$(libdir)%-L$(libdir)%g'                    -i $${file} ; \
		sed -e 's%-I$(DESTDIR)$(qt4includedir)%-I$(qt4includedir)%g'      -i $${file} ; \
		sed -e 's%-L$(DESTDIR)$(qt4libdir)%-L$(qt4libdir)%g'              -i $${file} ; \
		sed -e 's%-I$(DESTDIR)$(qt4prefix)%-I$(qt4prefix)%g'              -i $${file} ; \
		sed -e 's%-L$(DESTDIR)$(qt4prefix)%-L$(qt4prefix)%g'              -i $${file} ; \
	 done
	@$(MAKECOOKIE)

clean-all:
	@$(MAKE) clean
	@rm -rf $(DESTDIR)$(qt4prefix)
