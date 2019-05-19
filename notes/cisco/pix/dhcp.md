I much prefer to use a more full-featured and robust DHCP server (such as [ISC DHCP](https://www.isc.org/software/dhcp)) but the PIX's built-in DHCP server works well enough for small networks.

    dhcpd address 192.168.180.100-192.168.180.200 inside
    dhcpd dns 192.168.180.2
    dhcpd enable inside

Note that the PIX's inside IP address must be on the same subnet as the addresses in the DHCP range.
