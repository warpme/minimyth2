
top        = ../
top_source = ./
top_build  = ../build/

top        := $(shell cd $(top)        ; pwd)
top_source := $(shell cd $(top_source) ; pwd)
top_build  := $(shell cd $(top_build)  ; pwd)

cookiedir  := $(top_build)/cookie

include $(top_build)/config.mk

mm_NAME := minimyth2-$(mm_VERSION)
MYTHTV_SVN_VERSION = $(shell grep "MYTHTV_SVN_VERSION =" $(mm_HOME)/script/myth-$(mm_VERSION_MYTH)/mythtv/package-api.mk | sed -e "s/MYTHTV_SVN_VERSION =\s*//")

MM_LIST_FILES    = $(strip \
	$(if $(wildcard lists/base-$(strip $(2))/minimyth-$(strip $(1))-list), \
                        lists/base-$(strip $(2))/minimyth-$(strip $(1))-list ) \
	$(if $(wildcard lists/kernel-$(strip $(2))/minimyth-$(strip $(1))-list-$(strip $(3))), \
                        lists/kernel-$(strip $(2))/minimyth-$(strip $(1))-list-$(strip $(3)) ) \
	$(if $(wildcard lists/extras/extras-$(strip $(1))-list), \
                        lists/extras/extras-$(strip $(1))-list ) \
	$(filter $(patsubst %,lists/graphics/minimyth-$(strip $(1))-list.%,$(mm_GRAPHICS)), \
                 $(wildcard   lists/graphics/minimyth-$(strip $(1))-list.*               )) \
	$(filter $(patsubst %,lists/software/minimyth-$(strip $(1))-list.%,$(mm_SOFTWARE)), \
                 $(wildcard   lists/software/minimyth-$(strip $(1))-list.*               )) \
	$(filter $(patsubst %,lists/software/minimyth-$(strip $(1))-list.%:$(mm_MYTH_VERSION),$(mm_SOFTWARE)), \
                 $(wildcard   lists/software/minimyth-$(strip $(1))-list.*:$(mm_MYTH_VERSION)              )))
MM_BIN_FILES    := $(call MM_LIST_FILES, bin,    $(mm_GARCH_FAMILY), $(mm_KERNEL_VERSION))
MM_LIB_FILES    := $(call MM_LIST_FILES, lib,    $(mm_GARCH_FAMILY), $(mm_KERNEL_VERSION))
MM_ETC_FILES    := $(call MM_LIST_FILES, etc,    $(mm_GARCH_FAMILY), $(mm_KERNEL_VERSION))
MM_SHARE_FILES  := $(call MM_LIST_FILES, share,  $(mm_GARCH_FAMILY), $(mm_KERNEL_VERSION))
MM_REMOVE_FILES := $(call MM_LIST_FILES, remove, $(mm_GARCH_FAMILY), $(mm_KERNEL_VERSION))

MM_BIN_DEBUG    := $(strip $(if $(filter yes,$(mm_DEBUG)), \
	gdb \
	strace \
	xdpyinfo \
	))
MM_LIB_DEBUG    := $(strip $(if $(filter yes,$(mm_DEBUG)), \
	))
MM_ETC_DEBUG    := $(strip $(if $(filter yes,$(mm_DEBUG)), \
	))
MM_SHARE_DEBUG  := $(strip $(if $(filter yes,$(mm_DEBUG)), \
	))
MM_REMOVE_DEBUG := $(strip $(if $(filter yes,$(mm_DEBUG)), \
	))

MM_BINS    := $(sort $(if $(MM_BIN_FILES),    $(shell cat $(MM_BIN_FILES)    | sed 's%[ \t]*\#.*%%')) $(MM_BIN_DEBUG)    $(mm_USER_BIN_LIST))
MM_LIBS    := $(sort $(if $(MM_LIB_FILES),    $(shell cat $(MM_LIB_FILES)    | sed 's%[ \t]*\#.*%%')) $(MM_LIB_DEBUG)    $(mm_USER_LIB_LIST))
MM_ETCS    := $(sort $(if $(MM_ETC_FILES),    $(shell cat $(MM_ETC_FILES)    | sed 's%[ \t]*\#.*%%')) $(MM_ETC_DEBUG)    $(mm_USER_ETC_LIST))
MM_SHARES  := $(sort $(if $(MM_SHARE_FILES),  $(shell cat $(MM_SHARE_FILES)  | sed 's%[ \t]*\#.*%%')) $(MM_SHARE_DEBUG)  $(mm_USER_SHARE_LIST))
MM_REMOVES := $(sort $(if $(MM_REMOVE_FILES), $(shell cat $(MM_REMOVE_FILES) | sed 's%[ \t]*\#.*%%')) $(MM_REMOVE_DEBUG) $(mm_USER_REMOVE_LIST))

MAKE_PATH = \
	$(patsubst @%@,%,$(subst @ @,:, $(strip $(patsubst %,@%@,$(1)))))

DIRSTODOTS = \
	$(subst . /,./,$(patsubst %,/..,$(subst /, ,/$(1))))

# $1 = file type label plural.
# $2 = file type label singular.
# $3 = source destdir.
# $4 = target destdir.
# $5 = file directories.
# $6 = files.
COPY_FILES = \
	echo "copying $(strip $(1))" ; \
	for dir in $(strip $(5)) ; do \
		mkdir -p $(strip $(4))/$${dir} ; \
	done ; \
	for file_item in $(strip $(6)) ; do \
		found="" ; \
		for dir in $(strip $(5)) ; do \
			file_list="" ; \
			if [ -e $(3)/$${dir} ] ; then \
				if echo $${file_item} | grep -q -e '/$$' > /dev/null 2>&1 ; then \
					file_list=`cd $(3)/$${dir} ; find -L $${file_item} -maxdepth 0 -type d 2> /dev/null` ; \
				else \
					file_list=`cd $(3)/$${dir} ; find -L $${file_item} -maxdepth 0 -type f 2> /dev/null` ; \
				fi; \
			fi ; \
			for file in $${file_list} ; do \
				if [ -e $(3)/$${dir}/$${file} ] ; then \
					found="true" ; \
					source_file="$(3)/$${dir}/$${file}" ; \
					target_file="$(strip $(4))/$${dir}/$${file}" ; \
					if [ ! -e $${target_file} ] ; then \
						cp_flags=""                ; \
						cp_flags="$${cp_flags} -p" ; \
						file -L $${source_file} | grep -i -q 'ELF ..-bit LSB shared object' ; \
						if [ $$? -ne 0 ] ; then \
							cp_flags="$${cp_flags} -d" ; \
						fi ; \
						if [ -d $${source_file} ] ; then \
							cp_flags="$${cp_flags} -R" ; \
						fi ; \
						target_dir=`dirname $${target_file}` ; \
						mkdir -p $${target_dir} ; \
						cp $${cp_flags} $${source_file} $${target_file} ; \
						while file $${target_file} | grep -i -q 'symbolic link to' ; do \
							link="`file $${source_file} | \
								sed -e 's%^.* %%' -e 's%^.%%' -e 's%.$$%%'`" ; \
							source_file="`dirname $${source_file}`/$${link}" ; \
							target_file="`dirname $${target_file}`/$${link}" ; \
							if [ ! -e $${source_file} ] ; then \
								echo "error: $${source_file} not found." ; \
								exit 1 ; \
							fi ; \
							if [ ! -e $${target_file} ] ; then \
								target_dir=`dirname $${target_file}` ; \
								mkdir -p $${target_dir} ; \
								cp $${cp_flags} $${source_file} $${target_file} ; \
								chmod -R u+w $${target_file} ; \
							fi ; \
						done ; \
						chmod -R u+w $${target_file} ; \
					fi ; \
				fi ; \
			done ; \
		done ; \
		if [ -z $${found} ] ; then \
			echo "copying $(strip $(1)): warning: $(strip $(2)) \"$${file_item}\" not found." ; \
		fi ; \
	done

# $1 = file/directory
SET_PERMISSIONS = \
	chmod -R -s   $(strip $(1))                                                   ; \
	chmod -R -t   $(strip $(1))                                                   ; \
	chmod -R +r   $(strip $(1))                                                   ; \
	chmod -R u+w  $(strip $(1))                                                   ; \
	chmod -R go-w $(strip $(1))                                                   ; \
	find          $(strip $(1)) -depth -type d             -exec chmod +x '{}' \; ; \
	find          $(strip $(1)) -depth -type f -perm /0100 -exec chmod +x '{}' \;

all: build

build: \
	$(if $(filter yes,$(mm_DISTRIBUTION_SHARE)),$(top_build)/share) \
	$(if $(filter yes,$(mm_DISTRIBUTION_RAM)),  $(top_build)/stage/ram-$(mm_GARCH_FAMILY)-$(mm_NAME).tar.bz2)     \
	$(if $(filter yes,$(mm_DISTRIBUTION_RAM)),  $(top_build)/stage/ram-$(mm_GARCH_FAMILY)-$(mm_NAME).tar.bz2.md5) \
	$(if $(filter yes,$(mm_DISTRIBUTION_NFS)),  $(top_build)/stage/nfs-$(mm_GARCH_FAMILY)-$(mm_NAME).tar.bz2)     \
	$(if $(filter yes,$(mm_DISTRIBUTION_NFS)),  $(top_build)/stage/nfs-$(mm_GARCH_FAMILY)-$(mm_NAME).tar.bz2.md5) \
	$(if $(filter i386,$(mm_GARCH_FAMILY)),     $(top_build)/stage/kernel)                                        \
	$(if $(filter x86_64,$(mm_GARCH_FAMILY)),   $(top_build)/stage/kernel)                                        \
	$(top_build)/stage/boot                                                                                       \
	$(top_build)/stage/image/rootfs                                                                               \
	$(top_build)/stage/image/rootfs.fakeroot                                                                      \
	$(top_build)/stage/version                                                                                    \
	$(top_build)/stage/gar-$(mm_NAME).tar.bz2                                                                     \
	$(top_build)/stage/gar-$(mm_NAME).tar.bz2.md5

