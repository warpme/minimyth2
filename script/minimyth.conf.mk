#-------------------------------------------------------------------------------
# Values in this file can be overridden by including the desired value in
# '$(HOME)/.minimyth/minimyth.conf.mk'.
#-------------------------------------------------------------------------------
-include $(HOME)/.minimyth/minimyth.conf.mk

# The version of MiniMyth.
mm_VERSION                ?= $(mm_VERSION_MYTH)-$(mm_VERSION_MINIMYTH)$(mm_VERSION_EXTRA)
mm_VERSION_MYTH           ?= $(strip \
                                $(if $(filter 0.27 ,        $(mm_MYTH_VERSION)),0.27                          ) \
                                $(if $(filter master ,      $(mm_MYTH_VERSION)),master                        ) \
                                $(if $(filter torc ,        $(mm_MYTH_VERSION)),torc                          ) \
                                $(if $(filter trunk,        $(mm_MYTH_VERSION)),trunk.$(mm_MYTH_TRUNK_VERSION)) \
                              )

mm_VERSION_MINIMYTH ?= 7.1.3.g85af792

mm_VERSION_EXTRA          ?= $(strip \
                                $(if $(filter yes,$(mm_DEBUG)),-debug) \
                              )

# Configuration file (minimyth.conf) version.
mm_CONF_VERSION           ?= 47

#-------------------------------------------------------------------------------
# Variables that you are likely to be override based on your environment.
#-------------------------------------------------------------------------------
# Indicates whether or not to enable debugging in the image.
# Valid values for mm_DEBUG are 'yes' and 'no'.
mm_DEBUG                  ?= no

# Indicates whether or not to enable debugging in the build system.
# Valid values for mm_DEBUG_BUILD are 'yes' and 'no'.
mm_DEBUG_BUILD            ?= no

# Lists the graphics drivers supported.
# Valid values for mm_GRAPHICS are one or more of 'intel', 'nvidia',
# 'radeon', and 'vmware'.
mm_GRAPHICS               ?= intel nvidia vmware radeon

# Lists the software to be supported.
# Lists the software to be supported.
# Valid values for MM_SOFTWARE are zero or more of 'airplay', 'avahi', 'mythplugins',
# 'mythbrowser', 'mythgallery', 'mythgame', 'mythmusic', 'mythnews', 'mythstream',
# 'mythweather', 'mythzoneminder', 'mythffmpeg', 'flash', 'perl', 'python', 'mame',
# 'emulators', 'mc', 'dvdcss', 'udisks', 'debug'.
mm_SOFTWARE               ?= mythplugins \
                             flash \
                             perl \
                             python \
                             airplay \
                             avahi \
                             udisks \
                             dvdcss \
                             voip \
                             makemkv \
                             $(if $(filter $(mm_DEBUG),yes),debug)

#                             mc
#                             mame \

# Indicates the microprocessor architecture.
# Valid values for mm_GARCH are 'c3', 'c3-2', 'pentium-mmx', 'x86-64', 'atom'.
mm_GARCH                  ?= x86-64

# Indicates whether or not to create the RAM based part of the distribution.
mm_DISTRIBUTION_RAM       ?= yes

# Indicates whether or not to create the NFS based part of the distribution.
mm_DISTRIBUTION_NFS       ?= no

# Indicates whether or not to create the local distribution.
mm_DISTRIBUTION_LOCAL     ?= yes

# Indicates whether or not to create the share distribution.
mm_DISTRIBUTION_SHARE     ?= no

# Indicates whether or not to install the MiniMyth files needed to network boot
# with a RAM root file system. This will cause files to be installed in
# directory $(mm_TFTP_ROOT)/minimyth-$(mm_VERSION)/.
# Valid values for mm_INSTALL_RAM_BOOT are 'yes' and 'no'.
mm_INSTALL_RAM_BOOT       ?= yes

# Indicates whether or not to install the MiniMyth files needed to network boot
# with an NFS root file system. This will cause files to be installed in
# directories $(mm_TFTP_ROOT)/minimyth-$(mm_VERSION) and
# $(mm_NFS_ROOT)/minimyth-$(mm_VERSION).
# Valid values for mm_INSTALL_NFS_BOOT are 'yes' and 'no'.
mm_INSTALL_NFS_BOOT       ?= no

# Indicates whether or not to install the MiniMyth files needed to run the
# mm_local_install and mm_local_update. These files will be installed in
# directory $(mm_TFTP_ROOT)/latest so that they can be downloaded via TFTP. It
# is called latest because that is the directory name used in the public
# MiniMyth distribution download directory.
# Valid values for mm_INSTALL_LATEST are 'yes' and 'no'.
mm_INSTALL_LATEST         ?= no

# Indicates the directory where the GAR MiniMyth build system is installed.
mm_HOME                   ?= /home/piotro/minimyth-dev

# Indicates the pxeboot TFTP directory.
# The MiniMyth kernel, the MiniMyth file system image and MiniMyth themes are
# installed in this directory. The files will be installed in a subdirectory
# named 'minimyth-$(mm_VERSION)'.
mm_TFTP_ROOT              ?= /home/piotro/tftpboot

# Indicates where to put kernel, roofs, version and changelog files needed to 
# build ArchLinux pkg with boot image
mm_LOCAL_FILES            ?= /home/piotro/ABS/mythtv-pxe_image

# Indicates the directory in which the directory containing the MiniMyth root
# file system for mounting using NFS. The MiniMyth root file system will be
# installed in a subdirectory named 'minimyth-$(mm_VERSION)'.
mm_NFS_ROOT               ?= /home/piotro/tftpboot

