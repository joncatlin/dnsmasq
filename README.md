# Introduction
A copy of DNSMASQ running in a container to act as both DHCP server and DynamicDNS.

# Build the container
Clone the repo on the target device and then issue the following command
```
sudo docker build -t joncatlin/dnsmasq .
```
# Running the container
First stop the existing dnsmasq, remove it and then start the new oone using the following commands
```
 sudo docker stop dnsmasq
 sudo docker rm dnsmasq
 sudo docker run -d --net host --name dnsmasq --restart always --privileged joncatlin/dnsmasq
```

The container seems to need --privileged, if not it throws the following 'error ARP-cache injection failed: Operation not permitted'.

In looking on line various people have said that --privileged fixes this. 

## NOTE
Look into ways to remove --privilged as this is a potentiual security risk.