$(top_build)/image/rootfs: $(build_DESTDIR)$(build_rootdir) $(DESTDIR)$(rootdir) $(top_source) $(top_build)/stage/html
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@mkdir -m 0755 -p $@~
	@# Make home directory for user 'root'.
	@mkdir -p $@~/root
	@# Copy versions.
	@mkdir -p $@~$(versiondir)-build
	@cp -pdR $(build_DESTDIR)$(build_versiondir)/* $@~$(versiondir)-build
	@mkdir -p $@~$(versiondir)
	@cp -pdR $(DESTDIR)$(versiondir)/* $@~$(versiondir)
	@rm -rf $@~$(versiondir)/minimyth
	@mkdir -p $@~$(extras_versiondir)
	@cp -pdR $(DESTDIR)$(extras_versiondir)/* $@~$(extras_versiondir)
	@# Copy licenses.
	@mkdir -p $@~$(licensedir)-build
	@cp -pdR $(build_DESTDIR)$(build_licensedir)/* $@~$(licensedir)-build
	@mkdir -p $@~$(licensedir)
	@cp -pdR $(DESTDIR)$(licensedir)/* $@~$(licensedir)
	@rm -rf $@~$(licensedir)/minimyth
	@mkdir -p $@~$(extras_licensedir)
	@cp -pdR $(DESTDIR)$(extras_licensedir)/* $@~$(extras_licensedir)
	@# Install busybox.
	@echo "installing busybox"
	@cp -pdr $(mm_HOME)/script/utils/busybox/work/main.d/busybox-bins/* $@~
	@rm -rf $@~/var
	@# Copy binaries.
	@$(call COPY_FILES, "binaries", "binary", $(DESTDIR), $@~, $(bindirs), $(MM_BINS))
	@# Copy etcs.
	@$(call COPY_FILES, "etcs", "etc", $(DESTDIR), $@~, $(etcdirs), $(MM_ETCS))
	@# Copy libraries.
	@$(call COPY_FILES, "libraries", "library", $(DESTDIR), $@~, $(libdirs), $(MM_LIBS))
	@# Copy shares.
	@$(call COPY_FILES, "shares", "share", $(DESTDIR), $@~, $(sharedirs), $(MM_SHARES))
	@# Copy the QT plugins needed by MythTV.
	@if [ $(mm_QT_VERSION) = "4" ] ; then \
		rm -rf   $@~$(qt4prefix)/plugins                                                 ; \
		mkdir -p $@~$(qt4prefix)/plugins                                                 ; \
		cp -pdR $(DESTDIR)$(qt4prefix)/plugins/graphicssystems   $@~$(qt4prefix)/plugins ; \
		cp -pdR $(DESTDIR)$(qt4prefix)/plugins/iconengines       $@~$(qt4prefix)/plugins ; \
		cp -pdR $(DESTDIR)$(qt4prefix)/plugins/imageformats      $@~$(qt4prefix)/plugins ; \
		cp -pdR $(DESTDIR)$(qt4prefix)/plugins/sqldrivers        $@~$(qt4prefix)/plugins ; \
	 elif [ $(mm_QT_VERSION) = "6" ] ; then                                                    \
		rm -rf   $@~$(qt6prefix)/plugins                                                 ; \
		mkdir -p $@~$(qt6prefix)/plugins                                                 ; \
		cp -pdR  $(DESTDIR)$(qt6prefix)/plugins/platforms        $@~$(qt6prefix)/plugins ; \
		cp -pdR  $(DESTDIR)$(qt6prefix)/plugins/iconengines      $@~$(qt6prefix)/plugins ; \
		cp -pdR  $(DESTDIR)$(qt6prefix)/plugins/imageformats     $@~$(qt6prefix)/plugins ; \
		cp -pdR  $(DESTDIR)$(qt6prefix)/plugins/sqldrivers       $@~$(qt6prefix)/plugins ; \
		if [ -e $(DESTDIR)$(qt6prefix)/plugins/xcbglintegrations ] ; then                                  \
			cp -pdR $(DESTDIR)$(qt6prefix)/plugins/xcbglintegrations $@~$(qt6prefix)/plugins         ; \
		fi                                                                                               ; \
		if [ -e $(DESTDIR)$(qt6prefix)/plugins/egldeviceintegrations ] ; then                              \
			cp -pdR $(DESTDIR)$(qt6prefix)/plugins/egldeviceintegrations $@~$(qt6prefix)/plugins     ; \
		fi                                                                                               ; \
		if [ -e $(DESTDIR)$(qt6prefix)/plugins/platforminputcontexts ] ; then                              \
			cp -pdR $(DESTDIR)$(qt6prefix)/plugins/platforminputcontexts $@~$(qt6prefix)/plugins     ; \
		fi                                                                                               ; \
		if [ -e $(DESTDIR)$(qt6prefix)/plugins/wayland-shell-integration ] ; then                          \
			cp -pdR $(DESTDIR)$(qt6prefix)/plugins/wayland-shell-integration $@~$(qt6prefix)/plugins ; \
		fi                                                                               ; \
	 else                                                                                      \
		rm -rf   $@~$(qt5prefix)/plugins                                                 ; \
		mkdir -p $@~$(qt5prefix)/plugins                                                 ; \
		cp -pdR  $(DESTDIR)$(qt5prefix)/plugins/platforms        $@~$(qt5prefix)/plugins ; \
		cp -pdR  $(DESTDIR)$(qt5prefix)/plugins/iconengines      $@~$(qt5prefix)/plugins ; \
		cp -pdR  $(DESTDIR)$(qt5prefix)/plugins/imageformats     $@~$(qt5prefix)/plugins ; \
		cp -pdR  $(DESTDIR)$(qt5prefix)/plugins/sqldrivers       $@~$(qt5prefix)/plugins ; \
		if [ -e $(DESTDIR)$(qt5prefix)/plugins/xcbglintegrations ] ; then                  \
			cp -pdR $(DESTDIR)$(qt5prefix)/plugins/xcbglintegrations $@~$(qt5prefix)/plugins         ; \
		fi                                                                                               ; \
		if [ -e $(DESTDIR)$(qt5prefix)/plugins/egldeviceintegrations ] ; then                              \
			cp -pdR $(DESTDIR)$(qt5prefix)/plugins/egldeviceintegrations $@~$(qt5prefix)/plugins     ; \
		fi                                                                                               ; \
		if [ -e $(DESTDIR)$(qt5prefix)/plugins/platforminputcontexts ] ; then                              \
			cp -pdR $(DESTDIR)$(qt5prefix)/plugins/platforminputcontexts $@~$(qt5prefix)/plugins     ; \
		fi                                                                                               ; \
		if [ -e $(DESTDIR)$(qt5prefix)/plugins/wayland-shell-integration ] ; then                          \
			cp -pdR $(DESTDIR)$(qt5prefix)/plugins/wayland-shell-integration $@~$(qt5prefix)/plugins ; \
		fi                                                                                               ; \
	 fi
	@# adding supported video HW list
	@mkdir -m 0755 -p $@~/srv/www
	@cp -pd $(top_build)/stage/supported-gfx-hardware.txt $@~/srv/www/document-supported-gfx-hardware.txt
	@# adding supported IR remotes list
	@cp -pd $(top_build)/stage/supported-IR-remotes.txt $@~/srv/www/document-supported-IR-remotes.txt
	@# Copy source HTML files
	@find $(top_source)/html -depth -type d \
		| sed -e 's%^\$(top_source)/html%$@~/srv/www%' \
		| xargs -n 1 mkdir -m 0755 -p
	@find $(top_source)/html -depth -type f \
		| sed -e 's%^\(\$(top_source)/html\)/\(.*\)$$%\1/\2 $@~/srv/www/\2%' \
		| xargs -n 2 cp -fpd
	@rm -rf $@~/srv/www/download
	@rm -rf $@~/srv/www/error
	@rm -rf $@~/srv/www/robots.txt
	@# Copy package rootfs files.
	@find $(top_source)/rootfs -depth -type d \
		| sed -e 's%^\$(top_source)/rootfs%$@~%' \
		| xargs -n 1 mkdir -m 0755 -p
	@find $(top_source)/rootfs -depth -type f \
		| sed -e 's%^\(\$(top_source)/rootfs\)/\(.*\)$$%\1/\2 $@~/\2%' \
		| xargs -n 2 cp -fpd
	@# Substitute values for variables in files
	@sed -i 's%@MM_VERSION@%$(mm_VERSION)%g'                    $@~$(sysconfdir)/conf.d/core
	@sed -i 's%@MM_VERSION_MYTH@%$(mm_VERSION_MYTH)%g'          $@~$(sysconfdir)/conf.d/core
	@sed -i 's%@MM_VERSION_MINIMYTH@%$(mm_VERSION_MINIMYTH)%g'  $@~$(sysconfdir)/conf.d/core
	@sed -i 's%@MM_CONF_VERSION@%$(mm_CONF_VERSION)%g'          $@~$(sysconfdir)/conf.d/core
	@sed -i 's%@PATH@%$(call MAKE_PATH,$(bindirs_base))%g'      $@~$(sysconfdir)/conf.d/core
	@sed -i 's%@GAR_datadir@%$(datadir)%g'                      $@~$(sysconfdir)/fonts/local.conf
	@sed -i 's%@EXTRAS_ROOTDIR@%$(extras_rootdir)%'             $@~$(sysconfdir)/rc.d/init.d/extras
	@sed -i 's%@EXTRAS_ROOTDIR@%$(extras_rootdir)%'             $@~$(sysconfdir)/rc.d/init.d/media
	@sed -i 's%@ARCH@%$(mm_GARCH_FAMILY)%'                      $@~$(sysconfdir)/rc.d/init.d/conf.d/S_MINIMYTH
	@sed -i 's%@BRANCH@%$(mm_MYTH_VERSION)%'                    $@~$(sysconfdir)/rc.d/init.d/conf.d/S_MINIMYTH
	@sed -i 's%@MM_VERSION_MINIMYTH@%$(mm_VERSION_MINIMYTH)%g'  $@~$(sysconfdir)/splash/minimyth/*.cfg
	@sed -i 's%@MM_VERSION_MINIMYTH@%$(mm_VERSION_MINIMYTH)%g'  $@~/etc/os_myth_release
	@sed -i 's%@MYTHTV_SVN_VERSION@%$(MYTHTV_SVN_VERSION)%g'    $@~/etc/os_myth_release
	@sed -i 's%@MM_GARCH@%$(mm_GARCH_FAMILY)%g'                 $@~/etc/os_myth_release
	@sed -i 's%@MM_VERSION@%$(mm_VERSION)-$(mm_GARCH_FAMILY)%g' $@~/etc/version
	@sed -i 's%@MM_HOME@%$(mm_HOME)%g'                          $@~/usr/bin/devel-update-component.sh
	@MM_DEVEL_HOST_IP="$(shell /bin/hostname -i | sed -e 's/\s//g')"; sed -i "s%@MM_DEVEL_IP@%$$MM_DEVEL_HOST_IP%g" $@~/usr/bin/devel-update-component.sh
ifneq (,$(findstring rpi,$(mm_KERNEL_VERSION)))
	@sed -i 's%    # mm_splash_init%    mm_splash_init%'        $@~$(sysconfdir)/rc.d/init.d/modules_automatic
endif
	@# Adding updated HTML index.html file
	@cp -pd $(top_build)/stage/html/index.html $@~/srv/www/index.html
	@# Create the minimyth build configuration file.
	@rm -rf   $@~$(versiondir)/minimyth.conf.mk
	@mkdir -m 0755 -p $@~$(versiondir)
	@$(foreach build_var,$(build_vars), \
		echo "$(build_var)='$(strip $($(build_var)))'" >> $@~$(versiondir)/minimyth.conf.mk ; )
	@# Create the loader configuration file.
	@rm -f $@~$(sysconfdir)/ld.so.conf
	@$(foreach dir, $(libdirs_base), \
		echo $(dir) >> $@~$(sysconfdir)/ld.so.conf ; )
	@rm -f $@~$(sysconfdir)/ld.so.cache{,~}
	@# Make documentation links.
	@mkdir -m 0755 -p $@~/srv/www/software/base
	@ln -sf $(patsubst /%,%,$(call DIRSTODOTS,/srv/www/software/base))$(versiondir) \
	        $@~/srv/www/software/base/versions
	@ln -sf $(patsubst /%,%,$(call DIRSTODOTS,/srv/www/software/base))$(licensedir) \
	        $@~/srv/www/software/base/licenses
	@mkdir -m 0755 -p $@~/srv/www/software/extras
	@ln -sf $(patsubst /%,%,$(call DIRSTODOTS,/srv/www/software/extras))$(extras_versiondir) \
	        $@~/srv/www/software/extras/versions
	@ln -sf $(patsubst /%,%,$(call DIRSTODOTS,/srv/www/software/extras))$(extras_licensedir) \
	        $@~/srv/www/software/extras/licenses
	@mkdir -m 0755 -p $@~/srv/www/software/build
	@ln -sf $(patsubst /%,%,$(call DIRSTODOTS,/srv/www/software/versions))$(versiondir)-build \
	        $@~/srv/www/software/build/versions
	@ln -sf $(patsubst /%,%,$(call DIRSTODOTS,/srv/www/software/versions))$(licensedir)-build \
	        $@~/srv/www/software/build/licenses
	@# Make user 'minimyth' configuration links.
	@mkdir -m 0755 -p $@~/home/minimyth
	@ln -sf $(patsubst /%,%,$(call DIRSTODOTS,/home/minimyth))$(sysconfdir)/lirc/lircrc \
	        $@~/home/minimyth/.lircrc
	@mkdir -m 0755 -p $@~/home/minimyth/.mythtv
	@ln -sf $(patsubst /%,%,$(call DIRSTODOTS,/home/minimyth/.mythtv))$(sysconfdir)/lirc/lircrc \
	        $@~/home/minimyth/.mythtv/lircrc
	@# Make perl init script links.
	@mkdir -m 0775 -p                $@~$(sysconfdir)/rc.d/rc.d
	@index=10  ; $(foreach file, $(MM_INIT_START_PHASE_1), \
		test -e $@~$(sysconfdir)/rc.d/init.d/$(file) && \
		index=$$(($${index}+2)) && \
		ln -sf ../init.d/$(file) $@~$(sysconfdir)/rc.d/rc.d/I1_$${index}$(file) ; )
	@index=10 ; $(foreach file, $(MM_INIT_START_PHASE_2), \
		test -e $@~$(sysconfdir)/rc.d/init.d/$(file) && \
		index=$$(($${index}+2)) && \
		ln -sf ../init.d/$(file) $@~$(sysconfdir)/rc.d/rc.d/I2_$${index}$(file) ; )
	@index=10 ; $(foreach file, $(MM_INIT_START_PHASE_3), \
		test -e $@~$(sysconfdir)/rc.d/init.d/$(file) && \
		index=$$(($${index}+2)) && \
		ln -sf ../init.d/$(file) $@~$(sysconfdir)/rc.d/rc.d/I3_$${index}$(file) ; )
	@index=10 ; $(foreach file, $(MM_INIT_START_PHASE_4), \
		test -e $@~$(sysconfdir)/rc.d/init.d/$(file) && \
		index=$$(($${index}+2)) && \
		ln -sf ../init.d/$(file) $@~$(sysconfdir)/rc.d/rc.d/I4_$${index}$(file) ; )
	@index=10 ; $(foreach file, $(MM_INIT_START_PHASE_5), \
		test -e $@~$(sysconfdir)/rc.d/init.d/$(file) && \
		index=$$(($${index}+2)) && \
		ln -sf ../init.d/$(file) $@~$(sysconfdir)/rc.d/rc.d/I5_$${index}$(file) ; )
	@index=10 ; $(foreach file, $(MM_INIT_KILL) , \
		test -e $@~$(sysconfdir)/rc.d/init.d/$(file) && \
		index=$$(($${index}+2)) && \
		ln -sf ../init.d/$(file) $@~$(sysconfdir)/rc.d/rc.d/K$${index}$(file) ; )
	@# Make font file links.
	@for font in `cd $@~$(datadir)/fonts/X11/TTF ; ls -1 *.{TTF,ttf} 2> /dev/null` ; do \
			ln -sf $(patsubst /%,%,$(call DIRSTODOTS,$(datadir)/mythtv/fonts))$(datadir)/fonts/X11/TTF/$${font} \
			       $@~$(datadir)/mythtv/fonts/$${font} ; \
	 done
	@# Remove unneeded perl files.
	@echo 'removing unneeded perl files'
	@dirs='$(PERL_libdir)' ; \
	 for dir in $${dirs} ; do \
		if [ -e $@~$${dir} ] ; then \
			cd $@~$${dir} ; \
			find . -depth -type f -name '.*'     -exec rm -rf '{}' \; ; \
			find . -depth -type f -name '*.bs'   -exec rm -rf '{}' \; ; \
			find . -depth -type f -name '*.e2x'  -exec rm -rf '{}' \; ; \
			find . -depth -type f -name '*.eg'   -exec rm -rf '{}' \; ; \
			find . -depth -type f -name '*.h'    -exec rm -rf '{}' \; ; \
			find . -depth -type f -name '*.pod'  -exec rm -rf '{}' \; ; \
			find . -depth -type f -name '*.orig' -exec rm -rf '{}' \; ; \
			while [ `find . -depth -type d -empty | wc -l` -gt 0 ] ; do \
				find . -depth -type d -empty -exec rm -rf '{}' \; ; \
			done ; \
		fi ; \
	 done
	@# Remove unneeded python files.
	@echo 'removing unneeded python files'
	@dirs='$(PYTHON_libdir) $(datadir)/mythtv' ; \
	 for dir in $${dirs} ; do \
		if [ -e $@~$${dir} ] ; then \
			cd $@~$${dir} ; \
			find . -depth -type f -name 'EGG-INFO' -exec rm -rf '{}' \; ; \
			find . -depth -type f -name '*.egg-info' -exec rm -rf '{}' \; ; \
			find . -depth -type f -name '*.pyc'  -exec rm -rf '{}' \; ; \
			find . -depth -type f -name '*.pyo'  -exec rm -rf '{}' \; ; \
			find . -depth -type f -name '*.orig' -exec rm -rf '{}' \; ; \
			find . -depth -type f -name '_cffi_backend.so.target' -execdir mv -f '{}' '_cffi_backend.so' \; ; \
		fi ; \
	 done
	@# Remove unwanted binaries, etcs, shares and libraries.
	@echo 'removing unwanted files'
	@for file_item in $(addprefix $@~,$(MM_REMOVES)) ; do \
		if echo $${file_item} | grep -q -e '/$$' > /dev/null 2>&1 ; then \
			file_list=`ls -d1 $${file_item} 2> /dev/null` ; \
			for file in $${file_list} ; do \
				if [ -d $${file} ] ; then \
					rm -rf $${file} ; \
				fi ; \
			done ; \
		else \
			file_list=`ls -d1 $${file_item} 2> /dev/null` ; \
			for file in $${file_list} ; do \
				if [ -f $${file} ] ; then \
					rm -rf $${file} ; \
				fi ; \
			done ; \
		fi ; \
	 done
	@# Copy dependent libraries.
	@echo 'copying dependent libraries'
	@new_filter_path="\(`echo $(strip $(libdirs)) | sed -e 's%//*%/%g' -e 's% /% %g' -e 's%^/%%' -e 's%  *%\\\\|%g'`\)" ; \
	 pass=0 ; \
	 lib_count=1 ; \
	 old_list="" ; \
	 lib_list=`find $@~ -depth -exec file '{}' \; \
		| grep -E -i 'ELF ..-bit LSB executable|ELF ..-bit LSB shared object' \
		| sed -e 's%:.*%%' \
		| sed -e :a -e '$!N;s/\n/ /;ta' -e 'P;D'` ; \
	 while [ $${lib_count} -gt 0 ] ; do \
		pass=$$(($${pass}+1)) ; \
		old_list=`echo $${old_list} $${lib_list} \
			| sed -e 's%[^ ]*/%%g' \
			      -e 's% %\n%g' \
			| sort -u \
			| sed -e :a -e '$!N;s/\n/ /;ta' -e 'P;D'` ; \
		old_filter="\(`echo $${old_list} | sed -e 's%\([.+]\)%\\1%g' | sed -e 's%  *%\\\\|%g'`\)" ; \
		new_list=`$(OBJDUMP) -x $${lib_list} 2> /dev/null \
			| grep -e '^ *NEEDED  *' \
			| sort -u \
			| sed -e 's%^ *NEEDED  *%%' \
			      -e 's%  *$$%%' \
			      -e "s%^$${old_filter}$$%%g" \
			| sed -e :a -e '$!N;s/\n/ /;ta' -e 'P;D'` ; \
		lib_count=`echo "$${new_list}" | wc -w` ; \
		echo "copying dependent libraries: pass $${pass} found $${lib_count} libraries to copy" ; \
		if [ "$(mm_DEBUG_BUILD)" = "yes" ] ; then \
			echo "    lib_list : $${lib_list}" ; \
			echo "    old_list : $${old_list}" ; \
			echo "    new_list : $${new_list}" ; \
		fi ; \
		lib_list="" ; \
		if [ $${lib_count} -gt 0 ] ; then \
			new_filter_file="\(`echo $${new_list} | sed -e 's%\([.+]\)%\\\\\\1%g' | sed -e 's%  *%\\\\|%g'`\)" ; \
			new_filter="$${new_filter_path}/$${new_filter_file}" ; \
			new_list=`cd $(DESTDIR) ; find * -depth -regex "$${new_filter}"` ; \
			for lib in $${new_list} ; do \
				dir=`echo $${lib} | sed -e 's%[^/]*$$%%'` ; \
				mkdir -p $@~/$${dir} ; \
				cp -p $(DESTDIR)/$${lib} $@~/$${dir} ; \
				chmod -R u+w $@~/$${lib} ; \
				lib_list="$${lib_list} $@~/$${lib}" ; \
			done ; \
		fi ; \
	 done
	@# Copy dependent kernel modules.
	@echo 'copying dependent kernel modules'
	@depmod -b "$(DESTDIR)$(rootdir)" "$(LINUX_FULL_VERSION)"
	@find $@~$(LINUX_MODULESDIR) -depth -name '*.ko' | sed -e 's%^$@~$(LINUX_MODULESDIR)%/%' -e 's%//*%/%g' -e 's%^/%%' | \
	 while read module ; do \
		module_deps=`cat $(DESTDIR)$(LINUX_MODULESDIR)/modules.dep | grep -e "^$${module}:" | sed -e 's%[^:]*: *%%'` ; \
		for module_dep in $${module_deps} ; do \
			if [ ! -e $@~$(LINUX_MODULESDIR)/$${module_dep} ] ; then \
				mkdir -p `dirname $@~$(LINUX_MODULESDIR)/$${module_dep}` ; \
				cp -pd $(DESTDIR)$(LINUX_MODULESDIR)/$${module_dep} $@~$(LINUX_MODULESDIR)/$${module_dep} ; \
			fi ; \
		done ; \
	 done
	@# Remove unwanted binaries, etcs, shares and libraries.
	@echo 'removing unwanted files'
	@for file_item in $(addprefix $@~,$(MM_REMOVES)) ; do \
		if echo $${file_item} | grep -q -e '/$$' > /dev/null 2>&1 ; then \
			file_list=`ls -d1 $${file_item} 2> /dev/null` ; \
			for file in $${file_list} ; do \
				if [ -d $${file} ] ; then \
					rm -rf $${file} ; \
				fi ; \
			done ; \
		else \
			file_list=`ls -d1 $${file_item} 2> /dev/null` ; \
			for file in $${file_list} ; do \
				if [ -f $${file} ] ; then \
					rm -rf $${file} ; \
				fi ; \
			done ; \
		fi ; \
	 done
	@# Generate kernel files.
	@depmod -b "$@~$(rootdir)" "$(LINUX_FULL_VERSION)"
	@# Generate font files.
	@cd $@~$(datadir)/fonts/X11/misc ; mkfontscale . ; mkfontdir .
	@cd $@~$(datadir)/fonts/X11/TTF  ; mkfontscale . ; mkfontdir .
	@# All mesa dri drivers are infact thesame binary. Make all as symlink to singe binary to save rootfs size
	@cp $@~$(libdir)/dri/panfrost_dri.so $@~$(libdir)/dri/generic_mesa_dri_driver
	@files=`ls -1 $@~$(libdir)/dri/*.so` ; \
		for file in $${files} ; do \
			rm -f $${file} ; \
			ln -srf $@~$(libdir)/dri/generic_mesa_dri_driver $${file} ; \
		done
	@# Strip binaries and shared libraries.
	@if [ ! $(mm_DEBUG) = yes ] && [ $(mm_STRIP_IMAGE) = yes ] ; then                     \
		echo 'stripping binaries and shared libraries'                              ; \
		echo "  size before:"`du -sh $@~ | sed -e "s/\(\.*\)\t.*/\1/"`              ; \
		find $@~ -depth -exec file '{}' \;                                            \
			| grep -E -i 'ELF ..-bit LSB executable|ELF ..-bit LSB shared object' \
			| sed -e 's%:.*%%'                                                    \
			| xargs $(STRIP) --strip-all -R .note -R .comment                   ; \
		echo "  size after :"`du -sh $@~ | sed -e "s/\(\.*\)\t.*/\1/"`              ; \
	 fi
	@# Strip Perl scripts
	@# If running a parallel build, then let perlstrip.pl start the same number of threads.
	@if [ ! $(mm_DEBUG) = yes ] && [ $(mm_STRIP_IMAGE) = yes ] ; then                 \
		threads="$(patsubst -j%,%,$(filter -j%,$(PARALLELMFLAGS)))"             ; \
		echo "stripping perl ($${threads} threads)"                             ; \
		[ "$${threads}" = "" ] && threads="1"                                   ; \
		dir_list="$@~$(PERL_libdir)"                                            ; \
		echo "  size before :"`du -sh $${dir_list} | sed -e "s/\(\.*\)\t.*/\1/"` ; \
		LD_LIBRARY_PATH=$(build_bindir)/../lib $(build_bindir)/perl /$(build_bindir)/perlstrip.pl $${threads} $${dir_list} > /dev/null 2>&1 ; \
		revert_list=`find $${dir_list} -depth -name *.ERR | sed -e 's%\.ERR$$%%' -e 's%^$@~%%'` ; \
		for revert in $${revert_list} ; do                                        \
			echo "stripping perl: not stripping file [...]$${revert}"       ; \
			rm -f $@~$${revert}.ERR                                         ; \
			rm -f $@~$${revert}.LOG                                         ; \
			cp -f $(DESTDIR)$${revert} $@~$${revert}                        ; \
		done                                                                    ; \
		echo "  size after :"`du -sh $${dir_list} | sed -e "s/\(\.*\)\t.*/\1/"` ; \
	 fi
	@# Strip Python scripts (currently disabled due issues)
