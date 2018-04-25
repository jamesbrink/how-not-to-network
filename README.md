# This is how not to setup your network.

This is what happens when people refuse to setup proper networking 


¯\_(ツ)_/¯  



SSH vpn between the following nodes:

  - router 172.16.22.1/30
  - mac 172.16.22.2/30
  - gitlab 172.16.22.6/30
  - build 172.16.22.10/30
  - wip (wip) 172.16.22.14/30


Each node has a script in the `/root/router.sh` that is responsibile for bringing up the network. 
This script is setup in crontab to execute on boot. 

The network is broken up as follows:


```
172.16.22.0/30    172.16.22.1(router)   <--->     172.16.22.2(mac)
172.16.22.4/30    172.16.22.5(router)   <--->     172.16.22.6(gitlab)
172.16.22.8/30    172.16.22.9)router)   <--->     172.16.22.10(build)
172.16.22.12/30   172.16.22.13(router)  <--->     172.16.22.14(wip)
172.16.22.16/30   172.16.22.17i(build)  <--->     172.16.22.18(wip)

```
