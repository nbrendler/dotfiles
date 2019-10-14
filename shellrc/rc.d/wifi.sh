interface=`ls /sys/class/net | grep wlp`
alias loadwifi='sudo wpa_supplicant -B -i $interface -c '

function killwifi() {
  PID=$(ps axf | grep wpa_supplicant | grep -v grep | awk '{print $1}')

  if [ -n "${PID}" ]
  then
    echo "Found PID: ${PID}, killing"
    sudo kill $PID
    while sudo kill -0 $PID 2>/dev/null
    do
      echo 'waiting for process to be kilt'
      sleep 1
    done
  fi

  sudo ip link set $interface down
}

function random_wifi() {
  killwifi && sudo wifi-menu && ping_til_up
}

function work_wifi() {
  killwifi && loadwifi /etc/wpa_supplicant/work.conf && ping_til_up
}

function home_wifi() {
  killwifi && loadwifi /etc/wpa_supplicant/home.conf && ping_til_up
}

function phone_wifi() {
  killwifi && loadwifi /etc/wpa_supplicant/phone.conf && ping_til_up
}

function ping_til_up() {
  while true;
  do ping -c1 www.google.com > /dev/null 2>&1 && break || echo 'waiting...' && sleep 1;
  done
  echo 'connected!'
}
