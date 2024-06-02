#!/bin/bash

# Définition des adresses IP et des noms des machines
declare -A machines=(
  ["r(eth0)"]="172.16.193.1"
  ["r(eth1)"]="172.16.192.129"
  ["r(eth2)"]="172.16.193.129"
  ["r_p(eth0)"]="172.16.199.254"
  ["r_p(eth1)"]="172.16.193.2"
  ["r_c(eth0)"]="172.16.195.254"
  ["r_c(eth1)"]="172.16.192.130"
  ["r_s(eth0)"]="172.16.192.126"
  ["r_s(eth1)"]="172.16.193.130"
  ["pca(eth0)"]="172.16.196.1"
  ["pcb(eth0)"]="172.16.196.2"
  ["sf(eth0)"]="172.16.192.1"
  ["internet"]="1.1.1.1"
)

# Fonction pour vérifier l'accessibilité de chaque machine
check_connectivity() {
  local name=$1
  local ip=$2

  if ping -c 1 -W 1 "$ip" > /dev/null 2>&1; then
    echo "OK: $name est accessible"
  else
    echo "KO: $name ($ip) n'est pas accessible"
  fi
}

# Parcourir les machines et vérifier leur accessibilité
for name in "${!machines[@]}"; do
  check_connectivity "$name" "${machines[$name]}"
done
