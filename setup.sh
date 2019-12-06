#!/bin/bash

lanid=3
ifconfig lo${lanid} create inet 192.168.0.${lanid} netmask 255.255.255.0

#TODO : Add update pf.conf file for packet filter settings (NAT & listening ports !)

wget -O /tmp/pkglist.json https://raw.githubusercontent.com/swstechdev/freenas/master/pkg-list.json 
iocage create -r 11.2-RELEASE -p /tmp/pkglist.json -n storjadmin allow_raw_sockets=1 defaultrouter="192.168.1.${landid}" resolver="nameserver 192.168.1.1; nameserver 8.8.8.8"  ip4_addr="lo${landid}|192.168.0.${landid}/24"

wget -O /tmp/storjadmin.json  https://raw.githubusercontent.com/swstechdev/freenas/master/storjadmin.json 
iocage fetch -P dhcp=on vnet=on bpf=yes -n /tmp/storjadmin.json --branch 'master'

iocage exec storjadmin git clone https://github.com/swstechdev/freenas.git /root/storjadmin
sudo iocage exec storjadmin bash /root/storjadmin/post_install.sh standard

