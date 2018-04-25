#!/bin/bash
sleep 30
# Enable forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward
# create tun for build server
ip addr add dev enp0s8 172.16.22.5/30
ip tuntap add name tun0 mode tun
ip addr add dev tun0 172.16.22.9/30
ip link set up tun0
ssh -f -w 0:0 root@build "sleep 1000000000"
# create network for wip server
ip tuntap add name tun1 mode tun
ip addr add dev tun1 172.16.22.13/30
ip link set up tun1
ssh -f -w 1:1 root@wip "sleep 1000000000"