This took me a while to figure out, but now that I know all the steps, I've been able to set up Site-to-Site VPNs from the PIX to all kinds of different devices. The important thing to remember is that the ISAKMP and IPsec settings need to match *exactly* on both sides of the tunnel.

The first thing I do is create object groups for my local and remote networks. I use these object groups throughout my configuration:

    object-group network VpnLocal
    network-object 192.168.180.0 255.255.255.0
    exit
    object-group network VpnRemote
    network-object 192.168.1.0 255.255.255.0
    exit

Enable IKE on the outside interface.

    isakmp enable outside
    isakmp identity address

You need to create at least one ISAKMP policy. Note that if you create multiple ISAKMP policies, the PIX will just cycle through them (from lowest to highest priority) until it finds a match. I like to use the settings below:

    isakmp policy <priority> authentication pre-share
    isakmp policy <priority> encryption 3des
    isakmp policy <priority> hash sha
    isakmp policy <priority> group 2
    isakmp policy <priority> lifetime 28800

Configure the ISAKMP key for this tunnel. The key is basically like a password that needs to be the same on both sides of the tunnel. The "remote IP" here is the IP address of the device on the other side of the tunnel:

    isakmp key <the key> address <remote ip> netmask 255.255.255.255

Allow IPsec traffic to traverse the PIX.

    sysopt connection permit-ipsec

Since I like to use 3DES and SHA, I create the following IPsec transform set:

    crypto ipsec transform-set ESP-3DES-SHA esp-3des esp-sha-hmac

Create an access list so that the PIX knows what traffic to send over the tunnel. Note that the "VPN ID" can be whatever you want. Since I might have several tunnels configured on the same PIX, this is just a convention I use so that I know which access list goes with which crypto map (see below):

    access-list outside_cryptomap_<vpn id> permit ip object-group VpnLocal object-group VpnRemote

Configure a static crypto map for this tunnel. Just like in the ISAKMP config above, the "remote IP" here is the IP address of the device on the other side of the tunnel:

    crypto map outside_map <vpn id> ipsec-isakmp
    crypto map outside_map <vpn id> match address outside_cryptomap_<vpn id>
    crypto map outside_map <vpn id> set peer <remote ip>
    crypto map outside_map <vpn id> set transform-set ESP-3DES-SHA

Prevent VPN traffic from being NAT'ed:

    access-list inside_outbound_nat0_acl permit ip object-group VpnLocal object-group VpnRemote
    nat (inside) 0 access-list inside_outbound_nat0_acl

Apply the crypto map to outside interface:

    crypto map outside_map interface outside

And that's it for a typical site-to-site VPN! You can test it by pinging a device on one side of the tunnel from the other.

Now one thing you may have noticed is that the IP address of the remote VPN device is hard-coded throughout the config. This may lead you to believe that a static IP address is required on both sides of the tunnel, but that's not the case! It's also possible to create something called a Dynamic-to-Static VPN, in which the central endpoint does not know the IP addresses of the peer endpoints. All you need is a *dynamic* crypto map instead of the usual static maps for each peer. Notice that in the example below, the crypto map has a priority of 65535, which puts it at the end of the list. In other words, it's a “catchall” for peers that don't have a static crypto map:

    crypto dynamic-map outside_dyn_map 10 set transform-set ESP-3DES-SHA
    crypto map outside_map 65535 ipsec-isakmp dynamic outside_dyn_map

You also need to create a dynamic ISAKMP key (i.e. one that applies to all hosts).

    isakmp key <the key> address 0.0.0.0 netmask 0.0.0.0

Lastly, you may find the following commands useful for troubleshooting:

* **show isakmp sa** - Displays the current status of ISAKMP SAs
* **show crypto ipsec sa** - Displays the current status of IPSec SAs (useful for ensuring traffic is being encrypted)
* **clear crypto isakmp sa** - Clears ISAKMP SAs
* **clear crypto ipsec sa** - Clears IPSec SAs
* **debug crypto isakmp** - Displays ISAKMP (IKE) communications between the PIX Firewall and IPSec peers
* **debug crypto ipsec** - Displays IPSec communications between the PIX Firewall and IPSec peers

