#!/bin/sh
sudo ifconfig en5 alias 172.16.22.2 255.255.255.252
sudo route -n add 172.16.22.4/30 172.16.22.1
sudo route -n add 172.16.22.8/30 172.16.22.1
sudo route -n add 172.16.22.12/30 172.16.22.1