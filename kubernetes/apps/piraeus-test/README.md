Since each node in the cluster has different storage devices available, we use Kubernetes zone labels to group them logically based on their physical drive locations.These zone labels let us tell LINSTOR (and Kubernetes in general) which nodes belong to which “storage zone.”


```
# Zone A
kubectl label node fuu-01 topology.kubernetes.io/zone=a

# Zone B
kubectl label node hikaru-01 topology.kubernetes.io/zone=b
kubectl label node umi-01 topology.kubernetes.io/zone=b
```
```
                        ┌────────────────────────────┐
                        │       LINSTOR Pool:        │
                        │           data             │
                        └────────────────────────────┘
                                      │
          ┌───────────────────────────┬────────────────────────────┐
          │                           │                            │
┌─────────────────────┐     ┌─────────────────────┐     ┌─────────────────────┐
│ Zone A              │     │ Zone B              │     │ Zone B              │
│─────────────────────│     │─────────────────────│     │─────────────────────│
│ Node: fuu-01        │     │ Node: hikaru-01     │     │ Node: umi-01        │
│ Device: /dev/sda    │     │ Device: /dev/sdb    │     │ Device: /dev/sdb    │
│ Role: Local volume  │     │ Role: Local volume  │     │ Role: Local volume  │
└─────────────────────┘     └─────────────────────┘     └─────────────────────┘

            All nodes share the same LINSTOR storage pool (data)
```