# DockerVPN
Automated install IPsec VPN server on GCP (tested on Ubuntu 16.04)  based on https://github.com/hwdsl2/docker-ipsec-vpn-server

###Step1:###
1. Lunch Google Computing VM instance(Ubuntu 16.04) 
2. After launching the instance, click Network -> Firewall rules-> add firewall rule-> allow udp:500,4500	from 0.0.0.0/0(or the IP range you allow to login)

###Step2:###
1. ssh into VM instance and install Docker first(If you have Docker installed, skip this)
```
	sudo curl -fsSL https://get.docker.com/ | sh
```
2. Copy the run.sh into your PATH, then git clone or download the zip
3. Cd into your run.sh and get permission to run.sh then start the script
```
	sudo chmod +x run.sh | ./run.sh
```
