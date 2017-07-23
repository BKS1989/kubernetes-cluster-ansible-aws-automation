#!/bin/bash

etcdctl rm /kube-centos/network/config && etcdctl rmdir /kube-centos/network
if [ $? -eq 0 ];then
   etcdctl mkdir /kube-centos/network
   etcdctl mk /kube-centos/network/config "{ \"Network\": \"172.30.0.0/16\", \"SubnetLen\": 24, \"Backend\": { \"Type\": \"vxlan\" } }"
else
   echo "cannot delete the key"
fi
