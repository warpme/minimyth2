
GARNAME      = nvtop
# v3.2 4.04.2025
GARVERSION   = 73291884d926445e499d6b9b71cb7a9bdbc7c393
CATEGORIES   = utils
MASTER_SITES = https://github.com/Syllo/nvtop/archive/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = display-profiling-sysfs-patch.patch
LICENSE      = GPL

DEPENDS = lib/ncurses

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE=OFF \
	$(if $(filter i386 x86_64,$(mm_GARCH_FAMILY)), \
	  -DNVIDIA_SUPPORT=ON \
	  -DAMDGPU_SUPPORT=ON \
	  -DINTEL_SUPPORT=ON \
	 , \
	  -DNVIDIA_SUPPORT=OFF \
	  -DAMDGPU_SUPPORT=OFF \
	  -DINTEL_SUPPORT=OFF) \
	$(if $(filter arm arm64, $(mm_GARCH_FAMILY)), \
	  -DPANFROST_SUPPORT=ON \
	  -DPANTHOR_SUPPORT=ON \
	 , \
	  -DPANFROST_SUPPORT=OFF \
	  -DPANTHOR_SUPPORT=OFF) \
	-DMSM_SUPPORT=OFF \
	-DAPPLE_SUPPORT=OFF \
	-DLibdrm_INCLUDE_DIRS="$(DESTDIR)$(includedir)/drm" \

include ../../gar.mk
