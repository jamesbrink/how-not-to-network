#!/bin/bash
sleep 30
# allow internal traffic
iptables -A INPUT -s 172.16.22.24 -j ACCEPT
# Enable forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward
# Create tun for router
ip tuntap add name tun0 mode tun
ip addr add dev tun0 172.16.22.10/30
ip link set up tun0
ip route add 172.16.22.0/30 via 172.16.22.10 metric 5
ip route add 172.16.22.4/30 via 172.16.22.10 metric 5
ip route add 172.16.22.8/30 via 172.16.22.10 metric 5
ip route add 172.16.22.12/30 via 172.16.22.10 metric 5
# Create tun for wip
ip tuntap add name tun2 mode tun
ip addr add dev tun2 172.16.22.17/30
ip link set up tun2
ip route add 172.16.22.16/30 via 172.16.22.17 metric 5