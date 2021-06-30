#!/bin/sh

echo "address=/.localhost/$HOST_IP" > /etc/dnsmasq.conf
echo "$ADD_CONF" >> /etc/dnsmasq.conf

dnsmasq -k
