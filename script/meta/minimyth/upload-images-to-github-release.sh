
# Script:
# creates new release (if ther is no any release at GutHub
# uploads all files from <images_dir> matching <images_name_wildchar>

. ${HOME}/.minimyth2/github-upload-settings.conf

# github-upload-settings.conf should contain:
#
# api access to GitHub:
# github_owner="<OWNER>"
# github_repo="<REPO>"
# github_token="<TOKEN>"

# data used when new release is created:
# release_name="<NAME>"
# tag_name="<TAG NAME>"
# release_description="<RELEASE DESCRIPTION>"

# upload files loc & filename match wildchar
# images_name_wildchar="<FILENAME WILDCHAR>"
# images_dir="PATH"




















ver="1.0"

if [ ! -f ${HOME}/.minimyth2/github-upload-settings.conf ] ; then
    echo " "
    echo "Error: Can't find github-upload-settings.conf file !"
    echo "Exiting..."
    echo " "
    exit 1
fi

if [ ! -d ${images_dir} ] ; then
    echo " "
    echo "Error: images_dir directory not exists !"
    echo "Exiting..."
    echo " "
    exit 1
fi

log="${HOME}/github_upload.log"
github_url="https://api.github.com/repos/${github_owner}/${github_repo}"
upload_github_url="https://uploads.github.com/repos/${github_owner}/${github_repo}"

create_release() {
  api_payload='{"tag_name":"'"${tag_name}"'","target_commitish":"master","name":"'"${release_name}"'","body":"'"${release_description}"'","draft":false,"prerelease":false,"generate_release_notes":false}'

  curl -s -L \
    -X POST \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer ${github_token}" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    ${github_url}/releases \
    -d "${api_payload}" >> ${log}
}

get_release_id() {
  curl -s q -L \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer ${github_token}" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    ${github_url}/releases/latest > $$
    cat $$ >> ${log}
    release_id=$(cat $$ | grep '"id": ' | head -1 | sed 's/[^0-9]//g')
    rm $$
}

list_release_assets() {
  curl -s -L \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer ${github_token}" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    ${github_url}/releases/${release_id}/assets > $$
    echo "  Assets in release:"
    cat $$ >> ${log}
    cat $$ | grep 'browser_download_url' | sed -e 's/"browser_download_url":/  /g'
    rm $$
    echo " "
}

upload_file() {
  path=$1
  file=$2

  curl -s -L \
    -X POST \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer ${github_token}" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    -H "Content-Type: application/octet-stream" \
    "${upload_github_url}/releases/${release_id}/assets?name=${file}" \
    --data-binary "@${path}/${file}" > $$
    cat $$ >> ${log}
    cat $$ | grep 'Failed'
    rm $$
}

echo " "
echo "Script version:${ver} (c)Potr Oniszczuk"
echo " "

rm ${log} 2>/dev/null

get_release_id

if [ x${release_id} = "x" ] ; then
  echo "No any release discovered. Creating new one ..."
  echo "==> Creating release with:"
  echo "  -tag: ${tag_name}"
  echo "  -name: ${release_name}"
  echo "  -description: \"${release_description}\""
  echo " "
  create_release
  get_release_id
else
  list_release_assets
fi

files_to_upload=$(ls -1 ${images_dir} | grep ${images_name_wildchar})

for file in ${files_to_upload} ; do
  echo "==> uploading ${file}"
  upload_file ${images_dir} ${file}
done

exit 0