ifeq (1,0)
	@if [ ! $(mm_DEBUG) = yes ] && [ $(mm_STRIP_IMAGE) = yes ] ; then                 \
		echo 'stripping python'                                                 ; \
		dir_list="$@~$(PYTHON_libdir) $@~$(datadir)/mythtv"                     ; \
		file_list=`find $${dir_list} -depth -name '*.py'`                       ; \
		echo "  size before:"`du -sh $${dir_list} | sed -e "s/\(\.*\)\t.*/\1/"` ; \
		for file in $${file_list} ; do                                            \
			LD_LIBRARY_PATH=$(build_bindir)/../lib $(build_bindir)/python3 $(build_bindir)/pyminifier "$${file}" 1> "$${file}~" 2> /dev/null ; \
			if [ "x$$?" = "x0" ] ; then                                       \
				mv -f "$${file}~" "$${file}"                            ; \
			else                                                              \
				# echo "stripping python: failed to strip file [...]$${file}". Skipping it... ; \
				rm -f "$${file}~"                                       ; \
			fi                                                              ; \
		done                                                                    ; \
		echo "  size after :"`du -sh $${dir_list} | sed -e "s/\(\.*\)\t.*/\1/"` ; \
	 fi
endif
	@# Create library loader symbolic link to help out binary applications.
	@if [ -e $@~$(elibdir)/ld-linux.so.2 ] ; then \
		if [ ! $(elibdir) = '/lib32' ] ; then \
			mkdir -p $@~/lib32 ; \
			rm -f $@~/lib32/ld-linux.so.2 ; \
			ln -s $(elibdir)/ld-linux.so.2 $@~/lib32/ld-linux.so.2 ; \
		fi ; \
	 fi
	@if [ -e $@~$(elibdir)/ld-linux-x86-64.so.2 ] ; then \
		if [ ! $(elibdir) = '/lib64' ] ; then \
			mkdir -p $@~/lib64 ; \
			rm -f $@~/lib64/ld-linux-x86_64.so.2 ; \
			ln -s $(elibdir)/ld-linux-x86-64.so.2 $@~/lib64/ld-linux-x86-64.so.2 ; \
		fi ; \
	 fi
	@# Clean up permissions (at least somewhat)
	@echo "clean up permissions on execs"
	@find $@~ -depth -exec file '{}' \; \
		| grep -i 'ELF ..-bit LSB executable' \
		| sed -e 's%:.*%%' \
		| xargs chmod 0755
	@echo "clean up permissions on non-execs"
	@find $@~ -depth -exec file '{}' \; \
		| grep -i 'ELF ..-bit LSB shared object' \
		| sed -e 's%:.*%%' \
		| grep -v '*' \
		| grep -v '/libc.so.[0-9]\+$$' \
		| grep -v '/ld-linux.so.[0-9]\+$$' \
		| grep -v '/ld-linux-x86-64.so.[0-9]\+$$' \
		| xargs chmod 0644
	@echo "set up permissions on execs"
	@$(call SET_PERMISSIONS,$@~)
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/image/rootfs: $(top_build)/image/rootfs
	@echo "making root file system directory"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@mkdir -m 0755 -p $@~
	@# Create the read-only root file system from the base file system.
	@# Copy the base file system to the read-only root file system location.
	@# Remove extras directory items because they is included in the extras file system image.
	@# Remove the non-menu themes and non-default themes (except MythCenter/MythCenter-wide) because they are included in the themes file system.
	@cp -pdR $< $@~/rootfs-ro
	@rm -rf           $@~/rootfs-ro/$(extras_rootdir)
	@mkdir -m 0755 -p $@~/rootfs-ro/$(extras_rootdir)
	@for theme in `cd $@~/rootfs-ro/usr/share/mythtv/themes ; ls -1` ; do \
		if [ ! -e $@~/rootfs-ro/usr/share/mythtv/themes/$${theme}/mainmenu.xml ] && \
		   [ ! "$${theme}" = "MythCenter"                                      ] && \
		   [ ! "$${theme}" = "MythCenter-wide"                                 ] && \
		   [ ! "$${theme}" = "default"                                         ] && \
		   [ ! "$${theme}" = "default-wide"                                    ] ; then \
			rm -rf $@~/rootfs-ro/usr/share/mythtv/themes/$${theme} ; \
		fi ; \
	 done
	@# Create the rest for root file system.
	@mkdir -m 0755 -p                   $@~/rootfs
	@mkdir -m 0755 -p                   $@~/rw
	@mkdir -m 0755 -p                   $@~/bin
	@mkdir -m 0755 -p                   $@~/sbin
	@ln -s rootfs-ro/dev                $@~/dev
	@ln -s rootfs-ro/lib64              $@~/lib64
	@ln -s rootfs-ro/lib                $@~/lib
	@ln -s rootfs-ro/usr                $@~/usr
	@ln -s ../rootfs-ro/bin/mkdir       $@~/bin/mkdir
	@ln -s ../rootfs-ro/sbin/modprobe   $@~/sbin/modprobe
	@ln -s ../rootfs-ro/bin/mount       $@~/bin/mount
	@ln -s ../rootfs-ro/sbin/pivot_root $@~/sbin/pivot_root
	@ln -s ../rootfs-ro/bin/sh          $@~/bin/sh
	@ln -s ../rootfs-ro/bin/echo        $@~/bin/echo
	@ln -s ../rootfs-ro/bin/ls          $@~/bin/ls
	@find $(top_source)/initrd -depth -type d \
		| sed -e 's%^\$(top_source)/initrd%$@~%' \
		| xargs -n 1 mkdir -m 0755 -p
	@find $(top_source)/initrd -depth -type f \
		| sed -e 's%^\(\$(top_source)/initrd\)/\(.*\)$$%\1/\2 $@~/\2%' \
		| xargs -n 2 cp -fpd
	@$(call SET_PERMISSIONS,$@~)
	@# Setup ssh id_RSA permissions
	@chmod 0700 $@~/rootfs-ro/root/.ssh
	@chmod 0600 $@~/rootfs-ro/root/.ssh/id_rsa
	@chmod 0700 $@~/rootfs-ro/home/minimyth/.ssh
	@chmod 0600 $@~/rootfs-ro/home/minimyth/.ssh/id_rsa
	@chmod 0755 $@~/rootfs-ro/usr/bin/ssh
	@chmod 0755 $@~/rootfs-ro/usr/sbin/sshd
	@chmod 0755 $@~/rootfs-ro/usr/bin/scp
	@# Set of hacks for 64bit ARM platforms glibc
	@if [ -e $@~/rootfs-ro/lib/ld-linux-* ] ; then    \
		chmod 0755 $@~/rootfs-ro/lib/ld-linux-* ; \
	 fi
	@if [ ! -e $@~/rootfs-ro/lib64/libmount.so* ] ; then \
		ln -sr $@~/rootfs-ro/lib/libmount.so.1 $@~/rootfs-ro/lib64/libmount.so.1 ; \
	 fi
	@if [ ! -e $@~/rootfs-ro/lib64/libblkid.so* ] ; then \
		ln -sr $@~/rootfs-ro/lib/libblkid.so.1 $@~/rootfs-ro/lib64/libblkid.so.1 ; \
	 fi
	@if [ ! -e $@~/rootfs-ro/lib64/libuuid.so* ] ; then \
		ln -sr $@~/rootfs-ro/lib/libuuid.so.1 $@~/rootfs-ro/lib64/libuuid.so.1 ; \
	 fi
	@# Symlinks needed by Qt5 GLES propper support
	@if [ -e $@~/rootfs-ro/usr/lib/libGLESv2.so.2 ] ; then \
		ln -srf $@~/rootfs-ro/usr/lib/libGLESv2.so.2 $@~/rootfs-ro/usr/lib/libGLESv2.so ; \
	 fi
	@if [ -e $@~/rootfs-ro/usr/lib/libEGL.so.1 ] ; then \
		ln -srf $@~/rootfs-ro/usr/lib/libEGL.so.1 $@~/rootfs-ro/usr/lib/libEGL.so ; \
	 fi
	@if [ -e $@~/rootfs-ro/usr/bin/aplay ] ; then \
		ln -srf $@~/rootfs-ro/usr/bin/aplay $@~/rootfs-ro/usr/bin/arecord ; \
	 fi
	@# Set SUID on weston-launch binary required by weston as we are not using systemd nor setcap
	@if [ -e $@~/rootfs-ro/usr/bin/weston-launch ] ; then    \
		chmod +s $@~/rootfs-ro/usr/bin/weston-launch ; \
	 fi
	@# Set SUID on sway binary required by sway as we are not using systemd nor setcap
	@if [ -e $@~/rootfs-ro/usr/bin/sway ] ; then    \
		chmod +s $@~/rootfs-ro/usr/bin/sway ; \
	 fi
	@# Hack for strip wich is cheated by mplayer exec
	@if [ -e $@~/rootfs-ro/usr/bin/mplayer ] ; then    \
		chmod 0755 $@~/rootfs-ro/usr/bin/mplayer ; \
	 fi
	@# Hack for strip wich is cheated by ntp exec
	@if [ -e $@~/rootfs-ro/usr/bin/ntp ] ; then    \
		chmod 0755 $@~/rootfs-ro/usr/bin/ntp ; \
	 fi
	@# Hack for strip wich is cheated by ntpdate exec
	@if [ -e $@~/rootfs-ro/usr/bin/ntpdate ] ; then    \
		chmod 0755 $@~/rootfs-ro/usr/bin/ntpdate ; \
	 fi
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/image/rootfs.fakeroot: $(top_build)/stage/image/rootfs
	@echo "making root file system directory fakeroot configuration file"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@fakeroot -s $@~ sh -c                                             " \
		chmod    u+s     $</rootfs-ro/$(ebindir)/busybox           ; \
		chmod    u+s     $</rootfs-ro/$(ebindir)/ping              ; \
		chmod    u+s     $</rootfs-ro/$(bindir)/pmount             ; \
		chmod    u+s     $</rootfs-ro/$(esbindir)/poweroff         ; \
		chmod    u+s     $</rootfs-ro/$(bindir)/pumount            ; \
		chmod    u+s     $</rootfs-ro/$(bindir)/X                  ; \
		rm -rf           $</rootfs-ro/$(rootdir)/dev               ; \
		mkdir -m 0755 -p $</rootfs-ro/$(rootdir)/dev               ; \
		mknod -m 0600    $</rootfs-ro/$(rootdir)/dev/console c 5 1 ; \
		mknod -m 0600    $</rootfs-ro/$(rootdir)/dev/initctl p     ; \
		mknod -m 0666    $</rootfs-ro/$(rootdir)/dev/null    c 1 3 "
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/image/themes: $(top_build)/image/rootfs
	@echo "making themes file system directory"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@mkdir -m 0755 -p $@~
	@cp -pdR $</usr/share/mythtv/themes/* $@~
	@# Remove the menu themes and default themes because they are included in the root file system.
	@for theme in `cd $@~ ; ls -1` ; do \
		if [ -e $@~/$${theme}/mainmenu.xml ] || \
		   [ "$${theme}" = "default"       ] || \
		   [ "$${theme}" = "default-wide"  ] ; then \
			rm -rf $@~/$${theme} ; \
		fi ; \
	 done
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/image/extras: $(top_build)/image/rootfs
	@echo "making extras file system directory"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@mkdir -m 0755 -p $@~
	@cp -pdR $</$(extras_rootdir)/* $@~
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/pxe-$(mm_NAME): $(top_source)/pxe
	@echo "making PXE directory"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@cp -pdR $< $@~
	@sed -e 's%@MM_NAME@%$(mm_NAME)%' -i $@~/ipxe/tftpboot/minimyth/ipxe.cfg/default
	@sed -e 's%@MM_NAME@%$(mm_NAME)%' -i $@~/pxelinux/tftpboot/minimyth/pxelinux.cfg/default
	@if [ -e       $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.0 ] ; then \
		cp -pd $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.0 \
		       $@~/ipxe/tftpboot/minimyth/ipxe.0 ; \
	 fi
	@if [ -e       $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.pxe ] ; then \
		cp -pd $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.pxe \
		       $@~/ipxe/tftpboot/minimyth/ipxe.pxe ; \
	 fi
	@if [ -e       $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.efi ] ; then \
		cp -pd $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/ipxe.efi \
		       $@~/ipxe/tftpboot/minimyth/ipxe.efi ; \
	 fi
	@if [ -e       $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/pxelinux.0 ] ; then \
		cp -pd $(DESTDIR)$(rootdir)/srv/tftpboot/minimyth/pxelinux.0 \
		       $@~/pxelinux/tftpboot/minimyth/pxelinux.0 ; \
	 fi
	@find $@~ -depth -type d -exec chmod 0755 '{}' \;
	@find $@~ -depth -type f -exec chmod 0644 '{}' \;
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/html: \
		$(top_source)/html \
		$(top_build)/stage/supported-gfx-hardware.txt \
		$(top_build)/stage/supported-IR-remotes.txt
	@echo "copying source HTML docs"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@cp -pdR $(top_source)/html/ $@~
	@echo "updating index.html"
	@sed -i 's%@MM_VERSION_MINIMYTH@%$(mm_VERSION_MINIMYTH)%g'           $@~/index.html
	@sed -i 's%@MM_NVIDIA_VERSION@%$(mm_NVIDIA_VERSION)%g'               $@~/index.html
	@sed -i 's%@MM_NVIDIA_LEGACY_VERSION@%$(mm_NVIDIA_LEGACY_VERSION)%g' $@~/index.html
	@sed -i 's%@LINUX_FULL_VERSION@%$(LINUX_FULL_VERSION)%g'             $@~/index.html
	@sed -i 's%@MYTHTV_SVN_VERSION@%$(MYTHTV_SVN_VERSION)%g'             $@~/index.html
	@echo "updating version and licenses in HTML docs"
	@mkdir -m 0755 -p $@~/software/base
	@cp -pdR $(DESTDIR)$(versiondir) $@~/software/base/
	@cp -pdR $(DESTDIR)$(licensedir) $@~/software/base/
	@mkdir -m 0755 -p $@~/software/extras
	@cp -pdR $(DESTDIR)$(extras_versiondir) $@~/software/extras/
	@cp -pdR $(DESTDIR)$(extras_licensedir) $@~/software/extras/
	@mkdir -m 0755 -p $@~/software/build
	@cp -pdR $(build_versiondir)  $@~/software/build/
	@cp -pdR $(build_licensedir)  $@~/software/build/
	@echo "adding gfx/IR lists to HTML docs"
	@cp $(top_build)/stage/supported-gfx-hardware.txt $@~/document-supported-gfx-hardware.txt
	@cp $(top_build)/stage/supported-IR-remotes.txt $@~/document-supported-IR-remotes.txt
	@find $@~ -depth -type d -exec chmod 0755 '{}' \;
	@find $@~ -depth -type f -exec chmod 0644 '{}' \;
	@touch $@~
	@mv $@~ $@
	$(if $(filter i386 x86_64,$(mm_GARCH_FAMILY)),@cp $(top_build)/stage/supported-gfx-hardware.txt $(mm_HOME)/html/minimyth/document-supported-gfx-hardware.txt)
	$(if $(filter i386 x86_64,$(mm_GARCH_FAMILY)),@cp $(top_build)/stage/supported-IR-remotes.txt   $(mm_HOME)/html/minimyth/document-supported-IR-remotes.txt)

$(top_build)/stage/version:
	@echo "making version file"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@touch $@~
	@echo "$(mm_VERSION)-$(mm_GARCH_FAMILY)" > $@~
	@chmod 0644 $@~
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/changelog.txt: $(top_source)/html/document-changelog.txt
	@echo "copying changelog file"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@cp -pdR $< $@~
	@chmod 0644 $@~
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/release-notes.txt: $(top_source)/html/document-release-notes.txt
	@echo "copying release-notes file"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@cp -pdR $< $@~
	@chmod 0644 $@~
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/supported-gfx-hardware.txt:
	@echo "generating supported-gfx-hardware list"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@touch $@~
	$(if $(filter radeon,        $(mm_GRAPHICS)),@cat $(DESTDIR)/usr/share/supported-ati-gfx-hardware.txt           >> $@~)
	$(if $(filter intel,         $(mm_GRAPHICS)),@cat $(DESTDIR)/usr/share/supported-intel-gfx-hardware.txt         >> $@~)
	$(if $(filter nvidia,        $(mm_GRAPHICS)),@cat $(DESTDIR)/usr/share/supported-nvidia-gfx-hardware.txt        >> $@~)
	$(if $(filter nvidia-legacy, $(mm_GRAPHICS)),@cat $(DESTDIR)/usr/share/supported-nvidia-legacy-gfx-hardware.txt >> $@~)
	$(if $(filter vc4,           $(mm_GRAPHICS)),@cat $(DESTDIR)/usr/share/supported-vc4-gfx-hardware.txt           >> $@~)
	$(if $(filter meson,         $(mm_GRAPHICS)),@cat $(DESTDIR)/usr/share/supported-meson-gfx-hardware.txt         >> $@~)
	$(if $(filter rockchip,      $(mm_GRAPHICS)),@cat $(DESTDIR)/usr/share/supported-rockchip-gfx-hardware.txt      >> $@~)
	$(if $(filter sun4i,         $(mm_GRAPHICS)),@cat $(DESTDIR)/usr/share/supported-sun4i-gfx-hardware.txt         >> $@~)
	@grep "PCI_ID" -c $@~ | sed -e 's/^/\nTotal video chips supported: /g' >> $@~
	@chmod 0644 $@~
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/supported-IR-remotes.txt:
	@echo "deberting supported-IR-remotes list"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@cp -pd $(DESTDIR)/usr/share/supported-IR-remotes.txt $@~
	@grep -c ^ $@~ | sed -e 's/^/\nTotal IR receivers supported: /g' >> $@~
	@chmod 0644 $@~
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/gar-$(mm_NAME): $(top_source)/gar-minimyth
	@echo "copying build system source directory"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@cp -pdR $< $@~
	@$(call SET_PERMISSIONS,$@~)
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/kernel: $(DESTDIR)/$(LINUX_DIR)/vmlinuz
	@echo "copying kernel image"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@cp -pdR $< $@~
	@chmod 0644 $@~
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/boot: $(DESTDIR)/$(LINUX_DIR)
	@echo "copying boot files"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@cp -pdR $^ $@~
	@find $@~ -depth -type d -exec chmod 0755 '{}' \;
	@find $@~ -depth -type f -exec chmod 0644 '{}' \;
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/rootfs: $(top_build)/stage/image/rootfs $(top_build)/stage/image/rootfs.fakeroot
	@echo "making the squashfs version of the root file system"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@fakeroot -i $<.fakeroot sh -c "mksquashfs $< $@~ -comp xz -no-exports -no-progress -no-fragments > /dev/null 2>&1"
	@chmod 0644 $@~
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/extras.sfs: $(top_build)/stage/image/extras
	@echo "making the squashfs version of the extras file system"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@fakeroot sh -c "mksquashfs $< $@~ -comp xz -no-exports -no-progress -no-fragments > /dev/null 2>&1"
	@chmod 0644 $@~
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/themes: $(top_build)/stage/image/themes
	@echo "making the squashfs version of the themes file system"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@mkdir -m 0755 -p $@~
	@for theme in `cd $< ; ls -1` ; do  \
		fakeroot sh -c "mksquashfs $</$${theme} $@~/$${theme}.sfs -comp xz   -no-exports -no-progress -no-fragments > /dev/null 2>&1" ; \
	 done
	@find $@~ -depth -type d -exec chmod 0755 '{}' \;
	@find $@~ -depth -type f -exec chmod 0644 '{}' \;
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/rootfs.tar.bz2: $(top_build)/stage/image/rootfs $(top_build)/stage/image/rootfs.fakeroot
	@echo "making the tarball version of the root file system"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@fakeroot -i $<.fakeroot sh -c "tar -C $(<D) -jcf $@~ $(<F)"
	@chmod 0644 $@~
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/extras.tar.bz2: $(top_build)/stage/image/extras
	@echo "making the tarball version of the extras file system"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@fakeroot                sh -c "tar -C $(<D) -jcf $@~ $(<F)"
	@chmod 0644 $@~
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/themes.tar.bz2: $(top_build)/stage/image/themes
	@echo "making the tarball version of the themes file system"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@fakeroot                sh -c "tar -C $(<D) -jcf $@~ $(<F)"
	@chmod 0644 $@~
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/%.md5: $(top_build)/stage/%
	@echo "making the checksum file for $(patsubst $(top)%,[...]%,$<)"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@(cd $(<D) ; find $(<F) -depth -type f -exec md5sum '{}' \; | sort -k 2) > $@~
	@chmod 644 $@~
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/%.tar.bz2: $(top_build)/stage/%
	@echo "making the tarball file of $(patsubst $(top)%,[...]%,$<)"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@fakeroot                sh -c "tar -C $(<D) -jcf $@~ $(<F)"
	@chmod 0644 $@~
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/ram-$(mm_GARCH_FAMILY)-$(mm_NAME)  \
$(top_build)/stage/nfs-$(mm_GARCH_FAMILY)-$(mm_NAME):
	@echo "making $(patsubst $(top)%,[...]%,$@)"
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@mkdir -m 0755 -p $@~
	@cp -pdR $^ $@~
	@rm -f $@~/minimyth.md5
	@rm -f $@~~minimyth.md5~
	@(cd $@~ ; find -depth -type f -exec md5sum '{}' \; | sed -e 's%\./%%' | sort -k 2) > $@~~minimyth.md5~
	@mv -f $@~~minimyth.md5~ $@~/minimyth.md5
	@chmod 0644 $@~/minimyth.md5
	@touch $@~
	@mv $@~ $@

$(top_build)/stage/ram-$(mm_GARCH_FAMILY)-$(mm_NAME):                       \
	$(top_build)/stage/version                                          \
	$(top_build)/stage/html                                             \
	$(if $(filter i386,$(mm_GARCH_FAMILY)),$(top_build)/stage/kernel)   \
	$(if $(filter x86_64,$(mm_GARCH_FAMILY)),$(top_build)/stage/kernel) \
	$(top_build)/stage/rootfs                                           \
	$(top_build)/stage/extras.sfs                                       \
	$(top_build)/stage/themes                                           \
	$(top_build)/stage/changelog.txt                                    \
	$(top_build)/stage/release-notes.txt                                \
	$(top_build)/stage/supported-IR-remotes.txt

$(top_build)/stage/nfs-$(mm_GARCH_FAMILY)-$(mm_NAME):                       \
	$(top_build)/stage/version                                          \
	$(top_build)/stage/html                                             \
	$(if $(filter i386,$(mm_GARCH_FAMILY)),$(top_build)/stage/kernel)   \
	$(if $(filter x86_64,$(mm_GARCH_FAMILY)),$(top_build)/stage/kernel) \
	$(top_build)/stage/rootfs.tar.bz2                                   \
	$(top_build)/stage/extras.tar.bz2                                   \
	$(top_build)/stage/themes                                           \
	$(top_build)/stage/changelog.txt                                    \
	$(top_build)/stage/release-notes.txt                                \
	$(top_build)/stage/supported-IR-remotes.txt

$(top_build)/share: \
		$(top_build)/stage/version                                                              \
		$(top_build)/stage/rootfs                                                               \
		$(top_build)/stage/rootfs.tar.bz2                                                       \
		$(top_build)/stage/extras.tar.bz2                                                       \
		$(top_build)/stage/changelog.txt                                                        \
		$(top_build)/stage/release-notes.txt                                                    \
		$(top_build)/stage/supported-gfx-hardware.txt                                           \
		$(top_build)/stage/supported-IR-remotes.txt                                             \
		$(top_build)/stage/html                                                                 \
		$(top_build)/stage/gar-$(mm_NAME).tar.bz2 $(top_build)/stage/gar-$(mm_NAME).tar.bz2.md5 \
		$(if $(filter yes,$(mm_DISTRIBUTION_RAM)), $(top_build)/stage/ram-$(mm_GARCH_FAMILY)-$(mm_NAME).tar.bz2)     \
		$(if $(filter yes,$(mm_DISTRIBUTION_RAM)), $(top_build)/stage/ram-$(mm_GARCH_FAMILY)-$(mm_NAME).tar.bz2.md5) \
		$(if $(filter yes,$(mm_DISTRIBUTION_NFS)), $(top_build)/stage/nfs-$(mm_GARCH_FAMILY)-$(mm_NAME).tar.bz2)     \
		$(if $(filter yes,$(mm_DISTRIBUTION_NFS)), $(top_build)/stage/nfs-$(mm_GARCH_FAMILY)-$(mm_NAME).tar.bz2.md5)
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@mkdir -m 0755 -p $@~
	@cp -pdR $^ $@~
	@touch $@~
	@mv $@~ $@
	@echo "made share distribution"

install: build
	@if [ $(mm_DISTRIBUTION_SHARE) = yes ] ; then                                                              \
		rm -rf   $(mm_SHARE_FILES)/                                                                      ; \
		mkdir -p $(mm_SHARE_FILES)/                                                                      ; \
		echo "installing RAMfs content on share [$(mm_SHARE_FILES)]"                                     ; \
		echo '  copying version file'                                                                    ; \
		cp -af $(top_build)/stage/version $(mm_SHARE_FILES)/version                                      ; \
		echo '  copying kernel & boot files'                                                             ; \
		if [  $(mm_GARCH_FAMILY) = arm ] ; then                                                            \
			 mkdir -p $(mm_SHARE_FILES)/boot                                                         ; \
			 cp -arf $(top_build)/stage/boot/* $(mm_SHARE_FILES)/boot/                               ; \
		 elif [  $(mm_GARCH_FAMILY) = arm64 ] ; then                                                       \
			 mkdir -p $(mm_SHARE_FILES)/boot                                                         ; \
			 cp -arf $(top_build)/stage/boot/* $(mm_SHARE_FILES)/boot/                               ; \
		 else                                                                                              \
			 cp -a $(top_build)/stage/kernel $(mm_SHARE_FILES)/kernel                                ; \
		 fi                                                                                              ; \
		echo '  copying rootfs'                                                                          ; \
		cp -af $(top_build)/stage/rootfs $(mm_SHARE_FILES)/rootfs                                        ; \
		cp -af $(top_build)/stage/rootfs.tar.bz2 $(mm_SHARE_FILES)/rootfs.tar.bz2                        ; \
		echo '  copying extras'                                                                          ; \
		cp -af $(top_build)/stage/extras.tar.bz2 $(mm_SHARE_FILES)/extras.tar.bz2                        ; \
		echo '  copying changelog'                                                                       ; \
		cp -af $(top_build)/stage/changelog.txt $(mm_SHARE_FILES)/changelog.txt                          ; \
		echo '  copying release-notes'                                                                   ; \
		cp -af $(top_build)/stage/release-notes.txt $(mm_SHARE_FILES)/release-notes.txt                  ; \
		echo '  copying supported HW lists'                                                              ; \
		cp -a $(top_build)/stage/supported-gfx-hardware.txt $(mm_SHARE_FILES)/supported-gfx-hardware.txt ; \
		cp -a $(top_build)/stage/supported-IR-remotes.txt $(mm_SHARE_FILES)/supported-IR-remotes.txt     ; \
		echo '  copying HTML docs'                                                                       ; \
		cp -a $(top_build)/stage/html $(mm_SHARE_FILES)/html                                             ; \
		echo '  copying gar-$(mm_NAME).tar.bz2'                                                          ; \
		cp -a $(top_build)/stage/gar-$(mm_NAME).tar.bz2 $(mm_SHARE_FILES)/gar-$(mm_NAME).tar.bz2         ; \
	 fi
	@if [ $(mm_INSTALL_ONLINE_UPDATES) = yes ] ; then                                                    \
		rm -rf   $(mm_ONLINE_UPDATES)/                                                             ; \
		mkdir -p $(mm_ONLINE_UPDATES)/                                                             ; \
		echo '  copying boot files'                                                                ; \
		mkdir -p $(mm_ONLINE_UPDATES)/boot                                                         ; \
		cp -a $(top_build)/stage/boot/* $(mm_ONLINE_UPDATES)/boot/                                 ; \
		echo '  copying rootfs files'                                                              ; \
		mkdir -p $(mm_ONLINE_UPDATES)/root                                                         ; \
		cp -a $(top_build)/stage/image/rootfs/* $(mm_ONLINE_UPDATES)/root/                         ; \
		echo '  copying version file'                                                              ; \
		cp -a $(top_build)/stage/version $(mm_ONLINE_UPDATES)/version                              ; \
		echo '  creating examplary rsyncd.conf file'                                               ; \
		rm -f $(mm_ONLINE_UPDATES)/rsyncd.conf                                                     ; \
		touch $(mm_ONLINE_UPDATES)/rsyncd.conf                                                     ; \
		echo "# Add in minimyth.conf: 'MM_MINIMYTH_ONLINE_UPDATES_URL='<host>::mm2-updates/$(mm_GARCH_FAMILY)/$(mm_MYTH_VERSION)' " >> $(mm_ONLINE_UPDATES)/rsyncd.conf ; \
		echo "# where <host> is machine hosting files at $(mm_ONLINE_UPDATES)"                                                      >> $(mm_ONLINE_UPDATES)/rsyncd.conf ; \
		echo "port = 7135"                       >> $(mm_ONLINE_UPDATES)/rsyncd.conf ; \
		echo "use chroot = yes"                  >> $(mm_ONLINE_UPDATES)/rsyncd.conf ; \
		echo "list = no"                         >> $(mm_ONLINE_UPDATES)/rsyncd.conf ; \
		echo "[mm2-updates]"                     >> $(mm_ONLINE_UPDATES)/rsyncd.conf ; \
		echo "path = $(mm_ONLINE_UPDATES)/"      >> $(mm_ONLINE_UPDATES)/rsyncd.conf ; \
		echo "read only = true"                  >> $(mm_ONLINE_UPDATES)/rsyncd.conf ; \
	 fi
	@if [ $(mm_DISTRIBUTION_SDCARD) = yes ] ; then                                                 \
		echo "made SD card distribution"                                                     ; \
		$(build_bindir)/kickstart/create-image.sh "$(mm_BOARD_TYPE)"                         ; \
		echo "installing SD Card image on [$(mm_SDCARD_FILES)]"                              ; \
		cp -a $(top_build)/stage/MiniMyth2-*-SD-Image.img.xz $(mm_SDCARD_FILES)/             ; \
	 fi
	@if [ $(mm_INSTALL_RAM_BOOT) = yes ] || \
	    [ $(mm_INSTALL_NFS_BOOT) = yes ] ; then \
		                                                                                                                 \
		if [ $(mm_INSTALL_RAM_BOOT) = yes ] ; then                                                                       \
			echo "installing RAMfs content on TFTP server [$(mm_TFTP_ROOT)]"                                       ; \
			rm -rf   $(mm_TFTP_ROOT)/$(mm_VERSION_MINIMYTH)                                                        ; \
			mkdir -p $(mm_TFTP_ROOT)/$(mm_VERSION_MINIMYTH)                                                        ; \
			echo '  copying version file'                                                                          ; \
			cp -a $(top_build)/stage/version $(mm_TFTP_ROOT)/$(mm_VERSION_MINIMYTH)/version                        ; \
			echo '  copying kernel & boot files'                                                                   ; \
			if [  $(mm_GARCH_FAMILY) = arm ] ; then                                                                  \
				mkdir -p $(mm_TFTP_ROOT)/$(mm_VERSION_MINIMYTH)/boot                                           ; \
				cp -a $(top_build)/stage/boot $(mm_TFTP_ROOT)/$(mm_VERSION_MINIMYTH)/                          ; \
			elif [  $(mm_GARCH_FAMILY) = arm64 ] ; then                                                              \
				mkdir -p $(mm_TFTP_ROOT)/$(mm_VERSION_MINIMYTH)/boot                                           ; \
				cp -a $(top_build)/stage/boot $(mm_TFTP_ROOT)/$(mm_VERSION_MINIMYTH)/                          ; \
			else                                                                                                     \
				cp -a $(top_build)/stage/kernel $(mm_TFTP_ROOT)/$(mm_VERSION_MINIMYTH)/kernel                  ; \
			fi                                                                                                     ; \
			echo '  copying rootfs'                                                                                ; \
			cp -a $(top_build)/stage/rootfs $(mm_TFTP_ROOT)/$(mm_VERSION_MINIMYTH)/rootfs                          ; \
			echo '  copying extras'                                                                                ; \
			cp -a $(top_build)/stage/extras.sfs $(mm_TFTP_ROOT)/$(mm_VERSION_MINIMYTH)/extras.sfs                  ; \
			echo '  copying changelog'                                                                             ; \
			cp -a $(top_build)/stage/changelog.txt $(mm_TFTP_ROOT)/$(mm_VERSION_MINIMYTH)/changelog.txt            ; \
			echo '  copying release-notes'                                                                         ; \
			cp -a $(top_build)/stage/release-notes.txt $(mm_TFTP_ROOT)/$(mm_VERSION_MINIMYTH)/release-notes.txt    ; \
			echo '  copying supported HW lists'                                                                    ; \
			cp -a $(top_build)/stage/supported-gfx-hardware.txt $(mm_TFTP_ROOT)/$(mm_VERSION_MINIMYTH)/supported-gfx-hardware.txt ; \
			cp -a $(top_build)/stage/supported-IR-remotes.txt $(mm_TFTP_ROOT)/$(mm_VERSION_MINIMYTH)/supported-IR-remotes.txt     ; \
		fi                                                                                                             ; \
		                                                                                        \
		if [ $(mm_INSTALL_NFS_BOOT) = yes ] ; then                                              \
			echo "installing NFS content on NFS server [$(mm_TFTP_ROOT)/nfs-$(mm_GARCH_FAMILY)-$(mm_NAME)]"  ; \
			echo " "                                                                      ; \
			echo "  Writing NFS rootfs content on NFS server requires root priviliges."   ; \
			echo "  Please provide root password..."                                      ; \
			echo " "                                                                      ; \
			su -c "                                                                         \
				rm -rf   $(mm_TFTP_ROOT)/nfs-$(mm_GARCH_FAMILY)-$(mm_NAME)            ; \
				rm -rf   $(mm_NFS_ROOT)/nfs-$(mm_GARCH_FAMILY)-$(mm_NAME)             ; \
				                                                                        \
				echo '  copying kernel & boot files'                                  ; \
				mkdir -p $(mm_TFTP_ROOT)/nfs-$(mm_GARCH_FAMILY)-$(mm_NAME)            ; \
				if [  $(mm_GARCH_FAMILY) = arm ] ; then                                 \
				        cp -a  $(top_build)/stage/boot                                  \
				          $(mm_TFTP_ROOT)/nfs-$(mm_GARCH_FAMILY)-$(mm_NAME)/          ; \
				elif [  $(mm_GARCH_FAMILY) = arm64 ] ; then                             \
				        cp -a  $(top_build)/stage/boot                                  \
				          $(mm_TFTP_ROOT)/nfs-$(mm_GARCH_FAMILY)-$(mm_NAME)/          ; \
				else                                                                    \
				        cp -a  $(top_build)/stage/kernel                                \
				          $(mm_TFTP_ROOT)/nfs-$(mm_GARCH_FAMILY)-$(mm_NAME)/kernel    ; \
				fi                                                                    ; \
				                                                                        \
				echo '  copying rootfs'                                               ; \
				tar -jxf $(top_build)/stage/rootfs.tar.bz2 -C                           \
				  $(mm_NFS_ROOT)/nfs-$(mm_GARCH_FAMILY)-$(mm_NAME)                    ; \
				                                                                        \
				echo '  copying extras'                                               ; \
				tar -jxf $(top_build)/stage/extras.tar.bz2 -C                           \
				  $(mm_NFS_ROOT)/nfs-$(mm_GARCH_FAMILY)-$(mm_NAME)                    ; \
				mv $(mm_NFS_ROOT)/nfs-$(mm_GARCH_FAMILY)-$(mm_NAME)/extras/*            \
				  $(mm_NFS_ROOT)/nfs-$(mm_GARCH_FAMILY)-$(mm_NAME)/rootfs/rootfs-ro$(extras_rootdir) ; \
				rmdir $(mm_NFS_ROOT)/nfs-$(mm_GARCH_FAMILY)-$(mm_NAME)/extras         ; \
				                                                                        \
			"                                                                             ; \
		fi                                                                                    ; \
	 fi

.PHONY: all build install
