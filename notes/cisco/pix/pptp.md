If you have a PPTP server, and you just want to allow PPTP traffic to pass through the PIX, all you need is one line:

    fixup protocol pptp 1723

But did did you know the PIX has its own built-in PPTP server? Here's how you configure it:

First you need to permit incoming PPTP traffic:

    sysopt connection permit-pptp

Create a new IP pool. PPTP clients will be assigned IP addresses from this pool:

    ip local pool <pool name> 192.168.180.100-192.168.180.125

Now you need to create your PPTP users.

    vpdn username <username> password <password>

Create a PPTP group. The group is what holds all the PPTP settings that clients need in order to connect:

    vpdn group <group name> accept dialin pptp
    vpdn group <group name> client configuration address local <pool name>
    vpdn group <group name> ppp authentication mschap
    vpdn group <group name> ppp encryption mppe 128 required
    vpdn group <group name> pptp echo 60
    vpdn group <group name> client authentication local
    vpdn group <group name> client configuration dns <dns server address>
    vpdn enable outside

Finally, ensure that PPTP clients are not NAT'ed:

    access-list inside_outbound_nat0_acl permit ip LAN 255.255.255.0 LAN 255.255.255.0
    nat (inside) 0 access-list inside_outbound_nat0_acl
