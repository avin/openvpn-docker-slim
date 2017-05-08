FROM alpine:3.5
MAINTAINER Avin Grape <carcinogen75@gmail.com>

# Install base packages
RUN apk update && \
    apk add openvpn iptables
    
# Add files to container
ADD openvpn.conf /etc/openvpn/
ADD run.sh /tmp/

# Setup openvpn keys
WORKDIR /etc/openvpn
RUN openvpn --genkey --secret ovpn.key && \
    mkdir /data/keys -p && \
    chmod 600 ovpn.key && \
    cp /etc/openvpn/ovpn.key /data/keys/

CMD /tmp/run.sh