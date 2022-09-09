#!/bin/bash

# Reset the worker nodes first since the path to them is through the control plane nodes
talosctl reset --graceful=false -n 192.168.10.21 -e 192.168.10.21 --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot
talosctl reset --graceful=false -n 192.168.10.22 -e 192.168.10.22 --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot
talosctl reset --graceful=false -n 192.168.10.23 -e 192.168.10.23 --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot

echo "Waiting for workers to reset... ^C to stop here"
sleep 5

# Reset the control plane nodes
talosctl reset --graceful=false -n 192.168.10.11 -e 192.168.10.11 --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot
talosctl reset --graceful=false -n 192.168.10.12 -e 192.168.10.12 --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot
talosctl reset --graceful=false -n 192.168.10.13 -e 192.168.10.13 --system-labels-to-wipe STATE --system-labels-to-wipe EPHEMERAL --reboot
