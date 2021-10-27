
MYTHTV_GARVERSION_SHORT = master
MYTHTV_SVN_VERSION      = 20211025-g0374b68ac8
MYTHTV_GIT_VERSION      = v32-Pre-2914-g0374b68ac8
MYTHTV_GIT_HASH         = 0374b68ac874483311416f76a758d18546c575c9

MYTHTV_VERSION = $(MYTHTV_GARVERSION_SHORT)-$(MYTHTV_SVN_VERSION)

MYTHTV_SOURCEDIR = $(sourcedir)/mythtv

MYTHTV_CONFIGURE_ENV = \
	PYTHONXCPREFIX=$(DESTDIR)$(prefix)
MYTHTV_BUILD_ENV     =
MYTHTV_INSTALL_ENV   = \
	INSTALL_ROOT="/" \

MYTHTV_PLUGINS_CONFIGURE_ARGS = \
	--prefix="$(DESTDIR)$(prefix)" \
	--sysroot="$(DESTDIR)$(rootdir)" \
	--qmake="$(qtqmake)" \
	--libdir-name="$(patsubst $(prefix)/%,%,$(libdir))" \
	--disable-all \
	--enable-opengl \
	--enable-cross-compile \

post-install-mythtv-version:
	@install -d $(DESTDIR)$(versiondir) 
	@echo "branch $(MYTHTV_GARVERSION_SHORT) through GIT $(MYTHTV_SVN_VERSION)" > $(DESTDIR)$(versiondir)/$(GARNAME)
	@$(MAKECOOKIE)
