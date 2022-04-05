
MYTHTV_GARVERSION_SHORT = master
MYTHTV_SVN_VERSION      = 20220404-ge7a9d48089
MYTHTV_GIT_VERSION      = v33-Pre-193-ge7a9d48089
MYTHTV_GIT_HASH         = e7a9d48089e67cac1f6f36b9fc282bf9ce5f2d03

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
