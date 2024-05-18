GARNAME    ?= minimyth
GARVERSION ?= $(mm_VERSION)

all: mm-all

GAR_EXTRA_CONF += \
	kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk \
	perl/perl/package-api.mk \
	$(if $(filter py2,$(mm_PYTHON_VERSION)),python2/python/package-api.mk) \
	$(if $(filter py3,$(mm_PYTHON_VERSION)),python3/python/package-api.mk) \

include ../../gar.mk
include ../../myth-$(mm_MYTH_VERSION)/mythtv/package-api.mk

# List of scripta defined in MM_INIT_START_PHASE_X
# is executed when all scripts defined in MM_INIT_START_PHASE_X-1
# end successfuly
MM_INIT_START_PHASE_1 := \
    time     \
    hotplug  \
    master   \
    defaults \
    video    \
    audio    \
    mythtv   \
    lcdproc  \
    font     \
    avahi    \

MM_INIT_START_PHASE_2 := 

MM_INIT_START_PHASE_3 := \
    frontend

MM_INIT_START_PHASE_4 := \
    lirc         \
    bluetooth    \
    conf_phase_5 \

MM_INIT_START_PHASE_5 := \
    userleds     \
    localization \
    media        \
    irtrans      \
    acpi         \
    web          \
    extras       \
    game         \
    cpu          \
    swap         \
    telnet       \
    ssh_server   \
    kmsvnc       \
    mail         \
    voip         \
    standby      \
    browsers     \
    updates      \
    cache_pruner \
    monitorix    \
    housekeep    \
    mythdb_buffer_delete \

MM_INIT_KILL := \
    frontend    \
    bluetooth   \
    standby     \
    frontend    \
    mythtv      \
    avahi       \
    lcdproc     \
    dbus        \
    lirc        \
    irtrans     \
    audio       \
    web         \
    time        \
    acpi        \
    game        \
    ssh_server  \
    telnet      \
    media       \
    wlan        \
    swap        \
    cpu         \
    log         \
    modules_manual    \
    modules_automatic \

build_vars := $(filter-out mm_HOME mm_TFTP_ROOT mm_NFS_ROOT mm_SHARE_FILES mm_SDCARD_FILES,$(sort $(shell cat $(mm_HOME)/script/minimyth.conf.mk | grep -e '^mm_' | sed -e 's%[ =].*%%')))

bindirs_base := \
	$(extras_sbindir) \
	$(extras_bindir) \
	$(esbindir) \
	$(ebindir) \
	$(sbindir) \
	$(bindir) \
	$(libexecdir) \
	$(if $(filter qt4,$(mm_QT_VERSION)), $(qt4bindir),) \
	$(if $(filter qt5,$(mm_QT_VERSION)), $(qt5bindir),) \
	$(if $(filter qt6,$(mm_QT_VERSION)), $(qt6bindir),) \
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
	$(if $(filter qt4,$(mm_QT_VERSION)), $(qt4libdir),) \
	$(if $(filter qt5,$(mm_QT_VERSION)), $(qt5libdir),) \
	$(if $(filter qt6,$(mm_QT_VERSION)), $(qt6libdir),) \
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
	mm_STRIP_IMAGE \
	mm_DESTDIR \
	mm_DISTRIBUTION_SDCARD \
	mm_DISTRIBUTION_NFS \
	mm_DISTRIBUTION_RAM \
	mm_DISTRIBUTION_SHARE \
	mm_GRAPHICS \
	mm_OPENGL_PROVIDER \
	mm_QT_VERSION \
	mm_PYTHON_VERSION \
	mm_SHELL \
	mm_HOME \
	MM_INIT_KILL \
	MM_INIT_START_PHASE_1 \
	MM_INIT_START_PHASE_2 \
	MM_INIT_START_PHASE_3 \
	MM_INIT_START_PHASE_4 \
	MM_INIT_START_PHASE_5 \
	mm_SDCARD_FILES \
	mm_INSTALL_NFS_BOOT \
	mm_INSTALL_RAM_BOOT \
	mm_INSTALL_ONLINE_UPDATES \
	mm_ONLINE_UPDATES \
	mm_MINIMYTH_ONLINE_UPDATES_URL \
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
	MYTHTV_GIT_VERSION \
	OBJDUMP \
	PERL_libdir \
	PYTHON_libdir \
	qt4prefix \
	qt5prefix \
	qt6prefix \
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
