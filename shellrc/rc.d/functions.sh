function usepy2() {
  sudo rm /usr/bin/python
  sudo ln -s /usr/bin/python2 /usr/bin/python
}

function usepy3() {
  sudo rm /usr/bin/python
  sudo ln -s /usr/bin/python3 /usr/bin/python
}

function focus() {
  sudo rm /etc/hosts
  sudo ln -s /etc/hosts.focus /etc/hosts
}

function unfocus() {
  sudo rm /etc/hosts
  sudo ln -s /etc/hosts.normal /etc/hosts
}
