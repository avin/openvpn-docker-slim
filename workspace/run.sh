echo 1 | tee /proc/sys/net/ipv4/ip_forward
modprobe iptable_nat
cp /etc/openvpn/ovpn.key /data/keys/
openvpn /etc/openvpn/openvpn.conf