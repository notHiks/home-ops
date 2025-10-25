Due to the different nodes have different drives avaliable for storage labels are used to split out the config.

/dev/sda

kubectl label nodes fuu-01 topology.kubernetes.io/zone=a

/dev/sdb

kubectl label nodes hikaru-01 topology.kubernetes.io/zone=b
kubectl label nodes umi-01 topology.kubernetes.io/zone=b
