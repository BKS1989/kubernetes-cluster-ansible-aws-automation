#!/bin/bash
kube_centos_exist=`etcdctl get /kube-centos/network/config`
if (( $?==0 ));then
  echo "key exist"
else
   etcdctl mkdir /kube-centos/network
   etcdctl mk /kube-centos/network/config "{ \"Network\": \"172.30.0.0/16\", \"SubnetLen\": 24, \"Backend\": { \"Type\": \"vxlan\" } }"
fi
