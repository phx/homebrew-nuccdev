#!/bin/bash

CONFIG_DIR='/Library/Application Support/BOINC Data'
PROJECT_URL="${PROJECT_URL:-http://boinc.bakerlab.org/rosetta/}"
WEAK_KEY="${WEAK_KEY:-2108683_fdd846588bee255b50901b8b678d52ec}"
#BOINC_GUI_RPC_PASSWORD='123'
CC_CONFIG='<cc_config>
   <options>
       <allow_remote_gui_rpc>1</allow_remote_gui_rpc>
   </options>
</cc_config>'

# If password not set by env, prompt to set it:
if [[ -z $HOMEBREW_BOINC_GUI_RPC_PASSWORD ]]; then
  echo
  read -rp 'Please enter a value for the BOINC GUI RPC password: ' HOMEBREW_BOINC_GUI_RPC_PASSWORD
  echo -e 'This can be changed at any time by changing the value in gui_rpc_auth.cfg\n'
fi

echo "$HOMEBREW_BOINC_GUI_RPC_PASSWORD" > "${CONFIG_DIR}/gui_rpc_auth.cfg"
echo "The BOINC GUI RPC password has been set to '${HOMEBREW_BOINC_GUI_RPC_PASSWORD}'."
echo "This can be changed at any time by changing the value in ${CONFIG_DIR}/gui_rpc_auth.cfg"
echo "$CC_CONFIG" > "${CONFIG_DIR}/cc_config.xml"
echo '127.0.0.1' > "${CONFIG_DIR}/remote_hosts.cfg"

(/Applications/BOINCmanager.app/Contents/Resources/boinc -redirectio -dir "${CONFIG_DIR}/" --daemon --allow_remote_gui_rpc --attach_project "${PROJECT_URL}" "${WEAK_KEY}" &) >/dev/null 2>&1
open /Applications/BOINCManager.app
