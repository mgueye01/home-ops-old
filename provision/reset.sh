#!/bin/bash

# Reset the worker nodes first since the path to them is through the control plane nodes
talosctl reset --graceful=false --reboot -n k8s-1.g-eye.tech -e k8s-1.g-eye.tech
talosctl reset --graceful=false --reboot -n k8s-2.g-eye.tech -e k8s-2.g-eye.tech
talosctl reset --graceful=false --reboot -n k8s-3.g-eye.tech -e k8s-3.g-eye.tech

echo "Waiting for workers to reset... ^C to stop here"
sleep 5

# Reset the control plane nodes
talosctl reset --graceful=false --reboot -n master1.g-eye.tech -e master1.g-eye.tech
talosctl reset --graceful=false --reboot -n master2.g-eye.tech -e master2.g-eye.tech
talosctl reset --graceful=false --reboot -n master3.g-eye.tech -e master3.g-eye.tech