# The version of kernel headers to use.
# Valid values are '3.16', '3.18'
mm_KERNEL_HEADERS_VERSION ?= 3.18

# The version of kernel to use.
# Valid values are '3.16' and '3.18'.
mm_KERNEL_VERSION         ?= 3.18

# The kernel configuration file to use.
# When set, the kernel configuration file $(HOME)/.minimyth/$(mm_KERNEL_CONFIG) will be used.
# When not set, a built-in kernel configuration file will be used.
mm_KERNEL_CONFIG          ?=

# The version of Myth to use.
# Valid values are '0.27', 'master'
mm_MYTH_VERSION           ?= master

# The version of the NVIDIA driver.
# Valid values are '340.58', '340.65'
mm_NVIDIA_VERSION         ?= 340.76

# The version of xorg to use.
# Valid values are '7.6'.
mm_XORG_VERSION           ?= 7.6

# Myth trunk version built. If the version changes too much then the patches may
# no longer work.
mm_MYTH_TRUNK_VERSION     ?=

# Lists additional packages to build when minimyth is built.
mm_USER_PACKAGES          ?=

# Lists additional binaries to include in the MiniMyth image
# by adding to the lists found in minimyth-bin-list and bins-share-list
mm_USER_BIN_LIST          ?=

# Lists additional configs to include in the MiniMyth image
# by adding to the lists found in minimyth-etc-list and extras-etc-list
mm_USER_ETC_LIST          ?=

# Lists additional libraries to include in the MiniMyth image
# by adding to the lists found in minimyth-lib-list and extras-lib-list
mm_USER_LIB_LIST          ?=

# Lists additional data to include in the MiniMyth image
# by adding to the lists found in minimyth-share-list and extras-share-list
mm_USER_REMOVE_LIST       ?=

# Lists additional files to remove from the MiniMyth image
# by adding to the lists found in minimyth-remove-list*.
mm_USER_SHARE_LIST        ?=

#-------------------------------------------------------------------------------
# Variables that you are not likely to override.
#-------------------------------------------------------------------------------
mm_GARCH_FAMILY           ?= $(strip \
                                 $(if $(filter c3         ,$(mm_GARCH)),i386  ) \
                                 $(if $(filter c3-2       ,$(mm_GARCH)),i386  ) \
                                 $(if $(filter pentium-mmx,$(mm_GARCH)),i386  ) \
                                 $(if $(filter atom       ,$(mm_GARCH)),x86_64) \
                                 $(if $(filter x86-64     ,$(mm_GARCH)),x86_64) \
                              )
mm_GARHOST                ?= $(strip \
                                 $(if $(filter c3         ,$(mm_GARCH)),i586  )  \
                                 $(if $(filter c3-2       ,$(mm_GARCH)),i586  )  \
                                 $(if $(filter pentium-mmx,$(mm_GARCH)),i586  )  \
                                 $(if $(filter atom       ,$(mm_GARCH)),x86_64)  \
                                 $(if $(filter x86-64     ,$(mm_GARCH)),x86_64)  \
                              )-minimyth-linux-gnu
mm_CFLAGS                 ?= $(strip \
                                 -pipe                                                                                       \
                                 $(if $(filter atom        ,$(mm_GARCH)),-march=atom        -mtune=atom    -O2 -mfpmath=sse -ftree-vectorize -mmovbe) \
                                 $(if $(filter c3          ,$(mm_GARCH)),-march=c3          -mtune=c3      -Os             ) \
                                 $(if $(filter c3-2        ,$(mm_GARCH)),-march=c3-2        -mtune=c3-2    -Os -mfpmath=sse) \
                                 $(if $(filter pentium-mmx ,$(mm_GARCH)),-march=pentium-mmx -mtune=generic -Os             ) \
                                 $(if $(filter x86-64      ,$(mm_GARCH)),-march=x86-64      -mtune=generic -O3 -mfpmath=sse) \
                                 -flto                                                                                       \
                                 $(if $(filter i386  ,$(mm_GARCH_FAMILY)),-m32)                                              \
                                 $(if $(filter x86_64,$(mm_GARCH_FAMILY)),-m64)                                              \
                                 $(if $(filter yes,$(mm_DEBUG)),-g)                                                          \
                              )
mm_CXXFLAGS               ?= $(mm_CFLAGS)
mm_DESTDIR                ?= $(mm_HOME)/images/mm

#-------------------------------------------------------------------------------
# Variables that you cannot override.
#-------------------------------------------------------------------------------
# Set the language for gettext to English so the configure scripts for packages
# such as lib/libjpeg do not yield incorrect results.
LANGUAGE=en
export LANGUAGE

# Stop attempts to check out patches from perforce.
PATCH_GET=0
export PATCH_GET

# Set the number of parallel makes to the number of processors.
PARALLELMFLAGS=-j$(shell cat /proc/cpuinfo | grep -c '^processor[[:cntrl:]]*:')
#PARALLELMFLAGS=-j1
export PARALLELMFLAGS

# Get rid of Qt environment variables
#$(foreach var, $(shell set | grep '^QMAKE' | sed 's%=.*$$%%'), $(eval $(var) :=))
#$(foreach var, $(shell set | grep '^QMAKE' | sed 's%=.*$$%%'), $(eval unexport $(var)))
#$(foreach var, $(shell set | grep '^QT' | sed 's%=.*$$%%'), $(eval $(var) :=))
#$(foreach var, $(shell set | grep '^QT' | sed 's%=.*$$%%'), $(eval unexport $(var)))
