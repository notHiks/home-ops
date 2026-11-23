---
apiVersion: v1alpha1
kind: LinkAliasConfig
name: ethSel0
selector:
  match: 'mac(link.permanent_addr) == "{{ .Node.Data.macAddr }}" || (mac(link.hardware_addr) == "{{ .Node.Data.macAddr }}" && (link.slave_kind != "bond" || link.alias == "ethSel0"))'
---
apiVersion: v1alpha1
kind: BondConfig
name: bond0
links:
  - ethSel0
bondMode: active-backup
mtu: {{ .Node.Data.mtu }}
addresses:
  - address: "{{ .Node.IP }}/24"
routes:
  - gateway: "192.168.99.1"
{{- if eq .Node.Role "control-plane" }}
---
apiVersion: v1alpha1
kind: Layer2VIPConfig
link: bond0
name: "192.168.99.60"
{{- end }}
