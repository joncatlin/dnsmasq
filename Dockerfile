FROM alpine:edge

# fetch dnsmasq
RUN apk update \
	&& apk --no-cache add dnsmasq

# copy the configuration and the hosts file
COPY dnsmasq-bond0.conf /etc/dnsmasq-bond0.conf
COPY dnsmasq-eth0.conf /etc/dnsmasq-eth0.conf
COPY hosts /etc/hosts

#configure dnsmasq
#run mkdir -p /etc/default/
#RUN echo -e "ENABLED=1\nIGNORE_RESOLVCONF=yes" > /etc/default/dnsmasq

EXPOSE 53 53/udp
EXPOSE 67 67/udp
#ENTRYPOINT ["dnsmasq", "-k -d --log-async=25"]
#ENTRYPOINT ["dnsmasq", "-k", "-q", "--log-async=25", "--log-dhcp"]
ENTRYPOINT ["dnsmasq", "-d"]
