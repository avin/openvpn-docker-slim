# Docker 3proxy slim container
OpenVPN docker container based on alpine

## Build & run

```
docker build -t openvpn .
docker run --privileged --cap-add=ALL -v /lib/modules:/lib/modules -v $(pwn)/keys:/tmp/keys -t openvpn
```

## Install as service (systemd)

Install `docker`, `docker-compose`, `git`

Clone repository
```
mkdir /opt && cd /opt
git clone https://github.com/avin/openvpn-docker-slim.git
``` 

Create `/etc/systemd/system/openvpn-docker.service`
```
[Unit]
Description=OpenVPN Service  
After=docker.service  
Requires=docker.service

[Service]
ExecStart=/usr/local/bin/docker-compose -f /opt/openvpn-docker-slim/docker-compose.yml up
ExecStop=/usr/local/bin/docker-compose -f /opt/openvpn-docker-slim/docker-compose.yml stop -t 2

[Install]
WantedBy=multi-user.target  
```

Install service
```
systemctl enable openvpn-docker.service
```

Enjoy!

## Setup client

Copy `./keys/ovpn.key` to client host.

Use client OpenVPN config:
```
proto tcp-client
remote <your EC2 IP here>        
port 1194                   
dev tun                   
secret "C:\\Program Files\\OpenVPN\\config\\ovpn.key"            
redirect-gateway def1       
ifconfig 10.4.0.2 10.4.0.1
```