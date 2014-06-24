# Include AFTER gar.lib.mk

include ../../extras/extras.conf.mk

versiondir := $(extras_versiondir)
licensedir := $(extras_licensedir)

CPPFLAGS := -I$(DESTDIR)$(extras_includedir) $(CPPFLAGS)
CFLAGS   := -I$(DESTDIR)$(extras_includedir) $(CFLAGS)
CFLAGS   := -L$(DESTDIR)$(extras_libdir)     $(CFLAGS)
LDFLAGS  := -L$(DESTDIR)$(extras_libdir)     $(LDFLAGS)

# Change TMP_DIRPATHS so that DIRPATHS will use extras directories.
TMP_DIRPATHS := \
	--prefix=$(extras_prefix) \
	--exec_prefix=$(extras_exec_prefix) \
	--bindir=$(extras_bindir) \
	--sbindir=$(extras_sbindir) \
	--libexecdir=$(extras_libexecdir) \
	--datadir=$(extras_datadir) \
	--sysconfdir=$(extras_sysconfdir) \
	--sharedstatedir=$(extras_sharedstatedir) \
	--localstatedir=$(extras_localstatedir) \
	--libdir=$(extras_libdir) \
	--infodir=$(extras_infodir) \
	--includedir=$(extras_includedir) \
	--oldincludedir=$(extras_oldincludedir) \
	--mandir=$(extras_mandir)

# Change STAGE_EXPORTS so that it does not include directories.
STAGE_EXPROTS :=
STAGE_EXPORTS += CC CXX LD CPP AR AS NM RANLIB STRIP OBJCOPY OBJDUMP

INSTALL_SCRIPTS := install-extrasdirs $(INSTALL_SCRIPTS)

install-extrasdirs:
	@mkdir -p $(extras_rootdir)
	@mkdir -p $(extras_prefix)
	@mkdir -p $(extras_exec_prefix)
	@mkdir -p $(extras_ebindir)
	@mkdir -p $(extras_esbindir)
	@mkdir -p $(extras_elibdir)
	@mkdir -p $(extras_sysconfdir)
	@mkdir -p $(extras_localstatedir)
	@mkdir -p $(extras_bindir)
	@mkdir -p $(extras_sbindir)
	@mkdir -p $(extras_libexecdir)
	@mkdir -p $(extras_datadir)
	@mkdir -p $(extras_sharedstatedir)
	@mkdir -p $(extras_libdir)
	@mkdir -p $(extras_infodir)
	@mkdir -p $(extras_lispdir)
	@mkdir -p $(extras_includedir)
	@mkdir -p $(extras_oldincludedir)
	@mkdir -p $(extras_mandir)
	@mkdir -p $(extras_docdir)
	@mkdir -p $(extras_sourcedir)
	@mkdir -p $(extras_versiondir)
	@mkdir -p $(extras_licensedir)
	@$(MAKECOOKIE)
