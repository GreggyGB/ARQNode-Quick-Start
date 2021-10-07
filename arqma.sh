#! /bin/bash

install_checks () {
sudo apt install git
    install_node
}

install_node () {
  sudo apt install wget unzip
  sudo apt update
  sudo apt-get install  build-essential cmake pkg-config libboost-all-dev libssl-dev libzmq3-dev libunbound-dev libsodium-dev libunwind8-dev liblzma-dev libreadline6-dev libldns-dev libexpat1-dev doxygen graphviz libpgm-dev qttools5-dev-tools libhidapi-dev libusb-dev libprotobuf-dev protobuf-compiler
  git clone --recursive 'https://github.com/malbit/arqma' arqma && cd arqma
  git submodule init && git submodule update
  git submodule update --init --force external/libzmq
  git checkout s_nodes
  make

  cd build/Linux/s_nodes/release && mv bin ~/
  cd
  mv bin arqnode
  rm /etc/systemd/system/arqnode.service
  sudo cp ~/arqma/arqnode.service /etc/systemd/system/
  sudo systemctl daemon-reload
  sudo systemctl enable eqnode.service
  sudo systemctl start eqnode.service
}

prepare_sn () {
  ~/arqnode/arqmad --stagenet prepare_registration
}

start () {
  systemctl start eqnode.service
  echo Service node started to check it works use bash arqma.sh log
}

status () {
  ~/arqnode/arqmad --stagenet status
  #systemctl status arqnode.service
}

stop_all_nodes () {
  echo Stopping ARQ node
  sudo systemctl stop arqnode.service
}

log () {
  sudo journalctl -u arqnode.service -af
}

update () {
  git pull
}

#fork_update () {
#  rm -r ~/arqma/arqma
#  git clone --recursive 'https://github.com/malbit/arqma' arqma && cd arqma
#  git submodule init && git submodule update
#  git checkout s_nodes
#  make
#  sudo systemctl stop arqnode.service
#  rm -r ~/arqma
#  cd build/Linux/s_nodes/release && mv bin ~/
#  cd
#  mv bin arqnode
#  sudo systemctl enable arqnode.service
#  sudo systemctl start arqnode.service
#}

case "$1" in
  install ) install_checks ;;
  prepare_sn ) prepare_sn ;;
  start ) start ;;
  stop ) stop_all_nodes ;;
  status ) status ;;
  log ) log ;;
  update ) update ;;
  #fork_update ) fork_update ;;
esac
