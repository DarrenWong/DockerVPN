# DockerVPN
IPsec VPN automated installation on AWS and GCP (tested on Ubuntu 16.04)  based on https://github.com/hwdsl2/docker-ipsec-vpn-server

###VM instance###
Launch AWS or GCP Ubuntu 16.04 instance(testing on Ubuntu 16.04 only) and allow udp: 500 and 4500 inbound 

1. AWS: NETWORK & SECURITY ->choose your Security Group for the instance, add rule for allowing udp:500,4500 from 0.0.0.0/0(or the IP range you allow to login, this for VPN connection propose)

2. GCP: click Network -> Firewall rules-> add firewall rule-> allow udp:500,4500 from 0.0.0.0/0

###Install docker VPN ###
ssh into VM instance and install Docker first(If you have Docker installed, skip this)
```
	sudo curl -fsSL https://get.docker.com/ | sh
```
Copy the scrpit into your PATH and cd into it, update your VPN_IPSEC_PSK,VPN_USER and VPN_PASSWORD in the run.sh(rows 13-15) then start the script
```
	sudo chmod +x run.sh
	sudo ./run.sh
```
###VPN Logs and others###
VPN login details
```
	sudo docker logs ipsec-vpn-server
```
Check server status
```
	sudo docker exec -it ipsec-vpn-server ipsec status
```
###VPN Client###
Get your computer or device to use the VPN. Please refer to:

[Configure IPsec/L2TP VPN Clients](https://github.com/hwdsl2/setup-ipsec-vpn/blob/master/docs/clients.md)

## Important notes
This script is for VPN Automated deployment propose, the docker VPN project please refer to https://github.com/hwdsl2/docker-ipsec-vpn-server
