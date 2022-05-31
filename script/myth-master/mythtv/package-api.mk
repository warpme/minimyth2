
MYTHTV_GARVERSION_SHORT = master
MYTHTV_SVN_VERSION      = 20220531-g419f8af381
MYTHTV_GIT_VERSION      = v33-Pre-409-g419f8af381
MYTHTV_GIT_HASH         = 419f8af3819599027688d71b4d56007dbf860f43

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
