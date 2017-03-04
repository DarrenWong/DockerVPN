# DockerVPN
Automated install IPsec VPN server on GCP (tested on Ubuntu 16.04)  based on https://github.com/hwdsl2/docker-ipsec-vpn-server

###Launch the GCP instance###
1. Launch Google Computing VM instance(Ubuntu 16.04) 
2. After launching the instance, click Network -> Firewall rules-> add firewall rule-> allow udp:500,4500 from 0.0.0.0/0(or the IP range you allow to login, this for VPN connection propose)

###Install docker VPN ###
ssh into VM instance and install Docker first(If you have Docker installed, skip this)
```
	sudo curl -fsSL https://get.docker.com/ | sh
```
Copy the scrpit into your PATH and cd into it, update your VPN_IPSEC_PSK,VPN_USER and VPN_PASSWORD in the run.sh(rows 13-15) then start the script
```
	sudo chmod +x run.sh | sudo ./run.sh
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
This script is for automated start Docker VPN propose, the docker VPN project please refer to https://github.com/hwdsl2/docker-ipsec-vpn-server
