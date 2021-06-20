FROM andyshinn/dnsmasq
LABEL maintainer "seiyu-nico <yuseiishii141+docker@gmail.com>"

COPY --chown=root:root entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN mkdir /var/log/dnsmasq

ENTRYPOINT ["/entrypoint.sh"]
