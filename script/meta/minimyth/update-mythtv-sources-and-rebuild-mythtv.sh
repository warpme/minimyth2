#
# Script:
# 1. clones mythtv sources in ${mm_home}/source/git-mythtv-{branch}
# 2. Updates ver.string in:
#     ${mm_home}/script/myth-{branch}/mythtv/package-api.mk
#     ${mm_home}/html/minimyth/document-changelog.txt
#     ${HOME}/.minimyth2/minimyth.conf.mk
# 3. Generates makesums & run garchive
# 4. Cleans mythtv build
# 5. Cleans MiniMyth2 build
# 6. Rebuilds mythtv
# 7. Rebuilds MiniMyth2 image


# Use this if you want to test branch <test_branch_name>
# as myathtv-master
use_test_branch_as_amster="no"
# GIT branch name used when above is set to "yes"
# or when minimyth.conf.mk var. mm_MYTH_VERSION is
# set as "test"

# testing branch for ffmpeg-resync
#test_branch_name="devel/ffmpeg-resync"
# Dir where myth test branch sources will be
#test_git_src_dir="git-mythtv-ffmpeg-resync"

# testing branch for qt6
test_branch_name="devel/qt6"
# Dir where myth test branch sources will be
test_git_src_dir="git-mythtv-qt6"

# Location of MiniMyth2 main build config file
mm_conf_file="${HOME}/.minimyth2/minimyth.conf.mk"


















#--------------------------------------------------------------

if [ ! -f ${mm_conf_file} ] ; then
    echo " "
    echo "Error: Can't find MiniMyth2 conf file !"
    echo "Exiting..."
    echo " "
    exit 1
fi
mm_home=`grep "^mm_HOME " ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
if [ ! -f ${mm_home}/script/meta/minimyth/Makefile ] ; then
    echo " "
    echo "Error: MiniMyth2 home [${mm_home}] seems to be wrong directory !"
    echo "Exiting..."
    echo " "
    exit 1
fi

branch=` grep "^mm_MYTH_VERSION "     ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
version=`grep "^mm_VERSION_MINIMYTH " ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
arch=`   grep "^mm_GARCH "            ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
mm_home=`grep "^mm_HOME "             ${mm_conf_file} | sed -e 's/.*\?=*\s//'`
mm_debug=`grep "^mm_DEBUG "           ${mm_conf_file} | sed -e 's/.*\?=*\s//' -e 's/"//g'`
git_src_home="${mm_home}/source"
stamp=`date +%Y%m%d`

if [ x${branch} == "x29" ]; then

  _gitname=mythtv
  _gitroot=git://github.com/MythTV/mythtv.git
  _gitbranch=fixes/29
  srcdir="${git_src_home}/git-mythtv-${branch}"

elif [ x${branch} == "x30" ]; then

  _gitname=mythtv
  _gitroot=git://github.com/MythTV/mythtv.git
  _gitbranch=fixes/30
  srcdir="${git_src_home}/git-mythtv-${branch}"

elif [ x${branch} == "x31" ]; then

  _gitname=mythtv
  _gitroot=git://github.com/MythTV/mythtv.git
  _gitbranch=fixes/31
  srcdir="${git_src_home}/git-mythtv-${branch}"

elif [ x{$branch} == "x32" ]; then

  _gitname=mythtv
  _gitroot=git://github.com/MythTV/mythtv.git
  _gitbranch=fixes/32
  srcdir="${git_src_home}/git-mythtv-${branch}"

elif [ x${branch} == "xmaster" ]; then

  _gitname=mythtv
  _gitroot=git://github.com/MythTV/mythtv.git

  if [ x$use_test_branch_as_amster = "xyes" ]; then
    _gitbranch="${test_branch_name}"
    srcdir="${git_src_home}/${test_git_src_dir}"
  else
    _gitbranch=master
    srcdir="${git_src_home}/git-mythtv-${branch}"
  fi

elif [ x${branch} == "xtest" ]; then

  _gitname=mythtv
  _gitroot=git://github.com/MythTV/mythtv.git

  _gitbranch="${test_branch_name}"
  srcdir="${git_src_home}/${test_git_src_dir}"

else

  echo "ERROR: Unrecognized mm_MYTH_VERSION in  \"${mm_conf_file}\""
  exit 1

fi

echo " "
echo " MiniMyth2 home  : ${mm_home}"
echo " MiniMyth2 ver.  : ${branch}"
echo " GIT root        : ${_gitroot}"
echo " GIT branch      : ${_gitbranch}"
echo " Local GIT clone : ${srcdir}"
echo " "

if [ -z $1 ]; then

    echo " GIT rev.        : HEAD"
    update_patches=0

