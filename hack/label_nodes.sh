kubectl label node k8s-3 node-role.kubernetes.io/worker=true --overwrite
kubectl label node k8s-1 node-role.kubernetes.io/worker=true --overwrite
kubectl label node k8s-2 node-role.kubernetes.io/worker=true --overwrite
kubectl taint node master1 node-role.kubernetes.io/control-plane="":NoSchedule
kubectl taint node master2 node-role.kubernetes.io/control-plane="":NoSchedule
kubectl taint node master3 node-role.kubernetes.io/control-plane="":NoSchedule
