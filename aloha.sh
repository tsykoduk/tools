#!/bin/bash

command="$1"
region="${2:-aloha-east}"
username="$(whoami)"

usage() {
  echo -e "Usage: aloha COMMAND"
  echo ""
  echo -e "Commands:"
  echo -e "  connect [vpn-region] - establish new vpn connection"
  echo -e "  disconnect           - disconnect active vpn connection"
  echo -e "  status               - view vpn connection status"
  echo -e "  ip                   - get current public ip address"
  echo -e "  web                  - opens aloha web login"
  echo ""
  exit 1
}

connect() {
  password="" # password from cmdline
  code="" # 2fa code
  
  read -sp 'VPN Password: ' password
  osascript -e 'if application "yubiswitch" is running then tell application "yubiswitch" to KeyOn'
  echo
  read -n 8 -sp '2fa: ' code
  osascript -e 'if application "yubiswitch" is running then tell application "yubiswitch" to KeyOff'
  
  echo
  echo -e "☎️  Connecting to ${region}..."
  res=$(echo -e "${username}\n${password}/otp\n${code}\ny\n" | /opt/cisco/anyconnect/bin/vpn -s connect ${region} 2>&1)
  check=$(echo ${res} | tail -n 5 | grep -c "Connected")
  
  if [ "$check" == "1" ]; then
    echo -e "✅ Connected"
  else
    echo -e "❌ Failed"
    echo -e $res
  fi
}

disconnect() {
  res=$(/opt/cisco/anyconnect/bin/vpn disconnect)
  if [ $? -eq 0 ]; then 
    echo -e "👋 Successfully disconnected"
  else
    echo -e "❌ Failed"
    echo -e $res
  fi
}

status() {
  state=$(/opt/cisco/anyconnect/bin/vpn state | awk '/state/ {print $4}' | head -n 1)
  case "$state" in
    Connected)
      echo -e "✅ ${state}"
      ;;
    Disconnected)
      echo -e "❌ ${state}"
      ;;
    *)
      echo -e "❓ ${state}"
      ;;
  esac
}

ip() {
  curl -4 -s https://ifconfig.co
}

web() {
  open "https://aloha.my.salesforce.com"
}

case $command in
  connect|disconnect|status|ip|web)
    $command
    ;;
  *)
    usage
    ;;
esac
