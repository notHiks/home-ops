Set Zones to control which /dev resource to use.

/dev/sda

kubectl label nodes fuu-01 topology.kubernetes.io/zone=a

/dev/sdb

kubectl label nodes hikaru-01 topology.kubernetes.io/zone=b
kubectl label nodes umi-01 topology.kubernetes.io/zone=b
