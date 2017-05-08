echo 1 | tee /proc/sys/net/ipv4/ip_forward
modprobe iptable_nat
openvpn /etc/openvpn/openvpn.conf