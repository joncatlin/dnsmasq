# Running the continaer

$ sudo docker run -d --net host --name dnsmasq --restart always --privileged joncatlin/dnsmasq

The container seems to need --privileged, if not it throws the following 'error ARP-cache injection failed: Operation not permitted'.

In looking on line various people have said that --privileged fixes this. 

## NOTE
Look into ways to remove --privilged as this is a potentiual security risk.

