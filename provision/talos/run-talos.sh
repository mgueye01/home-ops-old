#!/usr/bin/env bash
cd ~/homelab/provision/talos
talhelper genconfig

export TALOSCONFIG=~/homelab/talos/clusterconfig/talosconfig

talosctl config node "192.168.10.11"; talosctl config endpoint 192.168.10.11 192.168.10.12 192.168.10.13 192.168.10.250

echo Applying master..
talosctl apply-config --insecure --nodes 192.168.10.11 --file clusterconfig/homelab-master1.yaml
talosctl apply-config --insecure --nodes 192.168.10.12 --file clusterconfig/homelab-master2.yaml
talosctl apply-config --insecure --nodes 192.168.10.13 --file clusterconfig/homelab-master3.yaml

echo Applying worker..
talosctl apply-config --insecure --nodes 192.168.10.21 --file clusterconfig/homelab-k8s-1.yaml
talosctl apply-config --insecure --nodes 192.168.10.22 --file clusterconfig/homelab-k8s-2.yaml
talosctl apply-config --insecure --nodes 192.168.10.23 --file clusterconfig/homelab-k8s-3.yaml

echo Sleep..
sleep 120

echo Running bootstrap..
talosctl bootstrap

echo Sleep..
sleep 180

talosctl kubeconfig -f ..
export KUBECONFIG=~/homelab/provision/kubeconfig

echo kubectl get no
kubectl get no
