#!/bin/bash

set -x

export SERVERIP_01=10.12.71.60
export NODEIP_01=10.12.71.61
export NODEIP_02=10.12.71.62
export NODEIP_03=10.12.71.63
export NODEIP_04=10.12.71.64
export NODEIP_05=10.12.71.65
export NODEIP_06=10.12.71.66

export USER="ubuntu"
export LOCAL_KCONF='~/.kube/confg-lax-pi'
export REMOTE_KCONF='/etc/rancher/k3s/k3s.yaml'
export HOME="/Users/dliebster"

K3S_TOKEN="ILTsecretPi01"
API_URL=lax-pi-api.vigilance.solutions


# launch master
k3sup install --ip ${SERVERIP_01} --user ${USER}  --tls-san ${API_URL} --local-path   ${HOME}/.kube/config-lax-pi

# add nodes
for i in `seq 1 6`
  do 
    export NODE=NODEIP_0${i}
    echo "Node $NODE"
    k3sup join --ip 10.12.71.6${i} --server-ip ${SERVERIP_01} --user ${USER}
  done

EXPORT KUBECONFIG="~/.kube/config-lax-pi"
kubectl get nodes -o wide
 
# add csi once determined

