#!/bin/bash

# Reset the worker nodes first since the path to them is through the control plane nodes
talosctl reset --graceful=false --reboot -n 192.168.10.21 -e 192.168.10.21
talosctl reset --graceful=false --reboot -n 192.168.10.22 -e 192.168.10.22
talosctl reset --graceful=false --reboot -n 192.168.10.23 -e 192.168.10.23

echo "Waiting for workers to reset... ^C to stop here"
sleep 5

# Reset the control plane nodes
talosctl reset --graceful=false --reboot -n 192.168.10.11 -e 192.168.10.11
talosctl reset --graceful=false --reboot -n 192.168.10.12 -e 192.168.10.12
talosctl reset --graceful=false --reboot -n 192.168.10.13 -e 192.168.10.13
