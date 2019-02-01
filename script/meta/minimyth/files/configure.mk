GARNAME    ?= minimyth
GARVERSION ?= $(mm_VERSION)

all: mm-all

GAR_EXTRA_CONF += kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk perl/perl/package-api.mk python/python/package-api.mk
include ../../gar.mk

MM_INIT_START_SEQUENTIAL := \
    time \
    hotplug \
    dbus \
    master \
    audio \
    video \
    mythtv \
    lirc \
    lcdproc \
    font \
    x \
    conf_parallel
MM_INIT_START_PARALLEL := \
    media \
    irtrans \
    acpi \
    web \
    extras \
    game \
    cpu \
    telnet \
    ssh_server \
    avahi \
    mail \
    voip \
    browsers \
    updates \
    mythdb_buffer_delete
MM_INIT_KILL := \
    x \
    avahi \
    lcdproc \
    dbus \
    lirc \
    irtrans \
    audio \
    web \
    time \
    acpi \
    game \
    ssh_server \
    telnet \
    media \
    cpu \
    log \
    modules_manual \
    modules_automatic

build_vars := $(filter-out mm_HOME mm_TFTP_ROOT mm_NFS_ROOT mm_SHARE_FILES mm_SDCARD_FILES,$(sort $(shell cat $(mm_HOME)/script/minimyth.conf.mk | grep -e '^mm_' | sed -e 's%[ =].*%%')))

#	$(if $(filter 0.28 29 30 master,$(mm_MYTH_VERSION)), $(qt5bindir)) \
#	$(if $(filter 0.28 29 30 master,$(mm_MYTH_VERSION)), $(qt5libdir)) \

bindirs_base := \
	$(extras_sbindir) \
	$(extras_bindir) \
	$(esbindir) \
	$(ebindir) \
	$(sbindir) \
	$(bindir) \
	$(libexecdir) \
	$(if $(filter 0.27,$(mm_MYTH_VERSION)), $(qt4bindir), $(qt5bindir)) \
	$(kdebindir)
bindirs := \
	$(bindirs_base) \
	$(libexecdir)
libdirs_base := \
	$(extras_libdir) \
	$(elibdir64) \
	$(elibdir) \
	$(libdir) \
	$(libexecdir) \
	$(libdir)/mysql \
	$(if $(filter $(mm_GRAPHICS),radeon),$(libdir)/vdpau) \
	$(if $(filter 0.27,$(mm_MYTH_VERSION)), $(qt4libdir), $(qt5libdir)) \
	$(kdelibdir)
libdirs := \
	$(libdirs_base) \
	$(libdir)/xorg/modules \
	$(if $(filter $(mm_GRAPHICS),nvidia),$(libdir)/nvidia)
etcdirs := \
	$(extras_sysconfdir) \
	$(sysconfdir)
sharedirs := \
	$(extras_datadir) \
	$(datadir) \
	$(kdedatadir)

MM_CONFIG_VARS := $(sort \
	bindir \
	bindirs \
	bindirs_base \
	build_bindir \
	build_DESTDIR \
	build_licensedir \
	build_rootdir \
	build_system_bins \
	build_vars \
	$(build_vars) \
	build_versiondir \
	datadir \
	DESTDIR \
	DESTIMG \
	ebindir \
	elibdir64 \
	elibdir \
	esbindir \
	etcdirs \
	extras_licensedir \
	extras_rootdir \
	extras_versiondir \
	libdir \
	libdirs \
	libdirs_base \
	licensedir \
	LINUX_DIR \
	LINUX_FULL_VERSION \
	LINUX_MODULESDIR \
	mm_CONF_VERSION \
	mm_DEBUG \
	mm_DEBUG_BUILD \
	mm_DESTDIR \
	mm_DISTRIBUTION_SDCARD \
	mm_DISTRIBUTION_NFS \
	mm_DISTRIBUTION_RAM \
	mm_DISTRIBUTION_SHARE \
	mm_GRAPHICS \
	mm_OPENGL_PROVIDER \
	mm_HOME \
	MM_INIT_KILL \
	MM_INIT_START_SEQUENTIAL \
	MM_INIT_START_PARALLEL \
	mm_SDCARD_FILES \
	mm_INSTALL_NFS_BOOT \
	mm_INSTALL_RAM_BOOT \
	mm_MYTH_VERSION \
	mm_NFS_ROOT \
	mm_SOFTWARE \
	mm_TFTP_ROOT \
	mm_SHARE_FILES \
	mm_USER_BIN_LIST \
	mm_USER_ETC_LIST \
	mm_USER_LIB_LIST \
	mm_USER_REMOVE_LIST \
	mm_USER_SHARE_LIST \
	mm_VERSION_MINIMYTH \
	mm_VERSION_MYTH \
	mm_VERSION \
	OBJDUMP \
	PERL_libdir \
	PYTHON_libdir \
	qt4prefix \
	qt5prefix \
	rootdir \
	sharedirs \
	sourcedir \
	STRIP \
	sysconfdir \
	versiondir )

mm-all: $(WORKSRC)/build/config.mk

$(WORKSRC)/build/config.mk:
	@mkdir -p $(dir $@)
	@rm -rf $@~
	@$(foreach var,$(MM_CONFIG_VARS), echo $(var) = $($(var)) >> $@~ ; )
	@if [ -e $@ ] ; then \
		diff -q $@ $@~ 2>&1 > /dev/null ; \
		if [ $$? -ne 0 ] ; then \
			rm -rf $@ ; \
		fi ; \
	fi
	@if [ ! -e $@ ] ; then \
		cp -f $@~ $@ ; \
	fi
	@rm -f $@~

.PHONY: all mm-all
