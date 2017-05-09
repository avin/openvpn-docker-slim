echo 1 | tee /proc/sys/net/ipv4/ip_forward
modprobe iptable_nat
iptables -t nat -A POSTROUTING -s 10.4.0.1/2 -o eth0 -j MASQUERADE
cp /etc/openvpn/ovpn.key /data/keys/
openvpn /etc/openvpn/openvpn.conf