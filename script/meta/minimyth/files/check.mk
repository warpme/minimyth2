GARNAME    ?= minimyth
GARVERSION ?= $(mm_VERSION)

all: mm-all

GAR_EXTRA_CONF += kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk devel/build-system-bins/package-api.mk
include ../../gar.mk

mm-all:
	@echo "checking ..."
	@# Check build environment.
	@echo "  build system binaries ..."
	@$(foreach pkg,$(build_system_bins), \
		$(foreach bin,$(sort $(build_system_bins_$(subst -,_,$(pkg)))), \
			echo "    '$(bin)' (from package '$(pkg)')" ; \
			which $(bin) > /dev/null 2>&1 ; \
			if [ ! "$$?" = "0" ] ; then \
				echo "error: your system does not contain the program '$(bin)' (from package '$(pkg)')." ; \
				echo "exit 1" ; \
			fi ; \
		) \
	)
	@echo "  build user uid and gid"
	@if [ `id -u` -eq 0 ] || [ `id -g` -eq 0 ] ; then \
		echo "error: gar-minimyth cannot be run by the user 'root'." ; \
		exit 1 ; \
	fi
	@echo "  / and /usr directory access"
	@for dir in /          /lib                              /bin           /sbin \
	            /usr       /usr/lib       /usr/libexec       /usr/bin       /usr/sbin \
	            /usr/local /usr/local/lib /usr/local/libexec /usr/local/bin /usr/local/sbin\
	            /opt ; do \
		if [ -e "$${dir}" ] && [ -w "$${dir}" ] ; then \
			echo "error: gar-minimyth cannot be run by a user with write access to '$${dir}'." ; \
			exit 1 ; \
		fi ; \
	done
	@echo "  build system binaries ... done"
	@# Check for obsolete parameters and parameter values.
	@echo "  obsolete parameters and parameter values ..."
	@echo "    mm_CHIPSETS"
	@if [ -n "$(mm_CHIPSETS)" ] ; then \
		echo "error: mm_CHIPSETS is obsolete." ; \
		exit 1 ; \
	fi
	@echo "    mm_INSTALL_TFTP_BOOT"
	@if [ -n "$(mm_INSTALL_TFTP_BOOT)" ] ; then \
		echo "error: mm_INSTALL_TFTP_BOOT should be replaced with mm_INSTALL_RAM_BOOT." ; \
		exit 1 ; \
	fi
	@echo "    mm_INSTALL_CRAMFS"
	@if [ -n "$(mm_INSTALL_CRAMFS)" ] ; then \
		echo "error: mm_INSTALL_CRAMFS should be replaced with mm_INSTALL_RAM_BOOT." ; \
		exit 1 ; \
	fi
	@echo "    mm_INSTALL_NFS"
	@if [ -n "$(mm_INSTALL_NFS)" ] ; then \
		echo "error: mm_INSTALL_NFS should be replaced with mm_INSTALL_NFS_BOOT." ; \
		exit 1 ; \
	fi
	@if [ -n "$(mm_MYTH_SVN_VERSION)" ] ; then \
		echo "error: mm_MYTH_SVN_VERSION should be replaced with mm_MYTH_TRUNK_VERSION." ; \
		exit 1 ; \
	fi
	@echo "    mm_XORG_VERSION='old'"
	@if [ "$(mm_XORG_VERSION)" = "old" ] ; then \
		echo "error: mm_XORG_VERSION=\"old\" should be replaced with mm_XORG_VERSION=\"6.8\"." ; \
		exit 1 ; \
	fi
	@echo "    mm_XORG_VERSION='new'"
	@if [ "$(mm_XORG_VERSION)" = "new" ] ; then \
		echo "error: mm_XORG_VERSION=\"new\" should be replaced with mm_XORG_VERSION=\"7.0\"." ; \
		exit 1 ; \
	fi
	@echo "  obsolete parameters and parameter values ... done"
	@# Check build parameters.
	@echo "  build parameters ..."
	@echo "    HOME"
	@echo "    mm_GARCH"
	@if [ ! "$(mm_GARCH)" = "pentium-mmx" ] && \
	    [ ! "$(mm_GARCH)" = "armv7"       ] && \
	    [ ! "$(mm_GARCH)" = "armv8"       ] && \
	    [ ! "$(mm_GARCH)" = "x86-64"      ] ; then \
		echo "error: mm_GARCH=\"$(mm_GARCH)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@echo "    mm_HOME"
	@if [ ! "$(mm_HOME)" = "`cd $(GARDIR)/.. ; pwd`" ] ; then \
		echo "error: mm_HOME must be set to \"`cd $(GARDIR)/.. ; pwd`\" but has been set to \"$(mm_HOME)\"."; \
		exit 1 ; \
	fi
	@if [ "$(firstword $(strip $(subst /, ,$(mm_HOME))))" = "$(firstword $(strip $(subst /, ,$(qt5prefix))))" ] ; then \
		echo "error: MiniMyth cannot be built in a subdirectory of \"/$(firstword $(strip $(subst /, ,$(qt5prefix))))\"."; \
		exit 1 ; \
	fi
	@if [ "$(firstword $(strip $(subst /, ,$(mm_HOME))))" = "$(firstword $(strip $(subst /, ,$(qt4prefix))))" ] ; then \
		echo "error: MiniMyth cannot be built in a subdirectory of \"/$(firstword $(strip $(subst /, ,$(qt4prefix))))\"."; \
		exit 1 ; \
	fi
	@echo "    mm_DEBUG"
	@if [ ! "$(mm_DEBUG)" = "yes" ] && [ ! "$(mm_DEBUG)" = "no" ] ; then \
		echo "error: mm_DEBUG=\"$(mm_DEBUG)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@echo "    mm_DEBUG_BUILD"
	@if [ ! "$(mm_DEBUG_BUILD)" = "yes" ] && [ ! "$(mm_DEBUG_BUILD)" = "no" ] ; then \
		echo "error: mm_DEBUG_BUILD=\"$(mm_DEBUG_BUILD)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@echo "    mm_GRAPHICS"
	@for graphic in $(mm_GRAPHICS) ; do \
		if [ ! "$${graphic}" = "intel"         ] && \
		   [ ! "$${graphic}" = "nvidia"        ] && \
		   [ ! "$${graphic}" = "nvidia-legacy" ] && \
		   [ ! "$${graphic}" = "radeon"        ] && \
		   [ ! "$${graphic}" = "radeonhd"      ] && \
		   [ ! "$${graphic}" = "armsoc"        ] && \
		   [ ! "$${graphic}" = "meson"         ] && \
		   [ ! "$${graphic}" = "rockchip"      ] && \
		   [ ! "$${graphic}" = "sun4i"         ] && \
		   [ ! "$${graphic}" = "vc4"           ] && \
		   [ ! "$${graphic}" = "vmware"        ] ; then \
			echo "error: mm_GRAPHICS=\"$${graphic}\" is an invalid value." ; \
			exit 1 ; \
		fi ; \
	done
	@echo "    mm_OPENGL_PROVIDER"
	@for opengl in $(mm_OPENGL_PROVIDER) ; do \
		if [ ! "$${opengl}" = "lima"            ] && \
		   [ ! "$${opengl}" = "mali450-dummy"   ] && \
		   [ ! "$${opengl}" = "mali450-fbdev"   ] && \
		   [ ! "$${opengl}" = "mali450-wayland" ] && \
		   [ ! "$${opengl}" = "mali450-x11"     ] && \
		   [ ! "$${opengl}" = "brcm-vc4"        ] && \
		   [ ! "$${opengl}" = "mesa-git"        ] && \
		   [ ! "$${opengl}" = "mesa"            ] ; then \
			echo "error: mm_OPENGL_PROVIDER=\"$${opengl}\" is an invalid value." ; \
			exit 1 ; \
		fi ; \
	done
	@echo "    mm_SOFTWARE"
	@for software in $(mm_SOFTWARE) ; do \
		if [ ! "$${software}" = "mythplugins"    ] && \
		   [ ! "$${software}" = "flash"          ] && \
		   [ ! "$${software}" = "gnash"          ] && \
		   [ ! "$${software}" = "mplayer-svn"    ] && \
		   [ ! "$${software}" = "mplayer"        ] && \
		   [ ! "$${software}" = "mpv"            ] && \
		   [ ! "$${software}" = "vlc"            ] && \
		   [ ! "$${software}" = "xine"           ] && \
		   [ ! "$${software}" = "perl"           ] && \
		   [ ! "$${software}" = "python"         ] && \
		   [ ! "$${software}" = "airplay"        ] && \
		   [ ! "$${software}" = "avahi"          ] && \
		   [ ! "$${software}" = "udisks"         ] && \
		   [ ! "$${software}" = "wiimote"        ] && \
		   [ ! "$${software}" = "backend"        ] && \
		   [ ! "$${software}" = "mc"             ] && \
		   [ ! "$${software}" = "dvdcss"         ] && \
		   [ ! "$${software}" = "bdaacs"         ] && \
		   [ ! "$${software}" = "makemkv"        ] && \
		   [ ! "$${software}" = "voip"           ] && \
		   [ ! "$${software}" = "bumblebee"      ] && \
		   [ ! "$${software}" = "gstreamer"      ] && \
		   [ ! "$${software}" = "chrome"         ] && \
		   [ ! "$${software}" = "firefox"        ] && \
		   [ ! "$${software}" = "lcdproc"        ] && \
		   [ ! "$${software}" = "fceu"           ] && \
		   [ ! "$${software}" = "jzintv"         ] && \
		   [ ! "$${software}" = "mame"           ] && \
		   [ ! "$${software}" = "mednafen"       ] && \
		   [ ! "$${software}" = "stella"         ] && \
		   [ ! "$${software}" = "visualboyadvance" ] &&  \
		   [ ! "$${software}" = "zsnes"          ] && \
		   [ ! "$${software}" = "ipxe"           ] && \
		   [ ! "$${software}" = "bootloader"     ] && \
		   [ ! "$${software}" = "glmark2"        ] && \
		   [ ! "$${software}" = "kmscube"        ] && \
		   [ ! "$${software}" = "mesa-demos"     ] && \
		   [ ! "$${software}" = "ffmpeg-drm"     ] && \
		   [ ! "$${software}" = "debug"          ] ; then \
			echo "error: mm_SOFTWARE=\"$${software}\" is an invalid value." ; \
			exit 1 ; \
		fi ; \
	done
	@echo "    mm_KERNEL_VERSION"
	@if [ ! "$(mm_KERNEL_VERSION)" = "5.2"           ] && \
	    [ ! "$(mm_KERNEL_VERSION)" = "5.3"           ] && \
	    [ ! "$(mm_KERNEL_VERSION)" = "5.4"           ] && \
	    [ ! "$(mm_KERNEL_VERSION)" = "amlogic-5.2"   ] && \
	    [ ! "$(mm_KERNEL_VERSION)" = "amlogic-5.3"   ] && \
	    [ ! "$(mm_KERNEL_VERSION)" = "amlogic-5.4"   ] && \
	    [ ! "$(mm_KERNEL_VERSION)" = "rockchip-5.2"  ] && \
	    [ ! "$(mm_KERNEL_VERSION)" = "rockchip-5.3"  ] && \
	    [ ! "$(mm_KERNEL_VERSION)" = "rockchip-5.4"  ] && \
	    [ ! "$(mm_KERNEL_VERSION)" = "allwinner-5.1" ] && \
	    [ ! "$(mm_KERNEL_VERSION)" = "allwinner-5.3" ] && \
	    [ ! "$(mm_KERNEL_VERSION)" = "allwinner-5.4" ] && \
	    [ ! "$(mm_KERNEL_VERSION)" = "rpi-4.19"      ] && \
	    [ ! "$(mm_KERNEL_VERSION)" = "rpi-5.2"       ] ; then \
		echo "error: mm_KERNEL_VERSION=\"$(mm_KERNEL_VERSION)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@echo "    mm_MYTH_VERSION"
	@if [ ! "$(mm_MYTH_VERSION)" = "0.27"         ] && \
	    [ ! "$(mm_MYTH_VERSION)" = "0.28"         ] && \
	    [ ! "$(mm_MYTH_VERSION)" = "29"           ] && \
	    [ ! "$(mm_MYTH_VERSION)" = "30"           ] && \
	    [ ! "$(mm_MYTH_VERSION)" = "31"           ] && \
	    [ ! "$(mm_MYTH_VERSION)" = "master"       ] && \
	    [ ! "$(mm_MYTH_VERSION)" = "test"         ] ; then \
		echo "error: mm_MYTH_VERSION=\"$(mm_MYTH_VERSION)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@echo "    mm_NVIDIA_VERSION"
	@if [ ! "$(mm_NVIDIA_VERSION)" = "418.74"    ] && \
	    [ ! "$(mm_NVIDIA_VERSION)" = "430.34"    ] ; then \
		echo "error: mm_NVIDIA_VERSION=\"$(mm_NVIDIA_VERSION)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@echo "    mm_NVIDIA_LEGACY_VERSION"
	@if [ ! "$(mm_NVIDIA_LEGACY_VERSION)" = "340.106"    ] && \
	    [ ! "$(mm_NVIDIA_LEGACY_VERSION)" = "340.107"    ] ; then \
		echo "error: mm_NVIDIA_LEGACY_VERSION=\"$(mm_NVIDIA_LEGACY_VERSION)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@echo "    mm_XORG_VERSION"
	@if [ ! "$(mm_XORG_VERSION)" = "7.6" ] && \
	    [ ! "$(mm_XORG_VERSION)" = "7.7" ] ; then \
		echo "error: mm_XORG_VERSION=\"$(mm_XORG_VERSION)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@echo "  build parameters ... done"
	@# Check build system parameters.
	@echo "  build system parameters ..."
	@if [ ! "$(build_GARCH_FAMILY)" = "i386"   ] && \
            [ ! "$(build_GARCH_FAMILY)" = "x86_64" ] ; then \
		echo "error: build_GARCH_FAMILY=\"$(build_GARCH_FAMILY)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@# Check distribution parameters.
	@echo "  distribution parameters ..."
	@echo "    mm_DISTRIBUTION_RAM"
	@if [ ! "$(mm_DISTRIBUTION_RAM)" = "yes" ] && [ ! "$(mm_DISTRIBUTION_RAM)" = "no" ] ; then \
		echo "error: mm_DISTRIBUTION_RAM=\"$(mm_DISTRIBUTION_RAM)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@echo "    mm_DISTRIBUTION_NFS"
	@if [ ! "$(mm_DISTRIBUTION_NFS)" = "yes" ] && [ ! "$(mm_DISTRIBUTION_NFS)" = "no" ] ; then \
		echo "error: mm_DISTRIBUTION_NFS=\"$(mm_DISTRIBUTION_NFS)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@echo "    mm_DISTRIBUTION_SDCARD"
	@if [ ! "$(mm_DISTRIBUTION_SDCARD)" = "yes" ] && [ ! "$(mm_DISTRIBUTION_SDCARD)" = "no" ] ; then \
		echo "error: mm_DISTRIBUTION_SDCARD=\"$(mm_DISTRIBUTION_SDCARD)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@echo "    mm_DISTRIBUTION_SHARE"
	@if [ ! "$(mm_DISTRIBUTION_SHARE)" = "yes" ] && [ ! "$(mm_DISTRIBUTION_SHARE)" = "no" ] ; then \
		echo "error: mm_DISTRIBUTION_SHARE=\"$(mm_DISTRIBUTION_SHARE)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@echo "    mm_INSTALL_RAM_BOOT"
	@# Check install parameters.
	@if [ ! "$(mm_INSTALL_RAM_BOOT)" = "yes" ] && [ ! "$(mm_INSTALL_RAM_BOOT)" = "no" ] ; then \
		echo "error: mm_INSTALL_RAM_BOOT=\"$(mm_INSTALL_RAM_BOOT)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@if [ "$(mm_INSTALL_RAM_BOOT)" = "yes" ] && [ ! -d "$(mm_TFTP_ROOT)" ] ; then \
		echo "error: the directory specified by mm_TFTP_ROOT=\"$(mm_TFTP_ROOT)\" does not exist." ; \
		exit 1 ; \
	fi
	@echo "    mm_INSTALL_NFS_BOOT"
	@if [ ! "$(mm_INSTALL_NFS_BOOT)" = "yes" ] && [ ! "$(mm_INSTALL_NFS_BOOT)" = "no" ] ; then \
		echo "error: mm_INSTALL_NFS_BOOT=\"$(mm_INSTALL_NFS_BOOT)\" is an invalid value." ; \
		exit 1 ; \
	fi
	@if [ "$(mm_INSTALL_NFS_BOOT)" = "yes" ] && [ ! -d "$(mm_TFTP_ROOT)" ] ; then \
		echo "error: the directory specified by mm_TFTP_ROOT=\"$(mm_TFTP_ROOT)\" does not exist." ; \
		exit 1 ; \
	fi
	@if [ "$(mm_INSTALL_NFS_BOOT)" = "yes" ] && [ ! -d "$(mm_NFS_ROOT)"  ] ; then \
		echo "error: the directory specified by mm_NFS_ROOT=\"$(mm_NFS_ROOT)\" does not exist." ; \
		exit 1 ; \
	fi
	@echo "    mm_DISTRIBUTION_RAM"
	@if [ "$(mm_INSTALL_RAM_BOOT)" = "yes" ] && [ "$(mm_DISTRIBUTION_RAM)" = "no" ] ; then \
		echo "error: mm_INSTALL_RAM_ROOT=\"yes\" but mm_DISTRIBUTION_RAM=\"no\"." ; \
		exit 1 ; \
	fi
	@echo "    mm_DISTRIBUTION_NFS"
	@if [ "$(mm_INSTALL_NFS_BOOT)" = "yes" ] && [ "$(mm_DISTRIBUTION_NFS)" = "no" ] ; then \
		echo "error: mm_INSTALL_NFS_ROOT=\"yes\" but mm_DISTRIBUTION_NFS=\"no\"." ; \
		exit 1 ; \
	fi
	@echo "  distribution parameters ... done"
	@echo "checking ... done"

.PHONY: all mm-all
