# freenas storj plugin
FreeNAS plugin to support StorJ binary in FreeNAS Jailed environment

1) setup.sh provides setup steps to establish Jail 
2) It includes launch of post install shell inside Jail 

If required in case of error, steps can be run manually at a time, while checking 
for conflicts 
(A) in specific configuration files:
  - /etc/rc.conf  
  - /etc/pf.conf (packet filter)
(B) In network addresses (192.168.0.* range)
(C) iocage launch issues (RELEASE,  Network address etc)

TODO: 
(1) Launch Main binary of storj 
(2) Port redirection if required


DEFAULT SETTINGS
================
1) Port for servicing on host environment : 8080


Reference: https//www.ixsystems.com/documentation/freenas/11.2/plugins.html 