else

    echo " GIT rev.        : $1"
    req_tree=$1
    update_patches=0

fi

if [ ! -d  ${srcdir} ]; then

    echo "==> No local GIT home..."
    echo "==> Creating:[${srcdir}]"
    mkdir -p ${srcdir}

fi

cd ${srcdir}


if [ -d $srcdir/.git ]; then

    if [ -z ${req_tree} ]; then

        echo "---GIT output---"
        git pull origin $_gitbranch
        echo "---GIT output---"

    else

        echo "---GIT output---"
        git checkout ${req_tree}
        echo "---GIT output---"

    fi

else

    echo "---GIT output---"
    git clone $_gitroot -b $_gitbranch $srcdir/
    echo "---GIT output---"

fi


gitversion=$(git describe)
githash=$(echo $gitversion | sed -e "s/.*\-.*\-\(.*\)/\1/") #"
gitrel=$(git describe | sed -e "s/.*\-\(.*\)\-\(.*\)/\1/") #"
gitfullhash=$(git rev-parse HEAD)

echo " Cloned GIT rel  : r${gitrel}"
echo " Cloned GIT hash : ${githash}"
echo " "
echo " "
echo "--------------------------------------------"

echo "==> Updating versions in document-changelog.txt, package-api.mk, minimyth.conf.mk)"
sed --in-place --follow-symlinks "0,/\s*-update\s*mythtv\s*to\s*r.*/ s/\s*-update\s*mythtv\s*to\s*r.*/  -update mythtv to r${gitrel}/" ${mm_home}/html/minimyth/document-changelog.txt
sed --in-place --follow-symlinks 's/MYTHTV_SVN_VERSION\s*=.*/MYTHTV_SVN_VERSION      = '${stamp}-${githash}'/' "${mm_home}/script/myth-${branch}/mythtv/package-api.mk"
sed --in-place --follow-symlinks 's/MYTHTV_GIT_VERSION\s*=.*/MYTHTV_GIT_VERSION      = '${gitversion}'/' "${mm_home}/script/myth-${branch}/mythtv/package-api.mk"
sed --in-place --follow-symlinks    's/MYTHTV_GIT_HASH\s*=.*/MYTHTV_GIT_HASH         = '${gitfullhash}'/' "${mm_home}/script/myth-${branch}/mythtv/package-api.mk"
sed --in-place --follow-symlinks "s/^mm_VERSION_MINIMYTH.*\?=*\s\(.*\).r\(.*\)/mm_VERSION_MINIMYTH \?= \1.r${gitrel}/" ${mm_conf_file}
sed --in-place --follow-symlinks "s/^mm_VERSION_MINIMYTH.*\?=*\s\(.*\).r\(.*\)/mm_VERSION_MINIMYTH \?=       \1.r${gitrel}/" "${mm_home}/script/minimyth.conf.mk"
sed --in-place --follow-symlinks "s/^mm_VERSION_MINIMYTH.*\?=*\s\(.*\).r\(.*\)/mm_VERSION_MINIMYTH \?=       \1.r${gitrel}/" "${mm_home}/minimyth.conf.mk.example.aarch64"
sed --in-place --follow-symlinks "s/^mm_VERSION_MINIMYTH.*\?=*\s\(.*\).r\(.*\)/mm_VERSION_MINIMYTH \?=       \1.r${gitrel}/" "${mm_home}/minimyth.conf.mk.example.arm"
sed --in-place --follow-symlinks "s/^mm_VERSION_MINIMYTH.*\?=*\s\(.*\).r\(.*\)/mm_VERSION_MINIMYTH \?=       \1.r${gitrel}/" "${mm_home}/minimyth.conf.mk.example.x86-64"

make makesums garchive -C ${mm_home}/script/myth-${branch}/mythtv

echo " "
echo " Now ready to build myth-${branch} ..."
echo " "

echo "Press ANY key to build or Ctrl-C to break ..."
read

echo " "
echo "--------------------------------------------------------"
echo "     Building MM2"
echo "--------------------------------------------------------"
echo " "
echo "  -MM2 ver.   : ${version}"
echo "  -GIT branch : ${_gitbranch}"
if [ -z ${req_tree} ]; then
    echo "  -Req.GIT rev: HEAD"
else
    echo "  -Req.GIT rev: ${req_tree}"
fi
echo     "  -GIT rel.   : r${gitrel}"
echo     "  -GIT hash   : ${githash}"
echo " "
echo "--------------------------------------------------------"
echo " "

cd ${mm_home}/script/meta/minimyth

echo "==> Cleaning current MiniMyth2 image ..."
make clean

echo "==> Building ..."
time make rebuild-mythtv

echo "==> Instaling ..."
make install

echo "==>Done !"

exit 0
