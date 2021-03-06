# Introduction
A copy of DNSMASQ running in a container to act as both DHCP server and DynamicDNS.

# Build the container
Clone the repo on the target device and then issue the following command
```
sudo docker build -t joncatlin/dnsmasq .
```
# Saving and loading the container
Use the following command to save the image so it can be transported to the server to run dnsmasq
```
docker save joncatlin/dnsmasq > dnsmasq.tar
```
Once the image file has been moved to the server, use the following command to load it into the docker image registry.
```
docker load < dnsmasq.tar
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

