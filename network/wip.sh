#!/bin/bash
sleep 30
# allow internal traffic
iptables -A INPUT -s 172.16.22.24 -j ACCEPT
# Enable forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward
# Create tun for router
ip tuntap add name tun1 mode tun
ip addr add dev tun1 172.16.22.14/30
ip link set up tun1
ip route add 172.16.22.0/30 via 172.16.22.14 metric 5
ip route add 172.16.22.4/30 via 172.16.22.14 metric 5
ip route add 172.16.22.8/30 via 172.16.22.14 metric 5
ip route add 172.16.22.12/30 via 172.16.22.14 metric 5
# Create tun for build
ip tuntap add name tun3 mode tun
ip addr add dev tun3 172.16.22.18/30
ip link set up tun3
ip route add 172.16.22.16/30 via 172.16.22.18 metric 5
# forward port 2222 to gitlab
systemctl stop ufw
iptables -I INPUT -p tcp --dport 2222 -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 2222 -j DNAT --to-destination 172.16.22.6:22
iptables -t nat -A POSTROUTING -p tcp --dport 22 -d 172.16.22.6 -j SNAT --to-source 172.16.22.14
