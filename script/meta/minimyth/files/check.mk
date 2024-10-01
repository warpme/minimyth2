GARNAME    ?= minimyth
GARVERSION ?= $(mm_VERSION)

all: mm-all

GAR_EXTRA_CONF += kernel/linux-$(mm_KERNEL_VERSION)/package-api.mk devel/build-system-bins/package-api.mk
include ../../gar.mk

mm-all:
	@echo "checking ..."
	@echo "  basic binaries ..."
	@which bash > /dev/null 2>&1 ; \
		if [ ! "$$?" = "0" ] ; then \
			echo " " ; \
			echo "error: your system does not contain the program 'which' and/or 'bash'" ; \
			echo " " ; \
			exit 1 ; \
		fi
	@# Check build environment.
	@echo "  build system binaries ..."
	@$(foreach pkg,$(build_system_bins), \
		$(foreach bin,$(sort $(build_system_bins_$(subst -,_,$(pkg)))), \
			echo "    '$(bin)' (from package '$(pkg)')" ; \
			which $(bin) > /dev/null 2>&1 ; \
			if [ ! "$$?" = "0" ] ; then \
				echo " " ; \
				echo "error: your system does not contain the program '$(bin)' (from package '$(pkg)')." ; \
				echo " " ; \
				exit 1 ; \
			fi ; \
		) \
	)
	@echo "  build user uid and gid"
	@if [ `id -u` -eq 0 ] || [ `id -g` -eq 0 ] ; then \
		echo " " ; \
		echo "error: gar-minimyth cannot be run by the user 'root'." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "  / and /usr directory access"
	@for dir in /          /lib                              /bin           /sbin \
	            /usr       /usr/lib       /usr/libexec       /usr/bin       /usr/sbin \
	            /usr/local /usr/local/lib /usr/local/libexec /usr/local/bin /usr/local/sbin\
	            /opt ; do \
		if [ -e "$${dir}" ] && [ -w "$${dir}" ] ; then \
			echo " " ; \
			echo "error: gar-minimyth cannot be run by a user with write access to '$${dir}'." ; \
			echo " " ; \
			exit 1 ; \
		fi ; \
	done
	@echo "  build system binaries ... done"
	@# Check build parameters.
	@echo "  build parameters ..."
	@echo "    HOME"
	@echo "    mm_GARCH"
	@if [ ! "$(mm_GARCH)" = "pentium-mmx" ] && \
	    [ ! "$(mm_GARCH)" = "armv7"       ] && \
	    [ ! "$(mm_GARCH)" = "armv8"       ] && \
	    [ ! "$(mm_GARCH)" = "x86-64"      ] ; then \
		echo " " ; \
		echo "error: mm_GARCH=\"$(mm_GARCH)\" is an invalid value." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "    mm_HOME"
	@if [ ! "$(mm_HOME)" = "`cd $(GARDIR)/.. ; pwd`" ] ; then \
		echo " " ; \
		echo "error: mm_HOME must be set to \"`cd $(GARDIR)/.. ; pwd`\" but has been set to \"$(mm_HOME)\"."; \
		echo " " ; \
		exit 1 ; \
	fi
	@if [ "$(firstword $(strip $(subst /, ,$(mm_HOME))))" = "$(firstword $(strip $(subst /, ,$(qt5prefix))))" ] ; then \
		echo " " ; \
		echo "error: MiniMyth cannot be built in a subdirectory of \"/$(firstword $(strip $(subst /, ,$(qt5prefix))))\"."; \
		echo " " ; \
		exit 1 ; \
	fi
	@if [ "$(firstword $(strip $(subst /, ,$(mm_HOME))))" = "$(firstword $(strip $(subst /, ,$(qt4prefix))))" ] ; then \
		echo " " ; \
		echo "error: MiniMyth cannot be built in a subdirectory of \"/$(firstword $(strip $(subst /, ,$(qt4prefix))))\"."; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "    mm_DEBUG"
	@if [ ! "$(mm_DEBUG)" = "yes" ] && [ ! "$(mm_DEBUG)" = "no" ] ; then \
		echo " " ; \
		echo "error: mm_DEBUG=\"$(mm_DEBUG)\" is an invalid value." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "    mm_DEBUG_BUILD"
	@if [ ! "$(mm_DEBUG_BUILD)" = "yes" ] && [ ! "$(mm_DEBUG_BUILD)" = "no" ] ; then \
		echo " " ; \
		echo "error: mm_DEBUG_BUILD=\"$(mm_DEBUG_BUILD)\" is an invalid value." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "    mm_STRIP_IMAGE"
	@if [ ! "$(mm_STRIP_IMAGE)" = "yes" ] && [ ! "$(mm_STRIP_IMAGE)" = "no" ] ; then \
		echo " " ; \
		echo "error: mm_STRIP_IMAGE=\"$(mm_STRIP_IMAGE)\" is an invalid value." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "    mm_GRAPHICS"
	@for graphic in $(mm_GRAPHICS) ; do \
		if [ ! "$${graphic}" = "intel"         ] && \
		   [ ! "$${graphic}" = "nvidia"        ] && \
		   [ ! "$${graphic}" = "nvidia-legacy" ] && \
		   [ ! "$${graphic}" = "radeon"        ] && \
		   [ ! "$${graphic}" = "radeon-legacy" ] && \
		   [ ! "$${graphic}" = "radeonhd"      ] && \
		   [ ! "$${graphic}" = "nouveau"       ] && \
		   [ ! "$${graphic}" = "armsoc"        ] && \
		   [ ! "$${graphic}" = "meson"         ] && \
		   [ ! "$${graphic}" = "rockchip"      ] && \
		   [ ! "$${graphic}" = "sun4i"         ] && \
		   [ ! "$${graphic}" = "vc4"           ] && \
		   [ ! "$${graphic}" = "swrast"        ] && \
		   [ ! "$${graphic}" = "vmware"        ] ; then \
			echo " " ; \
			echo "error: mm_GRAPHICS=\"$${graphic}\" is an invalid value." ; \
			echo " " ; \
			exit 1 ; \
		fi ; \
	done
	@echo "    mm_OPENGL_PROVIDER"
	@for opengl in $(mm_OPENGL_PROVIDER) ; do \
		if [ ! "$${opengl}" = "mesa"     ] && \
		   [ ! "$${opengl}" = "mesa-git" ] ; then \
			echo " " ; \
			echo "error: mm_OPENGL_PROVIDER=\"$${opengl}\" is an invalid value." ; \
			echo " " ; \
			exit 1 ; \
		fi ; \
	done
	@echo "    mm_QT_VERSION"
	@for qt in $(mm_QT_VERSION) ; do \
		if [ ! "$${qt}" = "qt5" ] && \
		   [ ! "$${qt}" = "qt6" ] ; then \
			echo " " ; \
			echo "error: mm_QT_VERSION=\"$${qt}\" is an invalid value." ; \
			echo " " ; \
			exit 1 ; \
		fi ; \
	done
	@echo "    mm_PYTHON_VERSION"
	@for py in $(mm_PYTHON_VERSION) ; do \
		if [ ! "$${py}" = "py2" ] && \
		   [ ! "$${py}" = "py3" ] ; then \
			echo " " ; \
			echo "error: mm_PYTHON_VERSION=\"$${py}\" is an invalid value." ; \
			echo " " ; \
			exit 1 ; \
		fi ; \
	done
	@echo "    mm_SHELL"
	@for shell in $(mm_SHELL) ; do \
		if [ ! "$${shell}" = "busybox" ] && \
		   [ ! "$${shell}" = "dash"    ] && \
		   [ ! "$${shell}" = "bash"    ] ; then \
			echo " " ; \
			echo "error: mm_SHELL=\"$${shell}\" is an invalid value." ; \
			echo " " ; \
			exit 1 ; \
		fi ; \
	done
	@echo "    mm_SOFTWARE"
	@for software in $(mm_SOFTWARE) ; do \
		if [ ! "$${software}" = "mythplugins"    ] && \
		   [ ! "$${software}" = "mythfrontend"   ] && \
		   [ ! "$${software}" = "mplayer-svn"    ] && \
		   [ ! "$${software}" = "mythnetvision"  ] && \
		   [ ! "$${software}" = "mythbrowser"    ] && \
		   [ ! "$${software}" = "mythwebbrowser" ] && \
		   [ ! "$${software}" = "mplayer"        ] && \
		   [ ! "$${software}" = "mpv"            ] && \
		   [ ! "$${software}" = "vlc"            ] && \
		   [ ! "$${software}" = "perl"           ] && \
		   [ ! "$${software}" = "python2"        ] && \
		   [ ! "$${software}" = "python3"        ] && \
		   [ ! "$${software}" = "airplay"        ] && \
		   [ ! "$${software}" = "avahi"          ] && \
		   [ ! "$${software}" = "udisks1"        ] && \
		   [ ! "$${software}" = "udisks2"        ] && \
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
		   [ ! "$${software}" = "jzintv"         ] && \
		   [ ! "$${software}" = "mame"           ] && \
		   [ ! "$${software}" = "mednafen"       ] && \
		   [ ! "$${software}" = "stella"         ] && \
		   [ ! "$${software}" = "visualboyadvance" ] &&  \
		   [ ! "$${software}" = "ipxe"           ] && \
		   [ ! "$${software}" = "bootloader"     ] && \
		   [ ! "$${software}" = "glmark2"        ] && \
		   [ ! "$${software}" = "kmscube"        ] && \
		   [ ! "$${software}" = "kmsvnc"         ] && \
		   [ ! "$${software}" = "mesa-demos"     ] && \
		   [ ! "$${software}" = "ffmpeg-drm"     ] && \
		   [ ! "$${software}" = "ffmpeg"         ] && \
		   [ ! "$${software}" = "iwd"            ] && \
		   [ ! "$${software}" = "connman"        ] && \
		   [ ! "$${software}" = "sway"           ] && \
		   [ ! "$${software}" = "weston"         ] && \
		   [ ! "$${software}" = "apitrace"       ] && \
		   [ ! "$${software}" = "gdb"            ] && \
		   [ ! "$${software}" = "valgrind"       ] && \
		   [ ! "$${software}" = "libgpiod"       ] && \
		   [ ! "$${software}" = "xscreensaver"   ] && \
		   [ ! "$${software}" = "kodi"           ] && \
		   [ ! "$${software}" = "kodi19"         ] && \
		   [ ! "$${software}" = "openvfd"        ] && \
		   [ ! "$${software}" = "monitorix"      ] && \
		   [ ! "$${software}" = "termbin"        ] && \
		   [ ! "$${software}" = "btop"           ] && \
		   [ ! "$${software}" = "htop"           ] && \
		   [ ! "$${software}" = "bashtop"        ] && \
		   [ ! "$${software}" = "nvtop"          ] && \
		   [ ! "$${software}" = "iotop"          ] && \
		   [ ! "$${software}" = "wifi_xr819"     ] && \
		   [ ! "$${software}" = "wifi_rtl8821cu" ] && \
		   [ ! "$${software}" = "wifi_rtl8189es" ] && \
		   [ ! "$${software}" = "wifi_sci9083h"  ] && \
		   [ ! "$${software}" = "debug"          ] ; then \
			echo " " ; \
			echo "error: mm_SOFTWARE=\"$${software}\" is an invalid value." ; \
			echo " " ; \
			exit 1 ; \
		fi ; \
	done
	@echo "    mm_KERNEL_VERSION"
	@if [ ! "$(mm_KERNEL_VERSION)" = "6.9"           ] && \
	    [ ! "$(mm_KERNEL_VERSION)" = "6.10"           ] && \
	    [ ! "$(mm_KERNEL_VERSION)" = "rpi-5.12"      ] ; then \
		echo " " ; \
		echo "error: mm_KERNEL_VERSION=\"$(mm_KERNEL_VERSION)\" is an invalid value." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "    mm_MYTH_VERSION"
	@if [ ! "$(mm_MYTH_VERSION)" = "32"         ] && \
	    [ ! "$(mm_MYTH_VERSION)" = "33"         ] && \
	    [ ! "$(mm_MYTH_VERSION)" = "34"         ] && \
	    [ ! "$(mm_MYTH_VERSION)" = "master"     ] && \
	    [ ! "$(mm_MYTH_VERSION)" = "test"       ] ; then \
		echo " " ; \
		echo "error: mm_MYTH_VERSION=\"$(mm_MYTH_VERSION)\" is an invalid value." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "    mm_NVIDIA_VERSION"
	@if [ ! "$(mm_NVIDIA_VERSION)" = "470.63"    ] && \
	    [ ! "$(mm_NVIDIA_VERSION)" = "455.45"    ] ; then \
		echo " " ; \
		echo "error: mm_NVIDIA_VERSION=\"$(mm_NVIDIA_VERSION)\" is an invalid value." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "    mm_NVIDIA_LEGACY_VERSION"
	@if [ ! "$(mm_NVIDIA_LEGACY_VERSION)" = "340.108"    ] && \
	    [ ! "$(mm_NVIDIA_LEGACY_VERSION)" = "340.109"    ] ; then \
		echo " " ; \
		echo "error: mm_NVIDIA_LEGACY_VERSION=\"$(mm_NVIDIA_LEGACY_VERSION)\" is an invalid value." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "    mm_XORG_VERSION"
	@if [ ! "$(mm_XORG_VERSION)" = "7.6" ] && \
	    [ ! "$(mm_XORG_VERSION)" = "7.7" ] ; then \
		echo " " ; \
		echo "error: mm_XORG_VERSION=\"$(mm_XORG_VERSION)\" is an invalid value." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "  build parameters ... done"
	@# Check build system parameters.
	@echo "  build system parameters ..."
	@if [ ! "$(build_GARCH_FAMILY)" = "i386"   ] && \
            [ ! "$(build_GARCH_FAMILY)" = "x86_64" ] ; then \
		echo " " ; \
		echo "error: build_GARCH_FAMILY=\"$(build_GARCH_FAMILY)\" is an invalid value." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@# Check distribution parameters.
	@echo "  distribution parameters ..."
	@echo "    mm_DISTRIBUTION_RAM"
	@if [ ! "$(mm_DISTRIBUTION_RAM)" = "yes" ] && [ ! "$(mm_DISTRIBUTION_RAM)" = "no" ] ; then \
		echo " " ; \
		echo "error: mm_DISTRIBUTION_RAM=\"$(mm_DISTRIBUTION_RAM)\" is an invalid value." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "    mm_DISTRIBUTION_NFS"
	@if [ ! "$(mm_DISTRIBUTION_NFS)" = "yes" ] && [ ! "$(mm_DISTRIBUTION_NFS)" = "no" ] ; then \
		echo " " ; \
		echo "error: mm_DISTRIBUTION_NFS=\"$(mm_DISTRIBUTION_NFS)\" is an invalid value." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "    mm_DISTRIBUTION_SDCARD"
	@if [ ! "$(mm_DISTRIBUTION_SDCARD)" = "yes" ] && [ ! "$(mm_DISTRIBUTION_SDCARD)" = "no" ] ; then \
		echo " " ; \
		echo "error: mm_DISTRIBUTION_SDCARD=\"$(mm_DISTRIBUTION_SDCARD)\" is an invalid value." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "    mm_DISTRIBUTION_SHARE"
	@if [ ! "$(mm_DISTRIBUTION_SHARE)" = "yes" ] && [ ! "$(mm_DISTRIBUTION_SHARE)" = "no" ] ; then \
		echo " " ; \
		echo "error: mm_DISTRIBUTION_SHARE=\"$(mm_DISTRIBUTION_SHARE)\" is an invalid value." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "    mm_INSTALL_RAM_BOOT"
	@# Check install parameters.
	@if [ ! "$(mm_INSTALL_RAM_BOOT)" = "yes" ] && [ ! "$(mm_INSTALL_RAM_BOOT)" = "no" ] ; then \
		echo " " ; \
		echo "error: mm_INSTALL_RAM_BOOT=\"$(mm_INSTALL_RAM_BOOT)\" is an invalid value." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@if [ "$(mm_INSTALL_RAM_BOOT)" = "yes" ] && [ ! -d "$(mm_TFTP_ROOT)" ] ; then \
		echo " " ; \
		echo "error: the directory specified by mm_TFTP_ROOT=\"$(mm_TFTP_ROOT)\" does not exist." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "    mm_INSTALL_NFS_BOOT"
	@if [ ! "$(mm_INSTALL_NFS_BOOT)" = "yes" ] && [ ! "$(mm_INSTALL_NFS_BOOT)" = "no" ] ; then \
		echo " " ; \
		echo "error: mm_INSTALL_NFS_BOOT=\"$(mm_INSTALL_NFS_BOOT)\" is an invalid value." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@if [ "$(mm_INSTALL_NFS_BOOT)" = "yes" ] && [ ! -d "$(mm_TFTP_ROOT)" ] ; then \
		echo " " ; \
		echo "error: the directory specified by mm_TFTP_ROOT=\"$(mm_TFTP_ROOT)\" does not exist." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@if [ "$(mm_INSTALL_NFS_BOOT)" = "yes" ] && [ ! -d "$(mm_NFS_ROOT)"  ] ; then \
		echo " " ; \
		echo "error: the directory specified by mm_NFS_ROOT=\"$(mm_NFS_ROOT)\" does not exist." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "    mm_DISTRIBUTION_RAM"
	@if [ "$(mm_INSTALL_RAM_BOOT)" = "yes" ] && [ "$(mm_DISTRIBUTION_RAM)" = "no" ] ; then \
		echo " " ; \
		echo "error: mm_INSTALL_RAM_ROOT=\"yes\" but mm_DISTRIBUTION_RAM=\"no\"." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "    mm_DISTRIBUTION_NFS"
	@if [ "$(mm_INSTALL_NFS_BOOT)" = "yes" ] && [ "$(mm_DISTRIBUTION_NFS)" = "no" ] ; then \
		echo " " ; \
		echo "error: mm_INSTALL_NFS_ROOT=\"yes\" but mm_DISTRIBUTION_NFS=\"no\"." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "    mm_DISTRIBUTION_SDCARD"
	@if [ ! "$(mm_DISTRIBUTION_SDCARD)" = "yes" ] && [ ! "$(mm_DISTRIBUTION_SDCARD)" = "no" ] ; then \
		echo " " ; \
		echo "error: mm_DISTRIBUTION_SDCARD=\"$(mm_DISTRIBUTION_SDCARD)\" is an invalid value." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@if [ "$(mm_DISTRIBUTION_SDCARD)" = "yes" ] && [ ! -d "$(mm_SDCARD_FILES)" ] ; then \
		echo " " ; \
		echo "error: the directory specified by mm_SDCARD_FILES=\"$(mm_SDCARD_FILES)\" does not exist." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "    mm_INSTALL_ONLINE_UPDATES"
	@if [ ! "$(mm_INSTALL_ONLINE_UPDATES)" = "yes" ] && [ ! "$(mm_INSTALL_ONLINE_UPDATES)" = "no" ] ; then \
		echo " " ; \
		echo "error: mm_INSTALL_ONLINE_UPDATES=\"$(mm_INSTALL_ONLINE_UPDATES)\" is an invalid value." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@if [ "$(mm_INSTALL_ONLINE_UPDATES)" = "yes" ] && [ ! -d "$(mm_ONLINE_UPDATES)" ] ; then \
		echo " " ; \
		echo "error: the directory specified by mm_ONLINE_UPDATES=\"$(mm_ONLINE_UPDATES)\" does not exist." ; \
		echo " " ; \
		exit 1 ; \
	fi
	@echo "    mm_BOARD_TYPE"
	@for board in $(mm_BOARD_TYPE) ; do \
		if [ ! "$${board}" = "board-g12"                  ] && \
		   [ ! "$${board}" = "board-h6.beelink_gs1"       ] && \
		   [ ! "$${board}" = "board-h6.eachlink_mini"     ] && \
		   [ ! "$${board}" = "board-h6.tanix_tx6"         ] && \
		   [ ! "$${board}" = "board-h6.tanix_tx6_mini"    ] && \
		   [ ! "$${board}" = "board-h6.orangepi_3"        ] && \
		   [ ! "$${board}" = "board-h6.orangepi_3_lts"    ] && \
		   [ ! "$${board}" = "board-h616.tanix_tx6s"      ] && \
		   [ ! "$${board}" = "board-h616.tanix_tx6s_lpddr3" ] && \
		   [ ! "$${board}" = "board-h616.tanix_tx6s_axp313" ] && \
		   [ ! "$${board}" = "board-h616.t95"             ] && \
		   [ ! "$${board}" = "board-h616.x96_mate"        ] && \
		   [ ! "$${board}" = "board-h616.orangepi_zero2"  ] && \
		   [ ! "$${board}" = "board-h616.pendoo_x12pro"   ] && \
		   [ ! "$${board}" = "board-h618.orangepi_zero3"  ] && \
		   [ ! "$${board}" = "board-h618.vontar_h618"     ] && \
		   [ ! "$${board}" = "board-h618.orangepi_zero2w" ] && \
		   [ ! "$${board}" = "board-h313.x96_q"           ] && \
		   [ ! "$${board}" = "board-h313.x96_q_v5.1"      ] && \
		   [ ! "$${board}" = "board-h313.x96_q_lpddr3"    ] && \
		   [ ! "$${board}" = "board-h313.x96_q_lpddr3_v1.3" ] && \
		   [ ! "$${board}" = "board-h313.tanix_tx1"       ] && \
		   [ ! "$${board}" = "board-h313.tanix_tx1_v1.2"  ] && \
		   [ ! "$${board}" = "board-rk3328.beelink_a1"    ] && \
		   [ ! "$${board}" = "board-rk3399.rockpi4-b"     ] && \
		   [ ! "$${board}" = "board-rk3399.rockpi4-se"    ] && \
		   [ ! "$${board}" = "board-rk3399.orangepi_4"    ] && \
		   [ ! "$${board}" = "board-rk3399.orangepi_4_lts" ] && \
		   [ ! "$${board}" = "board-rk3528.rock2-a"       ] && \
		   [ ! "$${board}" = "board-rk3528.vontar_r3"     ] && \
		   [ ! "$${board}" = "board-rk3566.x96_x6"        ] && \
		   [ ! "$${board}" = "board-rk3566.zero3w"        ] && \
		   [ ! "$${board}" = "board-rk3566.quartz64-b"    ] && \
		   [ ! "$${board}" = "board-rk3566.urve-pi"       ] && \
		   [ ! "$${board}" = "board-rk3568.rock3-a"       ] && \
		   [ ! "$${board}" = "board-rk3568.rock3-b"       ] && \
		   [ ! "$${board}" = "board-rk3566.rock3-c"       ] && \
		   [ ! "$${board}" = "board-rk3566.orangepi_3b"   ] && \
		   [ ! "$${board}" = "board-rk3588.rock5-b"       ] && \
		   [ ! "$${board}" = "board-rk3588.rock5-itx"     ] && \
		   [ ! "$${board}" = "board-rk3588.orangepi_5_plus" ] && \
		   [ ! "$${board}" = "board-rk3588s.rock5-a"      ] && \
		   [ ! "$${board}" = "board-rk3588s.rock5-c"      ] && \
		   [ ! "$${board}" = "board-rk3588s.orangepi_5"   ] && \
		   [ ! "$${board}" = "board-rk3588s.orangepi_5_pro" ] && \
		   [ ! "$${board}" = "board-rk3588s.nanopi_m6"    ] && \
		   [ ! "$${board}" = "board-rpi2"                 ] && \
		   [ ! "$${board}" = "board-rpi3.mainline32"      ] && \
		   [ ! "$${board}" = "board-rpi3.mainline64"      ] && \
		   [ ! "$${board}" = "board-rpi3.rpi32"           ] && \
		   [ ! "$${board}" = "board-rpi4.mainline64"      ] && \
		   [ ! "$${board}" = "board-rpi5.mainline64"      ] && \
		   [ ! "$${board}" = "board-rpi34.mainline64"     ] && \
		   [ ! "$${board}" = "board-rpi345.mainline64"    ] && \
		   [ ! "$${board}" = "board-rpi4.rpi32"           ] && \
		   [ ! "$${board}" = "board-rpi4.rpi64"           ] && \
		   [ ! "$${board}" = "board-rpi5.rpi64"           ] && \
		   [ ! "$${board}" = "board-s905"                 ] && \
		   [ ! "$${board}" = "board-s912"                 ] && \
		   [ ! "$${board}" = "board-sm1.x96_air2g"        ] && \
		   [ ! "$${board}" = "board-sm1.tanix_tx5_plus"   ] && \
		   [ ! "$${board}" = "board-g12.radxa_zero"       ] && \
		   [ ! "$${board}" = "board-x86pc.bios"           ] && \
		   [ ! "$${board}" = "board-x86pc.bios_efi64"     ] && \
		   [ ! "$${board}" = "board-x86pc.efi64"          ] ; then \
			echo " " ; \
			echo "error: mm_BOARD_TYPE=\"$${board}\" is an invalid value." ; \
			echo " " ; \
			exit 1 ; \
		fi ; \
	done
	@echo "  distribution parameters ... done"
	@echo "checking ... done"

.PHONY: all mm-all
