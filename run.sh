#!/bin/sh
# Auto script to configure and start an IPsec VPN server
# Tested on GCP Ubuntu 16.04.2 LTS with Docker version 17.03.0-ce
# Based on the work of docker-ipsec-vpn-server(https://github.com/hwdsl2/docker-ipsec-vpn-server)

#for docker installation
#curl -fsSL https://get.docker.com/ | sh
#install dockerVPN
#set username and password for vpn
mkdir vpnenv
cd $PWD/vpnenv
tee vpn.env<<EOF 
VPN_IPSEC_PSK=yourpsk
VPN_USER=youruser
VPN_PASSWORD=yourpassword
EOF
#Start the IPsec VPN server
sudo modprobe af_key
#Create a new Docker container from this image
sudo docker run \
    --name ipsec-vpn-server \
    --env-file $PWD/vpn.env \
    --restart=always \
    -p 500:500/udp \