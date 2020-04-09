#
# Script:
# 1. clones mythtv sources in ${mm_home}/source/git-mythtv-{branch}
# 2. makes mythtv sources archive file:
#    mythtv-{branch}-{date}-{githash}.tar.bz2 in
#    directory ${mm_home}/source/git-mythtv-{branch}
# 3. Updates ver.string in:
#     ${mm_home}/script/myth-{branch}/mythtv/package-api.mk
#     ${mm_home}/html/minimyth/document-changelog.txt
#     ${HOME}/.minimyth2/minimyth.conf.mk
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
test_branch_name="devel/2020-player"
# Dir where myth test branch sources will be
test_git_src_dir="git-mythtv-2020-player"

# Location of MiniMyth2 main build config file
mm_conf_file="${HOME}/.minimyth2/minimyth.conf.mk"






















#--------------------------------------------------------------

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

echo " Cloned GIT rel  : r${gitrel}"
echo " Cloned GIT hash : ${githash}"

arch_file="mythtv-${branch}-${stamp}-${githash}.tar.bz2"
arch_dir="${git_src_home}/mythtv-${branch}-${stamp}-${githash}"

if [ ! -e ${arch_dir}/${arch_file} ]; then

  echo "==> No (${arch_file}) archive..."
  echo "==> Creating (${arch_file})..."
  rm -rf ${arch_dir}
  mkdir ${arch_dir}
  cp -r  $srcdir/. ${arch_dir}/
  cd ${arch_dir}/
  find . -name '.git' | xargs /bin/rm -rf
  cd ../
  tar -cjf ${arch_file} ./mythtv-${branch}-${stamp}-${githash}
  rm -rf ${arch_dir}

  mkdir ${arch_dir}
  mv ${arch_file} ${arch_dir}/

else

  echo "==> (${arch_file}) archive present..."

fi

echo "==> Updating version in (${mm_home}/html/minimyth/document-changelog.txt)"
sed -i "0,/\s*-update\s*mythtv\s*to\s*r.*/ s/\s*-update\s*mythtv\s*to\s*r.*/  -update mythtv to r${gitrel}/" ${mm_home}/html/minimyth/document-changelog.txt

echo "==> Updating SVN ver. in (${mm_home}/script/myth-${branch}/mythtv/package-api.mk)"
sed -i 's/MYTHTV_SVN_VERSION =.*/MYTHTV_SVN_VERSION = '${stamp}-${githash}'/' "${mm_home}/script/myth-${branch}/mythtv/package-api.mk"
echo "==> Updating GIT hash in (${mm_home}/script/myth-${branch}/mythtv/package-api.mk)"
sed -i 's/MYTHTV_GIT_VERSION =.*/MYTHTV_GIT_VERSION = '${gitversion}'/' "${mm_home}/script/myth-${branch}/mythtv/package-api.mk"

echo "==> Updating version in (${mm_conf_file})"
sed -i "s/^mm_VERSION_MINIMYTH.*\?=*\s\(.*\).r\(.*\)/mm_VERSION_MINIMYTH \?= \1.r${gitrel}/" ${mm_conf_file}

echo " "
echo "Now ready to build myth-${branch} ..."
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
