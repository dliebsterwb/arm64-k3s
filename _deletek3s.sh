#!/bin/bash

NODE00_IP=10.12.71.60
NODE01_IP=10.12.71.61
NODE02_IP=10.12.71.62
NODE03_IP=10.12.71.63
NODE04_IP=10.12.71.64
NODE05_IP=10.12.71.65
NODE06_IP=10.12.71.66

USER=ubuntu

K3S_TOKEN=ILTsecretPi01
API_URL=lax-pi-api.vigilance.solutions




# clean k3s from nodes
for i in `seq 0 6`
  do 
    echo "Processing node: $i"

    ssh $USER@10.12.71.6${i} -i ~/.ssh/id_rsa sudo systemctl k3s.service k3s-agent.service  k3s-node.service disable --now
  
    ssh $USER@10.12.71.6${i} -i ~/.ssh/id_rsa sudo /usr/local/bin/k3s-killall.sh 
    ssh $USER@10.12.71.6${i} -i ~/.ssh/id_rsa sudo /usr/local/bin/k3s-uninstall.sh
    ssh $USER@10.12.71.6${i} -i ~/.ssh/id_rsa sudo rm -rf /etc/rancher
    ssh $USER@10.12.71.6${i} -i ~/.ssh/id_rsa sudo rm -rf /etc/systemd/system/k3s*
    ssh $USER@10.12.71.6${i} -i ~/.ssh/id_rsa sudo rm -rf /var/lib/rancher/*
    ssh $USER@10.12.71.6${i} -i ~/.ssh/id_rsa sudo rm -rf /var/lib/linstor-etcd
    ssh $USER@10.12.71.6${i} -i ~/.ssh/id_rsa sudo rm -rf /var/lib/longhorn
    ssh $USER@10.12.71.6${i} -i ~/.ssh/id_rsa sudo rm -rf /var/lib/rook
    ssh $USER@10.12.71.6${i} -i ~/.ssh/id_rsa sudo rm -rf /var/lib/cni
    ssh $USER@10.12.71.6${i} -i ~/.ssh/id_rsa sudo rm -rf /var/lib/kubelet

    # ssh $USER@10.12.71.6${i} -i ~/.ssh/id_rsa sudo sgdisk --zap-all /dev/sda
    # ssh $USER@10.12.71.6${i} -i ~/.ssh/id_rsa sudo sgdisk --zap-all /dev/sdb
    echo
  done

