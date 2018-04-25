#!/bin/bash
ip addr add 172.16.22.6/30 dev enp0s3
ip route add 172.16.22.4/30 dev enp0s3
ip route add 172.16.22.0/30 via 172.16.22.5 metric 5
ip route add 172.16.22.8/30 via 172.16.22.5 metric 5
ip route add 172.16.22.12/30 via 172.16.22.5 metric 5