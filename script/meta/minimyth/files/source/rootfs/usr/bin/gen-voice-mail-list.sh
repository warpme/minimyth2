#!/bin/sh

# Sctipt scans for voice-mail recodring files and generates myhtv theme
# XML file with list of recordings.

#. /etc/sip-daemon.conf

theme_xml_out_file="/home/minimyth/.mythtv/voice-mail-recordings.xml"
vm_recordings_dir="/usr/local/share/voice-mail/"
debug=0
version="1.0"





#-------------------------------------------------------------------------------


#hosts_list=`echo ${bt_mac_to_control_zm} | sed -e 's/,/ /g'`

Log() {
  echo >&2 "`date '+%H:%M:%S.%N'`: $*"
}

Debug() {
  if [ $debug = 1 ]; then
    echo >&2 "`date '+%H:%M:%S.%N'`: $*"
  fi
}

Die() { echo >&2 "$*"; exit 1; }

GenEntry() {
  local text=$1
  local desc=$2
  local action=$3

  echo " " >> ${theme_xml_out_file}
  echo "  <button>" >> ${theme_xml_out_file}
  echo "    <type>PHONE</type>" >> ${theme_xml_out_file}
  echo "    <text>${text}</text>" >> ${theme_xml_out_file}
  echo "    <description>${desc}</description>" >> ${theme_xml_out_file}
  echo "    <action>${action}</action>" >> ${theme_xml_out_file}
  echo "  </button>" >> ${theme_xml_out_file}
  echo " " >> ${theme_xml_out_file}
}


Log ""
Log "Voice-mail Theme list generator v$version (c)Piotr Oniszczuk"

action=$1

if [[ x${action} = "xdelete-all" ]]; then
  Log "Deleting Voice-mail recordings ..."
  rm -f ${vm_recordings_dir}voice-mail-recording*.wav
fi

# File format:
# voice-mail-recording,25-Jun-2016,15:11,phone:208.wav

rm -f ${theme_xml_out_file} 2>/dev/null

files=`ls -1 ${vm_recordings_dir}voice-mail-recording*.wav 2>/dev/null`
Debug "Discovered recordings:"
Debug "${files}"

touch ${theme_xml_out_file}
echo "<mythmenu name=\"PHONE\"" > ${theme_xml_out_file}

if [[ -z "${files}" ]]; then

  Log "No voice-mail recodrings detected. Generation empty XML file..."

  echo "<mythmenu name=\"PHONE\"" > ${theme_xml_out_file}
  GenEntry 'Brak Nagrań' '--' ''

else

  GenEntry 'Skasuj' 'Wszystkie' 'EXEC /usr/bin/gen-voice-mail-list.sh delete-all'

  for recording in ${files} ; do
      Log "Generating entry for ${recording} file..."
      date=`echo ${recording} | sed -e "s|${vm_recordings_dir}voice-mail-recording,||" -e 's/\(^.*\),\(.*\),phone:\(.*\).wav/\1/'`
      time=`echo ${recording} | sed -e "s|${vm_recordings_dir}voice-mail-recording,||" -e 's/\(^.*\),\(.*\),phone:\(.*\).wav/\2/'`
      number=`echo ${recording} | sed -e "s|${vm_recordings_dir}voice-mail-recording,||" -e 's/\(^.*\),\(.*\),phone:\(.*\).wav/\3/'`
      Debug "Date  : ${date}"
      Debug "Time  : ${time}"
      Debug "Number: ${number}"

      GenEntry "${date},${time}" "${number}" "EXEC aplay ${recording}"
  done

fi

echo "</mythmenu>" >> ${theme_xml_out_file}

if [ $debug = 1 ]; then
  Debug "--Generated XML file--"
  cat ${theme_xml_out_file}
  Debug "--Generated XML file--"
fi


exit 0
