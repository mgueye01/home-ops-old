#!/usr/bin/env bash
cd ~/homelab/provision/talos

export TALOSCONFIG=~/homelab/talos/clusterconfig/talosconfig

talosctl config node "192.168.10.11"; talosctl config endpoint 192.168.10.11 192.168.10.12 192.168.10.13 192.168.10.250

echo Applying master..
talosctl reset --graceful=false -n 192.168.10.11 --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot
talosctl reset --graceful=false -n 192.168.10.12 --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot
talosctl reset --graceful=false -n 192.168.10.13 --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot

echo Applying worker..
talosctl reset --graceful=false -n 192.168.10.21 --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot
talosctl reset --graceful=false -n 192.168.10.22 --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot
talosctl reset --graceful=false -n 192.168.10.23 --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot
